//
//  WebService.swift
//  CryptoCrazy
//
//  Created by Muhammet Kadir on 18.03.2023.
//

import Foundation

class WebService{
    func downloadCurrencies(url:URL, completion: @escaping ([CryptoCurrency]?) -> ()){
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error{
                print(error.localizedDescription ?? "Error")
                completion(nil)
            }else if let data = data{
                let cryptoList = try? JSONDecoder().decode([CryptoCurrency].self, from: data)
                print(cryptoList)
                
                if let cryptoList = cryptoList{
                    completion(cryptoList)
                }
            }
        }.resume()
    }
}

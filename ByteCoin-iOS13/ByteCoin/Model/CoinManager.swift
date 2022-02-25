//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func updateCoinRate(_ coinManager: CoinManager, _ response: Response)
    
    func didFailWithError(_ error: Error)
}

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC/"
    let apiKey = "?apikey=85BA0F36-6980-4F42-BF18-5E91D8B8FCEC"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    
    var delegate: CoinManagerDelegate?
    
    func getCoinName(for row: Int) -> String {
        return currencyArray[row]
    }
    
    func getCoinPrice(for currency: String) {
        let urlString = baseURL + currency + apiKey
        performRequest(urlString)
        
        
    }
    
    func performRequest(_ urlString: String) {
        let url = URL(string: urlString)!
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response,  error in
            if error != nil {
                self.delegate?.didFailWithError(error!)
                return
            }
            if let safeData = data {
                if let rate = self.parseJSON(responseData: safeData) {
                    self.delegate?.updateCoinRate(self, rate)
                }
            }
        }
        task.resume()
    }
    
    func parseJSON(responseData: Data) -> Response? {
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(Response.self, from: responseData)
            let rate = decodedData.rate
            let currency = decodedData.asset_id_quote
            let response = Response(rate: rate, asset_id_quote: currency)
            
            print(response)
            
            return response
            
        } catch {
            delegate?.didFailWithError(error)
            return nil
        }
    }
    
}

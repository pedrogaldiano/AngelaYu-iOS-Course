//
//  WeatherManager.swift
//  Clima
//
//  Created by PEDRO GALDIANO DE CASTRO on 03/02/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

protocol WeatherManagerDelegate {
    
    func didUpdateWeather(_ weatherManager: WeatherManager,
                          _ weather: WeatherModel)
    
    func didFailWithError(_ error: Error)
}

struct WeatherManager {
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?" +
    "appid=2071c531ae22dee3234802fcca699471" +
    "&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName: String) {
        if cityName != "" {
            let urlString = weatherURL + "&q=\(cityName)"
            performRequest(urlString)
        }
    }
    
    func fetchWeather(lat: CLLocationDegrees, lon: CLLocationDegrees) {
            let urlString = weatherURL + "&lat=\(lat)&lon=\(lon)"
        print(urlString)
            performRequest(urlString)
        }
    
    func performRequest(_ urlString: String) {
        if let url = URL(string: urlString) {
            
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    self.delegate?.didFailWithError(error!)
                    return
                }
                if let safeData = data {
                    if let weather = self.parseJSON(weatherData: safeData) {
                        self.delegate?.didUpdateWeather(self, weather)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            return weather
            
        } catch {
            delegate?.didFailWithError(error)
            return nil
        }
    }
    
}

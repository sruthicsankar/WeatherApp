//
//  WeatherService.swift
//  WeatherApp
//
//  Created by sruthi c sankar on 06/08/25.
//

import Foundation

protocol WeatherServiceProtocol {
   func fetchCityTemperatures() async throws -> [CityTemperature]
   }

 final class WeatherService: WeatherServiceProtocol {
   func fetchCityTemperatures() async throws -> [CityTemperature] {
     let json = """
      [
       { "city": "Delhi", "temperature": 35 },
       { "city": "Kolkata", "temperature": 37 },
       { "city": "Chennai", "temperature": 40 }
      ]
      """
 let data = Data(json.utf8)
   return try JSONDecoder().decode([CityTemperature].self, from: data)
   }
}


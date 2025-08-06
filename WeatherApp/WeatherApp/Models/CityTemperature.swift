//
//  CityTemperature.swift
//  WeatherApp
//
//  Created by sruthi c sankar on 06/08/25.
//

import Foundation

 struct CityTemperature: Codable, Identifiable {
     let id = UUID()
     let city: String
     let temperature: Int

  var temperatureFahrenheit: Double {
   (Double(temperature) * 9/5) + 32
   }
}


//
//  WeatherListView.swift
//  WeatherApp
//
//  Created by sruthi c sankar on 06/08/25.
//

import SwiftUI

 struct WeatherListView: View {
   @StateObject private var viewModel = WeatherViewModel()

     var body: some View {
      NavigationView {
      List(viewModel.filteredCities) { city in
      VStack(alignment: .leading) {
      Text(city.city)
         .font(.headline)
      Text("Celsius: \(city.temperature)°C")
      Text("Fahrenheit: \(city.temperatureFahrenheit, specifier: "%.1f")°F")
        }
      }
     .navigationTitle("City Temperatures")
     .searchable(text: $viewModel.searchText)
    }
  .task {
 await viewModel.fetchWeather()
  }
 }
}

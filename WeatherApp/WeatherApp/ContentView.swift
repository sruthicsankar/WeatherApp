//
//  ContentView.swift
//  WeatherApp
//
//  Created by sruthi c sankar on 06/08/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: WeatherViewModel

    var body: some View {
        NavigationView {
            List(viewModel.filteredCities) { city in
                VStack(alignment: .leading) {
                    Text(city.city).font(.headline)
                    Text("TEMPERATURE \(city.temperature)°C ")
                        .font(.subheadline)

                        .font(.subheadline)
                }
            }
            .navigationTitle("City Temperatures")
        }
    }
}

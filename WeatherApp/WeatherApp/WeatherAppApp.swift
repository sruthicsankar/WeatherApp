//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by sruthi c sankar on 06/08/25.
//

import SwiftUI

@main
struct WeatherAppApp: App {
    @StateObject private var viewModel = WeatherViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
                .task {
                    await viewModel.fetchWeather()
                }
        }
    }
}

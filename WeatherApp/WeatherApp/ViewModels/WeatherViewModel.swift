//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by sruthi c sankar on 06/08/25.
//

import Foundation
import Combine

@MainActor
final class WeatherViewModel: ObservableObject {
@Published var searchText: String = ""
@Published private(set) var allCities: [CityTemperature] = []
@Published private(set) var filteredCities: [CityTemperature] = []

private var cancellables = Set<AnyCancellable>()
private let service: WeatherServiceProtocol

init(service: WeatherServiceProtocol = WeatherService()) {
self.service = service
bindSearch()
}

func fetchWeather() async {
do {
let cities = try await service.fetchCityTemperatures()
DispatchQueue.main.async {
self.allCities = cities
self.filteredCities = cities
}
} catch {
print("Error fetching data: \(error)")
}
}

private func bindSearch() {
$searchText
.debounce(for: .milliseconds(300), scheduler: RunLoop.main)
.removeDuplicates()
.combineLatest($allCities)
.map { (text, cities) in
cities.filter {
text.isEmpty || $0.city.lowercased().contains(text.lowercased())
}
}
.assign(to: &$filteredCities)
}
}




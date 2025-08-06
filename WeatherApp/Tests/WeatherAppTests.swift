//
//  WeatherAppTests.swift
//  WeatherAppTests
//
//  Created by sruthi c sankar on 06/08/25.
//

import XCTest
import Combine
@testable import WeatherApp

final class WeatherViewModelTests: XCTestCase {
    var viewModel: WeatherViewModel!
    var cancellables: Set<AnyCancellable>!

    override func setUp() {
    super.setUp()
    viewModel = WeatherViewModel(service: MockWeatherService())
    cancellables = []
    }

    override func tearDown() {
    viewModel = nil
    cancellables = nil
    super.tearDown()
    }

    func testSearchFiltersCorrectly() {
    let expectation = XCTestExpectation(description: "Search filters correctly")
    viewModel.searchText = "Del"

    viewModel.$filteredCities
    .dropFirst()
    .sink { cities in
    XCTAssertEqual(cities.count, 1)
    XCTAssertEqual(cities.first?.city, "Delhi")
    expectation.fulfill()
    }
    .store(in: &cancellables)

    Task {
    await viewModel.fetchWeather()
    }

    wait(for: [expectation], timeout: 2.0)
    }
    }

    final class MockWeatherService: WeatherServiceProtocol {
    func fetchCityTemperatures() async throws -> [CityTemperature] {
    [
    CityTemperature(city: "Delhi", temperature: 35),
    CityTemperature(city: "Kolkata", temperature: 37),
    CityTemperature(city: "Chennai", temperature: 40)
    ]
    }
    }

//
//  Extensions.swift
//  WeatherApp
//
//  Created by sruthi c sankar on 06/08/25.
//

import Foundation

// MARK: - Double Rounding Extension
extension Double {
func rounded(toPlaces places: Int) -> Double {
let divisor = pow(10.0, Double(places))
return (self * divisor).rounded() / divisor
}
}

// MARK: - Bundle JSON Loader (for JSON from app or extension)
extension Bundle {
func decode<T: Decodable>(_ type: T.Type, from file: String) -> T? {
guard let url = self.url(forResource: file, withExtension: "json"),
let data = try? Data(contentsOf: url),
let decoded = try? JSONDecoder().decode(T.self, from: data) else {
return nil
}
return decoded
}
}

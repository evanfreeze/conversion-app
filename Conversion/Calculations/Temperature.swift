//
//  Temperature.swift
//  Conversion
//
//  Created by Evan Freeze on 11/23/20.
//

enum Temperature: String, CaseIterable {
    case fahrenheit = "Fahrenheit"
    case celsius = "Celsius"
    case kelvin = "Kelvin"
}

func convertFahrenheit(_ degrees: Double, to newScale: Temperature) -> Double {
    switch newScale {
    case .fahrenheit:
        return degrees
    case .celsius:
        return (degrees - 32.0) / 1.8000
    case .kelvin:
        return ((degrees - 32.0) / 1.8000) + 273.15
    }
}

func convertCelsius(_ degrees: Double, to newScale: Temperature) -> Double {
    switch newScale {
    case .fahrenheit:
        return degrees * 1.8000 + 32.0
    case .celsius:
        return degrees
    case .kelvin:
        return degrees + 273.15
    }
}

func convertKelvin(_ degrees: Double, to newScale: Temperature) -> Double {
    switch newScale {
    case .fahrenheit:
        return (degrees - 273.15) * 1.8000 + 32
    case .celsius:
        return degrees - 273.15
    case .kelvin:
        return degrees
    }
}

func convertTemperature(_ degrees: Double, from: Temperature, to: Temperature) -> String {
    var result: Double
    switch from {
    case .fahrenheit:
        result = convertFahrenheit(degrees, to: to)
    case .celsius:
        result = convertCelsius(degrees, to: to)
    case .kelvin:
        result = convertKelvin(degrees, to: to)
    }
    return "\(degrees) in \(from.rawValue) is \(result) in \(to.rawValue)"
}

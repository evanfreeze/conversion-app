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

func convertToCelsius(_ degrees: Double, unit: Temperature) -> Double {
    switch unit {
    case .celsius:
        return degrees
    case .fahrenheit:
        return (degrees - 32.0) / 1.8000
    case .kelvin:
        return degrees - 273.15
    }
}

func convertFromCelsius(_ degreesCelsius: Double, to newScale: Temperature) -> Double {
    switch newScale {
    case .fahrenheit:
        return degreesCelsius * 1.8000 + 32.0
    case .celsius:
        return degreesCelsius
    case .kelvin:
        return degreesCelsius + 273.15
    }
}

func convertTemperature(_ degrees: Double, from: Temperature, to: Temperature) -> String {
    let degreesInCelsius = convertToCelsius(degrees, unit: from)
    let result = convertFromCelsius(degreesInCelsius, to: to)
    return "\(degrees) in \(from.rawValue) is \(result) in \(to.rawValue)"
}

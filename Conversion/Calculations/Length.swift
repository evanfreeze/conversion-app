//
//  Length.swift
//  Conversion
//
//  Created by Evan Freeze on 11/23/20.
//

enum Length: String, CaseIterable {
    case feet = "Feet"
    case yards = "Yards"
    case miles = "Miles"
    case kilometers = "km"
    case meters = "m"
}

func convertFeet(amount feet: Double, to outputUnit: Length) -> Double {
    switch outputUnit {
    case .feet:
        return feet
    case .yards:
        return feet / 3
    case .miles:
        return feet / 5_280
    case .kilometers:
        return feet * 0.0003048
    case .meters:
        return feet * 0.3048
    }
}

func convertYards(amount yards: Double, to outputUnit: Length) -> Double {
    switch outputUnit {
    case .feet:
        return yards * 3
    case .yards:
        return yards
    case .miles:
        return yards * 0.0005681818
    case .kilometers:
        return yards * 0.0009144
    case .meters:
        return yards * 0.9144
    }
}

func convertMiles(amount miles: Double, to outputUnit: Length) -> Double {
    switch outputUnit {
    case .feet:
        return miles * 5_280
    case .yards:
        return miles * 5_280 / 3
    case .miles:
        return miles
    case .kilometers:
        return miles * 1.609344
    case .meters:
        return miles * 1_609.344
    }
}

func convertKilometers(amount kilometers: Double, to outputUnit: Length) -> Double {
    switch outputUnit {
    case .feet:
        return kilometers * 3_280.84
    case .yards:
        return kilometers * 1_093.613
    case .miles:
        return kilometers * 0.6213710245
    case .kilometers:
        return kilometers
    case .meters:
        return kilometers * 1_000
    }
}

func convertMeters(amount meters: Double, to outputUnit: Length) -> Double {
    switch outputUnit {
    case .feet:
        return meters * 3.28084
    case .yards:
        return meters * 1.093613
    case .miles:
        return meters * 0.0006213712
    case .kilometers:
        return meters / 1_000
    case .meters:
        return meters
    }
}

func convertLength(_ amount: Double, from: Length, to: Length) -> String {
    var result: Double
    switch from {
    case .feet:
        result = convertFeet(amount: amount, to: to)
    case .yards:
        result = convertYards(amount: amount, to: to)
    case .miles:
        result = convertMiles(amount: amount, to: to)
    case .kilometers:
        result = convertKilometers(amount: amount, to: to)
    case .meters:
        result = convertMeters(amount: amount, to: to)
    }
    return "\(amount) \(from) is \(result) \(to)"
}

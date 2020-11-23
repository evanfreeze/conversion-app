//
//  Length.swift
//  Conversion
//
//  Created by Evan Freeze on 11/23/20.
//

enum Length: String, CaseIterable {
    case feet = "feet"
    case yards = "yards"
    case miles = "miles"
    case kilometers = "km"
    case meters = "m"
}

func convertToMeters(_ amount: Double, unit: Length) -> Double {
    switch unit {
    case .feet:
        return amount * 0.3048
    case .yards:
        return amount * 0.9144
    case .miles:
        return amount * 1_609.344
    case .kilometers:
        return amount * 1_000
    case .meters:
        return amount
    }
}

func convertFromMeters(_ meters: Double, to outputUnit: Length) -> Double {
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
    let amountInMeters = convertToMeters(amount, unit: from)
    let result = convertFromMeters(amountInMeters, to: to)
    return "\(amount) \(from.rawValue) is \(result) \(to.rawValue)"
}

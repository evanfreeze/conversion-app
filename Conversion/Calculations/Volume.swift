//
//  Volume.swift
//  Conversion
//
//  Created by Evan Freeze on 11/23/20.
//

enum Volume: String, CaseIterable {
    case mililiters = "mL"
    case liters = "L"
    case ounces = "fl. oz."
    case cups = "cups"
    case pints = "pints"
    case gallons = "gallons"
}

func convertToMililiters(_ amount: Double, from: Volume) -> Double {
    switch from {
    case .mililiters:
        return amount
    case .liters:
        return amount * 1_000
    case .ounces:
        return amount * 29.5735
    case .cups:
        return amount * 236.588
    case .pints:
        return amount * 473.176
    case .gallons:
        return amount * 3_785.41
    }
}

func convertFromMililiters(_ mL: Double, to: Volume) -> Double {
    switch to {
    case .mililiters:
        return mL
    case .liters:
        return mL * 0.001
    case .ounces:
        return mL * 0.03381413
    case .cups:
        return mL * 0.00422675
    case .pints:
        return mL * 0.00211338
    case .gallons:
        return mL * 0.000264172
    }
}

func convertVolume(_ amount: Double, from: Volume, to: Volume) -> String {
    let amountInMililiters = convertToMililiters(amount, from: from)
    let result = convertFromMililiters(amountInMililiters, to: to)
    return "\(amount) \(from.rawValue) is \(result) \(to.rawValue)"
}

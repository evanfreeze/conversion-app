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
    case cups = "Cups"
    case pints = "Pints"
    case gallons = "Gallons"
}

func convertMililiters(_ mL: Double, to: Volume) -> Double {
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

func convertLiters(_ liters: Double, to: Volume) -> Double {
    switch to {
    case .mililiters:
        return liters * 1_000
    case .liters:
        return liters
    case .ounces:
        return liters * 33.814
    case .cups:
        return liters * 4.22675
    case .pints:
        return liters * 2.11338
    case .gallons:
        return liters * 0.264172
    }
}

func convertOunces(_ flOz: Double, to: Volume) -> Double {
    switch to {
    case .mililiters:
        return flOz * 29.5735
    case .liters:
        return flOz * 0.0295735
    case .ounces:
        return flOz
    case .cups:
        return flOz * 0.125
    case .pints:
        return flOz * 0.0625
    case .gallons:
        return flOz * 0.0078125
    }
}

func convertCups(_ cups: Double, to: Volume) -> Double {
    switch to {
    case .mililiters:
        return cups * 236.588
    case .liters:
        return cups * 0.236588
    case .ounces:
        return cups * 8
    case .cups:
        return cups
    case .pints:
        return cups * 0.5
    case .gallons:
        return cups * 0.0625
    }
}

func convertPints(_ pints: Double, to: Volume) -> Double {
    switch to {
    case .mililiters:
        return pints * 473.176
    case .liters:
        return pints * 0.473176
    case .ounces:
        return pints * 16
    case .cups:
        return pints * 2
    case .pints:
        return pints
    case .gallons:
        return pints * 0.125
    }
}

func convertGallons(_ gallons: Double, to: Volume) -> Double {
    switch to {
    case .mililiters:
        return gallons * 3_785.41
    case .liters:
        return gallons * 3.78541
    case .ounces:
        return gallons * 128
    case .cups:
        return gallons * 16
    case .pints:
        return gallons * 8
    case .gallons:
        return gallons
    }
}

func convertVolume(_ amount: Double, from: Volume, to: Volume) -> String {
    var result: Double
    switch from {
    case .mililiters:
        result = convertMililiters(amount, to: to)
    case .liters:
        result = convertLiters(amount, to: to)
    case .ounces:
        result = convertOunces(amount, to: to)
    case .cups:
        result = convertCups(amount, to: to)
    case .pints:
        result = convertPints(amount, to: to)
    case .gallons:
        result = convertGallons(amount, to: to)
    }
    return "\(amount) \(from.rawValue) is \(result) \(to.rawValue)"
}

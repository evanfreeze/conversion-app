//
//  Time.swift
//  Conversion
//
//  Created by Evan Freeze on 11/23/20.
//

enum Time: String, CaseIterable {
    case seconds = "Seconds"
    case minutes = "Minutes"
    case hours = "Hours"
    case days = "Days"
    case weeks = "Weeks"
}

func convertToSeconds(_ amount: Double, unit: Time) -> Double {
    switch unit {
    case .seconds:
        return amount
    case .minutes:
        return amount * 60
    case .hours:
        return amount * 60 * 60
    case .days:
        return amount * 60 * 60 * 24
    case .weeks:
        return amount * 60 * 60 * 24 * 7
    }
}

func convertFromSeconds(_ seconds: Double, to: Time) -> Double {
    switch to {
    case .seconds:
        return seconds
    case .minutes:
        return seconds / 60
    case .hours:
        return seconds / 60 / 60
    case .days:
        return seconds / 60 / 60 / 24
    case .weeks:
        return seconds / 60 / 60 / 24 / 7
    }
}

func convertTime(_ amount: Double, from: Time, to: Time) -> String {
    let amountInSeconds = convertToSeconds(amount, unit: from)
    let result = convertFromSeconds(amountInSeconds, to: to)
    return "\(amount) \(from) is \(result) \(to)"
}

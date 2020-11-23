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

func convertSeconds(_ seconds: Double, to: Time) -> Double {
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

func convertMinutes(_ minutes: Double, to: Time) -> Double {
    switch to {
    case .seconds:
        return minutes * 60
    case .minutes:
        return minutes
    case .hours:
        return minutes / 60
    case .days:
        return minutes / 60 / 24
    case .weeks:
        return minutes / 60 / 24 / 7
    }
}

func convertHours(_ hours: Double, to: Time) -> Double {
    switch to {
    case .seconds:
        return hours * 60 * 60
    case .minutes:
        return hours * 60
    case .hours:
        return hours
    case .days:
        return hours / 24
    case .weeks:
        return hours / 24 / 7
    }
}

func convertDays(_ days: Double, to: Time) -> Double {
    switch to {
    case .seconds:
        return days * 24 * 60 * 60
    case .minutes:
        return days * 24 * 60
    case .hours:
        return days * 24
    case .days:
        return days
    case .weeks:
        return days / 7
    }
}

func convertWeeks(_ weeks: Double, to: Time) -> Double {
    switch to {
    case .seconds:
        return weeks * 7 * 24 * 60 * 60
    case .minutes:
        return weeks * 7 * 24 * 60
    case .hours:
        return weeks * 7 * 24
    case .days:
        return weeks * 7
    case .weeks:
        return weeks
    }
}

func convertTime(_ amount: Double, from: Time, to: Time) -> String {
    var result: Double
    switch from {
    case .seconds:
        result = convertSeconds(amount, to: to)
    case .minutes:
        result = convertMinutes(amount, to: to)
    case .hours:
        result = convertHours(amount, to: to)
    case .days:
        result = convertDays(amount, to: to)
    case .weeks:
        result = convertWeeks(amount, to: to)
    }
    return "\(amount) \(from) is \(result) \(to)"
}

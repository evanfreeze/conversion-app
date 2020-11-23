//
//  ContentView.swift
//  Conversion
//
//  Created by Evan Freeze on 11/22/20.
//

import SwiftUI

struct ContentView: View {
    @State private var type = ""
    @State private var amount = ""
    @State private var fromUnit = ""
    @State private var toUnit = ""
    
    var unitOptionsForType: [String] {
        switch type {
        case "Length":
            return Length.allCases.map({ $0.rawValue })
        case "Temperature":
            return Temperature.allCases.map({ $0.rawValue })
        case "Time":
            return Time.allCases.map({ $0.rawValue })
        case "Volume":
            return Volume.allCases.map({ $0.rawValue })
        default:
            return []
        }
    }
    
    var results: String {
        if type.isEmpty {
            return "Select a Conversion Type"
        }
        
        if amount.isEmpty {
            return "Enter an amount"
        }
        
        guard let amount = Double(amount) else {
            return "Amount isn't a valid number"
        }
        
        switch type {
        case "Length":
            guard let fromUnit = Length(rawValue: fromUnit) else {
                return "Select a 'From' unit"
            }
            guard let toUnit = Length(rawValue: toUnit) else {
                return "Select a 'To' unit"
            }
            return convertLength(amount, from: fromUnit, to: toUnit)
        case "Temperature":
            guard let fromUnit = Temperature(rawValue: fromUnit) else {
                return "Select a 'From' unit"
            }
            
            guard let toUnit = Temperature(rawValue: toUnit) else {
                return "Select a 'To' unit"
            }
            return convertTemperature(amount, from: fromUnit, to: toUnit)
        case "Time":
            guard let fromUnit = Time(rawValue: fromUnit) else {
                return "Select a 'From' unit"
            }
            guard let toUnit = Time(rawValue: toUnit) else {
                return "Select a 'To' unit"
            }
            return convertTime(amount, from: fromUnit, to: toUnit)
        case "Volume":
            guard let fromUnit = Volume(rawValue: fromUnit) else {
                return "Select a 'From' unit"
            }
            guard let toUnit = Volume(rawValue: toUnit) else {
                return "Select a 'To' unit"
            }
            return convertVolume(amount, from: fromUnit, to: toUnit)
        default:
            return "Select a conversion type"
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Type")) {
                    Picker("Conversion type", selection: $type) {
                        ForEach(ConversionType.allCases, id: \.rawValue) { conversionType in
                            Text(conversionType.rawValue)
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Amount to convert")) {
                    TextField("Amount", text: $amount)
                        .keyboardType(.decimalPad)
                }
                Section(header: Text("From")) {
                    Picker("From unit", selection: $fromUnit) {
                        ForEach(unitOptionsForType, id: \.self) { option in
                            Text(option)
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("To")) {
                    Picker("To unit", selection: $toUnit) {
                        ForEach(unitOptionsForType, id: \.self) { option in
                            Text(option)
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Result")) {
                    Text(results)
                }
            }
            .navigationTitle("Conversion")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

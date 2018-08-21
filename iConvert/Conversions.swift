//
//  Conversions.swift
//  iConvert
//
//  Created by Denny Mathew on 8/22/18.
//  Copyright © 2018 Cabot. All rights reserved.
//

import Foundation

struct Conversions {

    static let conversions: [(title: String, units: [Dimension])] = [
        (title: "Distance", units: [UnitLength.astronomicalUnits, UnitLength.centimeters, UnitLength.feet, UnitLength.inches, UnitLength.kilometers, UnitLength.lightyears, UnitLength.meters, UnitLength.miles, UnitLength.millimeters, UnitLength.parsecs, UnitLength.yards]),
        (title: "Duration", units: [UnitDuration.hours, UnitDuration.minutes, UnitDuration.seconds]),
        (title: "Mass", units: [UnitMass.grams, UnitMass.kilograms, UnitMass.ounces, UnitMass.pounds, UnitMass.stones, UnitMass.metricTons]),
        (title: "Temperature", units: [UnitTemperature.celsius, UnitTemperature.fahrenheit, UnitTemperature.kelvin]),
        (title: "Volume", units: [UnitVolume.bushels, UnitVolume.cubicFeet, UnitVolume.cups, UnitVolume.fluidOunces, UnitVolume.gallons, UnitVolume.liters, UnitVolume.milliliters, UnitVolume.pints, UnitVolume.quarts, UnitVolume.tablespoons, UnitVolume.teaspoons]),
        ]
}

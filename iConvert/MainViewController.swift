//
//  ViewController.swift
//  iConvert
//
//  Created by Denny Mathew on 8/22/18.
//  Copyright © 2018 Cabot. All rights reserved.
//

import Cocoa

class MainViewController: NSViewController {

    let conversions = Conversions.conversions

    // MARK:- Properties
    @IBOutlet weak var scUntitType: NSSegmentedControl!
    @IBOutlet weak var tfAmount: NSTextField!
    @IBOutlet weak var btnFromUnit: NSPopUpButton!
    @IBOutlet weak var btnToUnit: NSPopUpButton!
    @IBOutlet weak var lblResult: NSTextField!

    // MARK:- Actions
    @IBAction func actUnitChanged(_ sender: NSSegmentedControl) {
        didChangeUnit()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    func setupUI() {

        scUntitType.segmentCount = conversions.count

        for (index, conversion) in conversions.enumerated() {
            scUntitType.setLabel(conversion.title, forSegment: index)
        }

        scUntitType.selectedSegment = 0
        actUnitChanged(self.scUntitType)
    }

    func didChangeUnit() {

        //Make Sure we have a valid unit type selected
        guard scUntitType.selectedSegment != -1 else { return }

        //Remove all existing items from the popup button
        btnFromUnit.removeAllItems()
        btnToUnit.removeAllItems()

        //Set the conversion selected
        let conversion = conversions[scUntitType.selectedSegment]

        //Prepare a measurement format that we can use with each unit
        let formatter = MeasurementFormatter()
        formatter.unitStyle = .long

        //Repeat the same code for both the popup buttons
        for button in [btnFromUnit, btnToUnit] {

            //Loop over all the units in our selected conversion
            for unit in conversion.units {

                //Get the formatter name for the unit
                let unitName = formatter.string(from: unit)

                //Create an NSMenuItem from the title pointing it at updateResults() method
                let item = NSMenuItem(title: unitName, action: #selector(updateResult), keyEquivalent: "")

                //Add the menu item to the current button
                button?.menu?.addItem(item)
            }
        }

        //Selected first and second items from the from and to buttons respectively
        btnFromUnit.selectItem(at: 0)
        btnToUnit.selectItem(at: 1)

        //Update the Results Label
        updateResult()
    }

    @objc func updateResult() {

        //Exit if we are missing the necessary inputs
        guard scUntitType.selectedSegment != -1 else { return }
        guard btnFromUnit.indexOfSelectedItem != -1 else { return }
        guard btnToUnit.indexOfSelectedItem != -1 else { return }

        let input = tfAmount.doubleValue

        //Pull out the conversion they selected
        let conversion = conversions[scUntitType.selectedSegment]

        //Read the from Unit
        let from = conversion.units[btnFromUnit.indexOfSelectedItem]

        //Read the to unit
        let to = conversion.units[btnToUnit.indexOfSelectedItem]

        //Conversion
        let inputMeasurement = Measurement(value: input, unit: from)
        let outputMeasurement = inputMeasurement.converted(to: to)

        //Format the result
        let formatter = MeasurementFormatter()
        formatter.unitOptions = .providedUnit
        lblResult.stringValue = formatter.string(from: outputMeasurement)
    }

    //textField Delegate
    override func controlTextDidChange(_ obj: Notification) {
        updateResult()
    }
}


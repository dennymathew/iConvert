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

    @objc func updateResult() {
        
    }

}


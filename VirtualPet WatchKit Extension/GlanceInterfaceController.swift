//
//  GlanceInterfaceController.swift
//  VirtualPet
//
//  Created by Liuqing Du on 31/05/2015.
//  Copyright (c) 2015 JuneDesign. All rights reserved.
//

import WatchKit
import Foundation


class GlanceInterfaceController: WKInterfaceController {
    
    @IBOutlet weak var healthLabel: WKInterfaceLabel!
    @IBOutlet weak var cleanessLabel: WKInterfaceLabel!
    @IBOutlet weak var moodLabel: WKInterfaceLabel!
    
    func initLabel() {
        let timer: NSTimer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "updateLabel:", userInfo: nil, repeats: true)
    }
    
    func updateLabel(timer: NSTimer) {
        healthLabel.setText("Health: \(pet.getHealth())")
        cleanessLabel.setText("Cleaness: \(pet.getCleaness())")
        moodLabel.setText("Mood: \(pet.getMood())")
    }

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        initLabel()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}

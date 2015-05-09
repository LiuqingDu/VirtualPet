//
//  InterfaceController.swift
//  VirtualPet WatchKit Extension
//
//  Created by Liuqing Du on 07/05/2015.
//  Copyright (c) 2015 JuneDesign. All rights reserved.
//

import WatchKit
import Foundation


class VirtualPetInterfaceController: WKInterfaceController {
    
    var pet: Pet!
    
    static var vpic:VirtualPetInterfaceController!
    
    @IBOutlet weak var healthLabel: WKInterfaceLabel!
    @IBOutlet weak var cleanessLabel: WKInterfaceLabel!
    @IBOutlet weak var moodLabel: WKInterfaceLabel!
    @IBOutlet weak var birthdayLabel: WKInterfaceLabel!
    
    @IBAction func FeedMenuItem() {
        pushControllerWithName("MainMenuTableInterface", context: "Feed")
    }
    
    @IBAction func ActionMenuItem() {
        pushControllerWithName("MainMenuTableInterface", context: "Action")
    }
    
    @IBAction func ShopMenuItem() {
        pushControllerWithName("MainMenuTableInterface", context: "Shop")
    }
    
    @IBAction func FriendMenuItem() {
        pushControllerWithName("MainMenuTableInterface", context: "Friends")
    }
    
    func initVirtualPet() {
        if (pet == nil) {
            
            pet = Pet(name: "aaa")
            VirtualPetInterfaceController.vpic = self
            
            pet.decreaseHealthBy(50)
            
        }
        refreshCondition()
        
    }
    
    func refreshCondition() {
        setTitle(pet.getName())
        healthLabel.setText("Health: \(pet.getHealth())")
        cleanessLabel.setText("Cleaness: \(pet.getCleaness())")
        moodLabel.setText("Mood: \(pet.getMood())")
        birthdayLabel.setText("Birthday: \(pet.getBirthdayString())")
        
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        initVirtualPet()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
}

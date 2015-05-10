//
//  InterfaceController.swift
//  VirtualPet WatchKit Extension
//
//  Created by Liuqing Du on 07/05/2015.
//  Copyright (c) 2015 JuneDesign. All rights reserved.
//

import WatchKit
import Foundation

var pet: Pet!

var menuData = NSArray(contentsOfFile: NSBundle.mainBundle().pathForResource("MenuItemsData", ofType: "plist")!)!

class VirtualPetInterfaceController: WKInterfaceController {
    
    @IBOutlet weak var healthLabel: WKInterfaceLabel!
    @IBOutlet weak var cleanessLabel: WKInterfaceLabel!
    @IBOutlet weak var moodLabel: WKInterfaceLabel!
    @IBOutlet weak var birthdayLabel: WKInterfaceLabel!
    
    static var mainInterface: VirtualPetInterfaceController!
    
    @IBAction func FeedMenuItem() {
        pushControllerWithName("MainMenuTableInterface", context: 0)
    }
    
    @IBAction func ActionMenuItem() {
        pushControllerWithName("MainMenuTableInterface", context: 1)
    }
    
    @IBAction func ShopMenuItem() {
        pushControllerWithName("MainMenuTableInterface", context: 2)
    }
    
    @IBAction func FriendMenuItem() {
        pushControllerWithName("MainMenuTableInterface", context: 3)
    }
    
    func initVirtualPet() {
        if (pet == nil) {
            
            pet = Pet(name: "aaa")
            
            pet.decreaseHealthBy(50)
            
        }
        
        setTitle(pet.getName())
        
        refreshCondition()
        
    }
    
    func refreshCondition() {
        
        if (VirtualPetInterfaceController.mainInterface == nil) {
            VirtualPetInterfaceController.mainInterface = self
        }
        
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

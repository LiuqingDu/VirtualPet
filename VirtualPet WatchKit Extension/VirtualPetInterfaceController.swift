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

var menuData = NSDictionary(contentsOfFile: NSBundle.mainBundle().pathForResource("MenuData", ofType: "plist")!)!

class VirtualPetInterfaceController: WKInterfaceController {
    
    @IBOutlet weak var healthLabel: WKInterfaceLabel!
    @IBOutlet weak var cleanessLabel: WKInterfaceLabel!
    @IBOutlet weak var moodLabel: WKInterfaceLabel!
    @IBOutlet weak var birthdayLabel: WKInterfaceLabel!
    
    static var mainInterface: VirtualPetInterfaceController!
    
    let cat = [["Feed"], ["Action"], ["Shop"], ["Friends"]]
    
    @IBAction func FeedMenuItem() {
        pushControllerWithName("MainMenuTableInterface", context: cat[0])
    }
    
    @IBAction func ActionMenuItem() {
        pushControllerWithName("MainMenuTableInterface", context: cat[1])
    }
    
    @IBAction func ShopMenuItem() {
        pushControllerWithName("MainMenuTableInterface", context: cat[2])
    }
    
    @IBAction func FriendMenuItem() {
        pushControllerWithName("MainMenuTableInterface", context: cat[3])
    }
    
    func initVirtualPet() {
        if (pet == nil) {
            
            pet = Pet(name: "aaa")
            
            pet.increaseConditionBy(["Health": -50])
            
            presentControllerWithName("CreatePetInterface", context: nil)
            
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
        
        //println("Data: \(data)")
        
        initVirtualPet()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
}

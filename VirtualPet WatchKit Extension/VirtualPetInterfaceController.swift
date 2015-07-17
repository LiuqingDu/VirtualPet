//
//  InterfaceController.swift
//  VirtualPet WatchKit Extension
//
//  Created by Liuqing Du on 07/05/2015.
//  Copyright (c) 2015 JuneDesign. All rights reserved.
//

import WatchKit
import Foundation
import UIKit

var pet: Pet = Pet()

var menuData = NSDictionary(contentsOfFile: NSBundle.mainBundle().pathForResource("MenuData", ofType: "plist")!)!

class VirtualPetInterfaceController: WKInterfaceController {
    
    @IBOutlet weak var healthLabel: WKInterfaceLabel!
    @IBOutlet weak var cleanessLabel: WKInterfaceLabel!
    @IBOutlet weak var moodLabel: WKInterfaceLabel!
    @IBOutlet weak var birthdayLabel: WKInterfaceLabel!
    
    static var mainInterface: VirtualPetInterfaceController!
    
    let defaultData = NSUserDefaults.standardUserDefaults()
    let nameKey = "Name", sexKey = "Sex", birthdayKey = "Birthday", healthKey = "Health", cleanessKey = "Cleaness", moodKey = "Mood", lastDateKey = "LastDate"
    let regNoti = "RegisteredNotification"
    
    let cat = [["Feed"], ["Action"], ["Shop"], ["Friends"]]
    
    var timer: NSTimer? = nil, notify = false
    
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
    
    private func initTimer() {
        
        if (timer == nil) {
            timer = NSTimer.scheduledTimerWithTimeInterval(10.0, target: self, selector: "decreaseHealth:", userInfo: nil, repeats: true)
        }
        
    }
    
    func decreaseHealth(timer: NSTimer) {
        pet.increaseConditionBy(["Health": -1])
    }
    
    func refreshCondition() {
        
        healthLabel.setText("Health: \(pet.getHealth())")
        cleanessLabel.setText("Cleaness: \(pet.getCleaness())")
        moodLabel.setText("Mood: \(pet.getMood())")
        birthdayLabel.setText("Birthday: \(pet.getBirthdayString())")
    }
    
    private func saveData() {
        println("save pet")
        defaultData.setObject(pet.getName(), forKey: nameKey)
        let sex = pet.getSex() == "Male" ? 0 : 1
        defaultData.setInteger(sex, forKey: sexKey)
        defaultData.setObject(pet.getBirthday(), forKey: birthdayKey)
        defaultData.setInteger(pet.getHealth(), forKey: healthKey)
        defaultData.setInteger(pet.getCleaness(), forKey: cleanessKey)
        defaultData.setInteger(pet.getMood(), forKey: moodKey)
        defaultData.setObject(NSDate(), forKey: lastDateKey)
        defaultData.synchronize()
        
        let timeDelay = (pet.getHealth() - 90) * 10
        WKInterfaceController.openParentApplication(["Notification": "Low Health", "Delay": Double(timeDelay)], reply: { (replyInfo, err) -> Void in
            //self.notify = false
        })
    }
    
    private func loadData() {
        println("load pet")
        let name = defaultData.stringForKey(nameKey)
        let sex = defaultData.integerForKey(sexKey)
        let birthday = defaultData.valueForKey(birthdayKey) as! NSDate
        let health = defaultData.integerForKey(healthKey)
        let cleaness = defaultData.integerForKey(cleanessKey)
        let mood = defaultData.integerForKey(moodKey)
        let lastDate = defaultData.valueForKey(lastDateKey) as! NSDate
        pet = Pet(name: name!, sex: sex, birthday: birthday, health: health, cleaness: cleaness, mood: mood)
        
        var timeInterval = NSDate().timeIntervalSinceDate(lastDate)
        pet.increaseConditionBy(["Health": -Int(timeInterval / 10)])
        
        WKInterfaceController.openParentApplication(["Action": "CancelNotification"], reply: { (replyInfo, err) -> Void in
            //self.notify = false
        })
    }
    
    private func registerNotification() {
        //if (!defaultData.boolForKey("RegisteredNotification")) {
            NSNotificationCenter.defaultCenter().removeObserver(self)
            NSNotificationCenter.defaultCenter().addObserver(self, selector:"onDeactivate", name:"NSExtensionHostWillResignActiveNotification", object: nil)
            NSNotificationCenter.defaultCenter().addObserver(self, selector:"onActive", name:"NSExtensionHostDidBecomeActiveNotification",object: nil)
            NSNotificationCenter.defaultCenter().addObserver(self, selector:"onBackground", name:"NSExtensionHostDidEnterBackgroundNotification", object: nil)
            NSNotificationCenter.defaultCenter().addObserver(self, selector:"onForeground", name:"NSExtensionHostWillEnterForegroundNotification", object: nil)
            defaultData.setBool(true, forKey: regNoti)
            defaultData.synchronize()
        //}
    }
    
    override init() {
        super.init()
        
        registerNotification()
        
        if (pet.getName() == "") {
            pet = Pet(name: "aaa")
        }
        
        if (VirtualPetInterfaceController.mainInterface == nil) {
            VirtualPetInterfaceController.mainInterface = self
        }
        
        initTimer()
    }
    
    func onDeactivate() {
        println("onDeactive")
        saveData()
    }
    
    func onActive() {
        println("onActive")
        loadData()
    }
    
    func onBackground() {
        println("onBackground")
    }
    
    func onForeground() {
        println("onForeground")
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        refreshCondition()
        
        println("willActivate")
        //initVirtualPet()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
        println("didDeactivate")
    }
    
}

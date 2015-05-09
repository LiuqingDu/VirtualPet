//
//  MainMenuInterfaceController.swift
//  VirtualPet
//
//  Created by Liuqing Du on 08/05/2015.
//  Copyright (c) 2015 JuneDesign. All rights reserved.
//

import WatchKit
import Foundation


class MainMenuTableInterfaceController: WKInterfaceController {
    
    var cat = ""

    @IBOutlet weak var mainMenuTable: WKInterfaceTable!
    
    let mainMenuItems = ["Feed": ["Food", "Snack", "Fruit", "Drink"],
                    "Action": ["Play", "Dance", "Sing", "Sleep"],
                    "Shop": ["Food", "Snack", "Fruit", "Drink", "Ball", "Shoes", "CD"],
                    "Friends": ["Friend01", "Friend02", "Friend03", "Add Friend"]]
    
    func initMenu() {
        
        setTitle(cat)
        
        mainMenuTable.setNumberOfRows(mainMenuItems[cat]!.count, withRowType: "MainMenuCell")
        
        for (var i = 0; i < mainMenuItems[cat]!.count; i++) {
            let row = mainMenuTable.rowControllerAtIndex(i) as! MainMenuItemRow
            row.mainMenuItemTitle.setText(mainMenuItems[cat]![i])
        }
        
    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        pushControllerWithName("SubMenuTableInterface", context: [cat, mainMenuItems[cat]![rowIndex]])
        
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        
        if (context != nil) {
            cat = context as! String
            
        }
        
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        initMenu()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}

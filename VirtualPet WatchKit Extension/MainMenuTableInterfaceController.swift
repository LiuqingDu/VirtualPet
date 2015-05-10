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
    
    var cat = 0

    @IBOutlet weak var mainMenuTable: WKInterfaceTable!
    
    func initMenu() {
        
        setTitle(menuData[cat][0] as? String)
        
        mainMenuTable.setNumberOfRows(menuData[cat].count - 1, withRowType: "MainMenuCell")
        
        for (var i = 1; i < menuData[cat].count; i++) {
            let row = mainMenuTable.rowControllerAtIndex(i - 1) as! MainMenuItemRow
            row.mainMenuItemTitle.setText(menuData[cat][i][0] as? String)
        }
        
    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        pushControllerWithName("SubMenuTableInterface", context: [cat, rowIndex + 1])
        
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        
        if (context != nil) {
            cat = context as! Int
            
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

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
    
    var cat: [String]!

    @IBOutlet weak var mainMenuTable: WKInterfaceTable!
    
    func initMenu() {
        
        setTitle(cat[0])
        
        //var menus: NSDictionary = data[cat] as! NSDictionary
        
        mainMenuTable.setNumberOfRows(menuData[cat[0]]!.count, withRowType: "MainMenuCell")
        
        for (var i = 0; i < menuData[cat[0]]!.count; i++) {
            let row = mainMenuTable.rowControllerAtIndex(i) as! MainMenuItemRow
            row.mainMenuItemTitle.setText(menuData[cat[0]]!.allKeys[i] as? String)
        }
        
    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        cat.append(menuData[cat[0]]?.allKeys[rowIndex] as! String)
        pushControllerWithName("SubMenuTableInterface", context: cat)
        
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        
        if (context != nil) {
            cat = context as! [String]
            
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

//
//  SubMenuTableInterfaceController.swift
//  VirtualPet
//
//  Created by Liuqing Du on 08/05/2015.
//  Copyright (c) 2015 JuneDesign. All rights reserved.
//

import WatchKit
import Foundation


class SubMenuTableInterfaceController: WKInterfaceController {
    
    var cat: [String]!
    
    @IBOutlet weak var subMenuTable: WKInterfaceTable!

    func initMenu() {
        
        setTitle(cat[1])
        
        subMenuTable.setNumberOfRows(menuData[cat[0]]![cat[1]]!!.count, withRowType: "SubMenuCell")
        
        for (var i = 0; i < menuData[cat[0]]![cat[1]]!!.count; i++) {
            let row = subMenuTable.rowControllerAtIndex(i) as! SubMenuItemRow
            row.subMenuItemTitle.setText(menuData[cat[0]]![cat[1]]!!.allKeys[i] as? String)
        }
        
    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        cat.append(menuData[cat[0]]![cat[1]]!!.allKeys[rowIndex] as! String)
        
        pet.increaseConditionBy(menuData[cat[0]]![cat[1]]!![cat[2]]!! as! [String : Int])
        popToRootController()
        
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

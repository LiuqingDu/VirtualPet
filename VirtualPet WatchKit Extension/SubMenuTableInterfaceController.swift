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
    
    var cat = [String]()
    
    @IBOutlet weak var subMenuTable: WKInterfaceTable!
    
    let subMenuItems = ["Food": ["Rice", "Pancake", "Noodle", "Dumpling"],
                    "Snack": ["Cookie", "Yourgt", "Chocolate", "Candy"],
                    "Fruit": ["Apple", "Banana", "Peal", "Orange"],
                    "Drink": ["Coca", "Pepsi", "7Up", "Sprite"]]
    
    func initMenu() {
        
        setTitle(cat[1])
        
        subMenuTable.setNumberOfRows(subMenuItems[cat[1]]!.count, withRowType: "SubMenuCell")
        
        for (var i = 0; i < subMenuItems[cat[1]]!.count; i++) {
            //println(menuItems[i])
            let row = subMenuTable.rowControllerAtIndex(i) as! SubMenuItemRow
            row.subMenuItemTitle.setText(subMenuItems[cat[1]]![i])
        }
        
    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        switch rowIndex {
        case 0:
            VirtualPetInterfaceController.vpic.pet.increaseHealthBy(10)
            popToRootController()
        default:
            popToRootController()
        }
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

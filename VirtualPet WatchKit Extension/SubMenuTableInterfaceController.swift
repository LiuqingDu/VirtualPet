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
    
    var cat = [Int]()
    
    @IBOutlet weak var subMenuTable: WKInterfaceTable!

    func initMenu() {
        
        setTitle(menuData[cat[0]][cat[1]][0] as? String)
        
        subMenuTable.setNumberOfRows(menuData[cat[0]][cat[1]][1].count, withRowType: "SubMenuCell")
        
        for (var i = 0; i < menuData[cat[0]][cat[1]][1].count; i++) {
            let row = subMenuTable.rowControllerAtIndex(i) as! SubMenuItemRow
            row.subMenuItemTitle.setText(menuData[cat[0]][cat[1]][1][i] as? String)
        }
        
    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        switch cat[0] {
        case 0:
            switch cat[1] {
            case 1:
                switch rowIndex {
                case 0:
                    pet.increaseHealthBy(10)
                    popToRootController()
                    
                default:
                    popToRootController()
                }
                
            default:
                popToRootController()
            }
            
        default:
            popToRootController()
        }
        
    }

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        
        if (context != nil) {
            cat = context as! [Int]
            
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

//
//  PetProperty.swift
//  VirtualPet
//
//  Created by Liuqing Du on 07/05/2015.
//  Copyright (c) 2015 JuneDesign. All rights reserved.
//

import Foundation

enum Sex: Int {
    case Male = 0, Female
}

class PetProperty {
    
    private let name: String
    private let sex: Sex
    private var birthday: NSDate
    
    init(name: String) {
        self.name = name
        self.sex = Sex(rawValue: Int(arc4random()%2))!
        self.birthday = NSDate()
        
    }
    
    init(name: String, sex: Int, birthday: NSDate) {
        self.name = name
        self.sex = Sex(rawValue: sex)!
        self.birthday = birthday
        
    }
    
    func getName() -> String {
        return name
    }
    
    func getSex() -> String {
        switch sex {
        case .Male:
            return "Male"
        case .Female:
            return "Female"
        default:
            return "Unknown"
        }
    }
    
    func getBirthday() -> NSDate {
        return birthday
        
    }
    
    func getBirthdayString() -> String {
        var df = NSDateFormatter()
        df.dateFormat = "dd MMMM"
        return df.stringFromDate(birthday)
        
    }
    
}

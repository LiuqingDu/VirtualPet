//
//  Pet.swift
//  VirtualPet
//
//  Created by Liuqing Du on 07/05/2015.
//  Copyright (c) 2015 JuneDesign. All rights reserved.
//

import Foundation

class Pet {
    
    private let property: PetProperty
    private let condition: PetCondition
    
    convenience init () {
        self.init(name: "test")
        
    }
    
    init(name: String) {
        property = PetProperty(name: name)
        condition = PetCondition()
        
    }
    
    func getName() -> String {
        return property.getName()
        
    }
    
    func getSex() -> String {
        return property.getSex()
        
    }
    
    func getBirthday() -> NSDate {
        return property.getBirthday()
        
    }
    
    func getBirthdayString() -> String {
        return property.getBirthdayString()
        
    }
    
    func increaseConditionBy(dict: [String: Int]) {
        condition.increaseConditionBy(dict)
    }
    
//    func increaseHealthBy(number: Int) {
//        condition.increaseHealthBy(number)
//        
//    }
//    
//    func decreaseHealthBy(number: Int) {
//        condition.decreaseHealthBy(number)
//        
//    }
    
    func getHealth() -> Int{
        return condition.getHealth()
        
    }
    
//    func increaseCleanessBy(number: Int) {
//        condition.increaseCleanessBy(number)
//        
//    }
//    
//    func decreaseCleanessBy(number: Int) {
//        condition.decreaseCleanessBy(number)
//        
//    }
    
    func getCleaness() -> Int {
        return condition.getCleaness()
        
    }
    
//    func increaseMoodBy(number: Int) {
//        condition.increaseMoodBy(number)
//        
//    }
//    
//    func decreaseMoodBy(number: Int) {
//        condition.decreaseMoodBy(number)
//        
//    }
    
    func getMood() -> Int {
        return condition.getMood()
        
    }
    
}
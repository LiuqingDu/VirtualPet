//
//  PetCondition.swift
//  VirtualPet
//
//  Created by Liuqing Du on 07/05/2015.
//  Copyright (c) 2015 JuneDesign. All rights reserved.
//

import Foundation

class PetCondition {
    
    private var condition: [String: Int] = ["Health": 100, "Cleaness": 100, "Mood": 100]
    
    convenience init() {
        self.init(health: 100, cleaness: 100, mood: 100)
    }
    
    init(health: Int, cleaness: Int, mood: Int) {
        updateCondition("Health", value: health)
        updateCondition("Cleaness", value: cleaness)
        updateCondition("Mood", value: mood)
    }
    
    private func updateCondition(key: String, value: Int) {
        condition.updateValue(value, forKey: key)
        if (VirtualPetInterfaceController.mainInterface != nil) {
            VirtualPetInterfaceController.mainInterface.refreshCondition()
        }
        
    }
    
    func increaseConditionBy(dict: [String: Int]) {
        for (key, value) in dict {
            var v = condition[key]! + dict[key]!
            
            v = v > 100 ? 100 : v
            v = v < 0 ? 0 : v
            
            updateCondition(key, value: v)
        }
        
    }
    
//    func increaseHealthBy(number: Int) {
//        health = health + number >= 100 ? 100 : health + number
//        
//    }
//    
//    func decreaseHealthBy(number: Int) {
//        health = health - number <= 0 ? 0 : health - number
//        
//    }
    
    func getHealth() -> Int{
        return condition["Health"]!
        
    }
    
//    func increaseCleanessBy(number: Int) {
//        cleaness = cleaness + number >= 100 ? 100 : cleaness + number
//        
//    }
//    
//    func decreaseCleanessBy(number: Int) {
//        cleaness = cleaness - number <= 0 ? 0 : cleaness - number
//        
//    }
    
    func getCleaness() -> Int {
        return condition["Cleaness"]!
        
    }
    
//    func increaseMoodBy(number: Int) {
//        mood = mood + number >= 100 ? 100 : mood + number
//        
//    }
//    
//    func decreaseMoodBy(number: Int) {
//        mood = mood - number <= 0 ? 0 : mood - number
//        
//    }
    
    func getMood() -> Int {
        return condition["Mood"]!
        
    }
    
}

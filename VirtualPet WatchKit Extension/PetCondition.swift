//
//  PetCondition.swift
//  VirtualPet
//
//  Created by Liuqing Du on 07/05/2015.
//  Copyright (c) 2015 JuneDesign. All rights reserved.
//

import Foundation

class PetCondition {
    
    private var health: Int {
        didSet {
            VirtualPetInterfaceController.vpic.refreshCondition()
        }
    }
    
    private var cleaness: Int {
        didSet {
            VirtualPetInterfaceController.vpic.refreshCondition()
        }
    }

    private var mood: Int {
        didSet {
            VirtualPetInterfaceController.vpic.refreshCondition()
        }
    }
    
    init() {
        health = 100
        cleaness = 100
        mood = 100
    }
    
    func increaseHealthBy(number: Int) {
        health = health + number >= 100 ? 100 : health + number
        
    }
    
    func decreaseHealthBy(number: Int) {
        health = health - number <= 0 ? 0 : health - number
        
    }
    
    func getHealth() -> Int{
        return health
        
    }
    
    func increaseCleanessBy(number: Int) {
        cleaness = cleaness + number >= 100 ? 100 : cleaness + number
        
    }
    
    func decreaseCleanessBy(number: Int) {
        cleaness = cleaness - number <= 0 ? 0 : cleaness - number
        
    }
    
    func getCleaness() -> Int {
        return cleaness
        
    }
    
    func increaseMoodBy(number: Int) {
        mood = mood + number >= 100 ? 100 : mood + number
        
    }
    
    func decreaseMoodBy(number: Int) {
        mood = mood - number <= 0 ? 0 : mood - number
        
    }
    
    func getMood() -> Int {
        return mood
        
    }
    
}

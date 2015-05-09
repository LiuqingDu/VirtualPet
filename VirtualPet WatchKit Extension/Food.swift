//
//  Food.swift
//  VirtualPet
//
//  Created by Liuqing Du on 07/05/2015.
//  Copyright (c) 2015 JuneDesign. All rights reserved.
//

import Foundation

class Food {
    private let property: FoodProperty
    private let condition: FoodCondition
    
    init(name: String, type: FoodType) {
        property = FoodProperty(name: name, type: type)
        condition = FoodCondition()
    }
    
    func getName() -> String {
        return property.getName()
    }
    
    func getType() -> FoodType {
        return property.getType()
        
    }
    
}
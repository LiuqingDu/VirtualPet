//
//  FoodProperty.swift
//  VirtualPet
//
//  Created by Liuqing Du on 07/05/2015.
//  Copyright (c) 2015 JuneDesign. All rights reserved.
//

import Foundation

class FoodProperty {
    private let name: String
    private let type: FoodType
    
    init(name: String, type: FoodType) {
        self.name = name
        self.type = type
        
    }
    
    func getName() -> String {
        return name
        
    }
    
    func getType() -> FoodType {
        return type
        
    }
}
//
//  FoodCondition.swift
//  VirtualPet
//
//  Created by Liuqing Du on 07/05/2015.
//  Copyright (c) 2015 JuneDesign. All rights reserved.
//

import Foundation

class FoodCondition {
    private var quantity: Int
    
    init() {
        quantity = 0
    }
    
    func increaseQuantityBy(number: Int) {
        quantity = number > 0 ? quantity + number : quantity
        
    }
    
    func consumeQuantityBy(number: Int) {
        quantity = number > 0 ? quantity - number : quantity
        
    }
    
}
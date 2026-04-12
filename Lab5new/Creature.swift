//
//  Creature.swift
//  Lab5new
//
//  Created by Rayan Charah on 4/10/26.
//

import SwiftUI
import Foundation

struct Creature {
    // Name does not need to change thus let
    let name: String
    var hunger: Int
    var energy: Int
    
    var statusDescription: String {
            
            
        if (energy < 80 && hunger < 20) {
            
            // Low Energy
            return (name) + " is Low on Energy"
            
        } else if (energy > 80 && hunger > 20) {
            
            // Very Hungry
            return (name) + " is Very Hungry"
            
        } else if (energy < 80 && hunger > 20) {
            
            // Very Hungry and Low Energy
            return (name) + " is Very Hungry and Low on Energy"
            
        }
        
        return (name) + " is Happy and Fed!"

        
    }
    
    
    mutating func eat() {
        
        // Decrease Hunger by 10 Units
        hunger -= 10
        
    }

    mutating func rest() {

        // Increment Energy by 10 Units
        energy += 10
        
        
    }
}

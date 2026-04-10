//
//  Creature.swift
//  Lab5new
//
//  Created by Rayan Charah on 4/10/26.
//

import SwiftUI
import Foundation

struct Creatures {
    // Name does not need to change thus let
    let name: String
    var hunger: Int
    var energy: Int
    
    var statusDescirption: String {
        if (energy > 80 && hunger < 20) {
            
            // Happy
            
        } else if (energy < 80 && hunger < 20) {
            
            // Low Energy
            
        } else if (energy > 80 && hunger > 20) {
            
            // Very Hungry
            
        } else if (energy < 80 && hunger > 20) {
            
            // Very Hungry and Low Energy
            
        }
        
        return "Finish Implementing'"
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

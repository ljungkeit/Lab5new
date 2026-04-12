//
//  Creature.swift
//  Lab5new
//
//  Created by Rayan Charah on 4/10/26.
//

import SwiftUI
import Foundation

class Creature {
    // Name does not need to change thus let
    let name: String
    var hunger: Int
    var energy: Int
                            
    var statusDescription: String

    
    init(name: String, hunger: Int, energy: Int) {
        self.name = name
        self.hunger = hunger
        self.energy = energy
        self.statusDescription = ""
        setStatus()
    }
    
    func setStatus()  {
        var str = ""
        if (energy >= 80 && hunger <= 20) {
            
            str = "Happy"
            
        } else if (energy < 80 && hunger <= 20) {
            
            str = "Low Energy"
            
        } else if (energy >= 80 && hunger > 20) {
            
            str = "Very Hungry"
            
        } else if (energy < 80 && hunger > 20) {
            
            str = "Very Hungry and Low Energy"
            
        }
        statusDescription = str
    }
    func eat() {
        
        // Decrease Hunger by 10 Units
        hunger = max(hunger - 10, 0)
        setStatus()
        
    }

    func rest() {

        // Increment Energy by 10 Units
        energy = min(energy + 10, 100)
        setStatus()
        
        
    }
}

//
//  Creature.swift
//  Lab5new
//
//  Created by Rayan Charah on 4/10/26.
//

// This file defines a basic creature.
// A creature has a name, hunger, energy, and a description.
// Published properties let the user interface read changes and update for screen readers.

import SwiftUI
import Foundation
import Combine

class Creature: ObservableObject {
    // Name does not need to change thus let
    let name: String
    @Published var hunger: Int
    @Published var energy: Int
                            
    @Published var statusDescription: String

    
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
        energy = min(energy + 10, 100)
        setStatus()
    }
}


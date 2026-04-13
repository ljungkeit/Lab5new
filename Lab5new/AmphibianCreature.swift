//
//  AmphibianCreature.swift
//  Lab5new
//
//  Created by Luca Jungkeit on 4/10/26.
//
// This file defines amphibian creatures.
// Amphibians have hydration and can swim.
// Published properties let the UI update and be accessible for users with screen readers.
 
import SwiftUI
import Foundation

class AmphibianCreature: Creature {
    
    //As a flying creature flies, it uses their feathers and they must land to recharge / regrow
    //their feathers.
    var hydration: Int //0 - 100
    
    
    init(name: String, hunger: Int, energy: Int, hydration: Int) {
        self.hydration = hydration
        super.init(name: name, hunger: hunger, energy: energy)
        setStatus()
    }
    
    override func setStatus()  {
        super.setStatus()
        var str: String = ""
        if self.hydration > 0 {
            str += "\nhydration Level: \(self.hydration)"
        }
        else {
            str += "\nNeed to swim!"
        }
        statusDescription += str
    }
    
    func swim() {
        hydration = min(hydration + 10, 100)
        setStatus()
    }
}


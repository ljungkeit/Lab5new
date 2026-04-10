//
//  AmphibianCreature.swift
//  Lab5new
//
//  Created by lending on 4/10/26.
//
//  Amphibian Creatures have a hydration level, in which they must swim in order to maintain. They
//  will be in danger if they dry out for too long.

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
        hydration = max(hydration+10, 0)
        setStatus()
    }
    
}

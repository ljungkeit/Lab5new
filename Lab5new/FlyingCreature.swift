//
//  FlyingCreature.swift
//  Lab5new
//
//  Created by lending on 4/10/26.
//
import SwiftUI
import Foundation

class FlyingCreature: Creature {
    
    //As a flying creature flies, it uses their feathers and they must land to recharge / regrow
    //their feathers.
    var featherLevel: Int //0 - 100
    
    
    init(name: String, hunger: Int, energy: Int, featherLevel: Int) {
        self.featherLevel = featherLevel
        super.init(name: name, hunger: hunger, energy: energy)
        setStatus()
    }
    
    override func rest() {
        super.rest()
        self.featherLevel = max(100, self.featherLevel+5)
    }
    
    override func setStatus()  {
        super.setStatus()
        var str: String = ""
        if self.featherLevel > 0 {
            str += "\nFeather Level: \(self.featherLevel)"
        }
        else {
            str += "\nNeed to roost!"
        }
        statusDescription += str
    }
    
    func roost() {
        featherLevel = min(featherLevel + 10, 100)
        setStatus()
    }
    
}

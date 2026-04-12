//
//  HabitatView.swift
//  Lab5new
//
//  Created by lending on 4/12/26.
//

import SwiftUI
import Foundation

private struct CreatureRowView: View {
    @ObservedObject var creature: Creature
    let onRest: () -> Void

    var body: some View {
        HStack {
            Text(creature.name)
            Text("Energy: \(creature.energy)")
            Text("Hunger: \(creature.hunger)")
            Spacer()
            Button("Rest") {
                onRest()
            }
            .accessibilityLabel("Rest \(creature.name)")
            .accessibilityHint("Increases \(creature.name)'s energy")
        }
        .accessibilityElement(children: .combine)
        .accessibilityLabel(creature.name)
        .accessibilityValue("Energy \(creature.energy), Hunger \(creature.hunger)")
    }
}

struct HabitatView: View {
    // Create variables here
    @StateObject private var habitatManager = HabitatManager()
    @State private var showAddingCreature = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Habitat")
                    .font(.largeTitle)
                
                List {
                    Section("Creatures") {
                        ForEach(habitatManager.creatures, id: \.name) { creature in
                            CreatureRowView(creature: creature) {
                                habitatManager.rest(creature)
                            }
                        }
                    }
                    Section("Activity Log") {
                        ForEach(habitatManager.activityLog, id: \.self) { log in
                            Text(log)
                        }
                    }
                }
                HStack {
                    Button("Feed All") {
                        habitatManager.feedAll()
                    }
                    .accessibilityHint("Feeds every creature in the habitat")
                    Button("Rest All") {
                        habitatManager.restAll()
                    }
                    .accessibilityHint("Raises the energy of every creature in the habitat")
                }
            }
            .padding()
            .navigationTitle("Habitat")
            
            
        }
        .sheet(isPresented: $showAddingCreature) {
            Text("Add New Creatures")
                .font(.title)
            
            
        }
    }
    
}

#Preview {
    HabitatView()
}

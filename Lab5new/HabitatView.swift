//
//  HabitatView.swift
//  Lab5new
//
//  Created by Rayan Charah on 4/12/26.
//
// This file shows the main habitat screen.
// Each creature is shown in a row with its stats and actions.
// Buttons are shown for features the creature can use.
// Accessibility features are used so screen readers can describe the rows.
import SwiftUI
import Foundation

private struct CreatureRowView: View {
    @ObservedObject var creature: Creature
    let onRest: () -> Void
    let onEat: () -> Void
    let onRoost: () -> Void
    let onSwim: () -> Void
    var body: some View {
        HStack {
            Text(creature.name)
            Text("Energy: \(creature.energy)")
            Text("Hunger: \(creature.hunger)")
            if let amphibian = creature as? AmphibianCreature {
                Text("Hydration: \(amphibian.hydration)")
            }
            if let bird = creature as? FlyingCreature {
                Text("Feather level: \(bird.featherLevel)")
            }
            Spacer()
            Button("Rest") {
                onRest()
            }
            Button("Eat") {
                onEat()
            }
            if creature is FlyingCreature {
                Button("Roost") {
                    onRoost()
                }
                .foregroundColor(Color.red)
            }
            if creature is AmphibianCreature {
                Button("Swim") {
                    onSwim()
                }.foregroundColor(Color.blue)
            }
        }
        .accessibilityElement(children: .combine)
        .accessibilityLabel(creature.name)
        .accessibilityValue("Energy \(creature.energy), Hunger \(creature.hunger)")
    }
}

struct HabitatView: View {
    // Create variables here
    @StateObject private var habitatManager = HabitatManager()
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Habitat")
                    .font(.largeTitle)
                
                List {
                    Section("Creatures") {
                        ForEach(habitatManager.creatures, id: \.name) { creature in
                            CreatureRowView(
                                creature: creature,
                                onRest: { habitatManager.rest(creature) },
                                onEat: { habitatManager.eat(creature) },
                                onRoost: {
                                    if let bird = creature as? FlyingCreature {
                                        habitatManager.roost(bird)
                                    }
                                },
                                onSwim: {
                                    if let fish = creature as? AmphibianCreature {
                                        habitatManager.swim(fish)
                                    }
                                }
                            )
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
    }
}

#Preview {
    HabitatView()
}

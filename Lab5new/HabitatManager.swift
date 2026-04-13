import Foundation
import Combine

final class HabitatManager: ObservableObject {
    // All creatures managed by this habitat
    @Published var creatures: [Creature]

    // Activity log messages (most recent last)
    @Published var activityLog: [String]

    init(creatures: [Creature] = [
        // Base Creatures
        Creature(name: "Stone Tortoise", hunger: 15, energy: 90),
        Creature(name: "Ember Fox", hunger: 55, energy: 45),
        
        // Flying Creatures
        FlyingCreature(name: "Storm Hawk", hunger: 20, energy: 80, featherLevel: 60),
        FlyingCreature(name: "Frost Owl", hunger: 10, energy: 95, featherLevel: 30),
        
        // Amphibian Creatures
        AmphibianCreature(name: "Mud Salamander", hunger: 30, energy: 60, hydration: 80),
        AmphibianCreature(name: "Swamp Newt", hunger: 25, energy: 75, hydration: 55),
    ]) {
        self.creatures = creatures
        self.activityLog = []
    }

    // Feed all creatures and record the action
    func feedAll() {
        guard !creatures.isEmpty else { return }
        for creature in creatures {
            creature.eat()
        }
        activityLog.append("Fed all creatures")
    }

    // Rest all creatures and record the action
    func restAll() {
        guard !creatures.isEmpty else { return }
        for creature in creatures {
            creature.rest()
        }
        activityLog.append("Rested all creatures")
    }

    func rest(_ creature: Creature) {
        creature.rest()
        activityLog.append("Rested \(creature.name)")
    }
    func eat(_ creature: Creature) {
        creature.eat()
        activityLog.append("Fed \(creature.name)")
    }
    func roost(_ creature: FlyingCreature) {
        creature.roost()
        activityLog.append("Roosted \(creature.name)")
    }
    func swim(_ creature: AmphibianCreature) {
        creature.swim()
        activityLog.append("Swam \(creature.name)")
    }
}

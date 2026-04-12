import Foundation
import Combine

final class HabitatManager: ObservableObject {
    // All creatures managed by this habitat
    @Published var creatures: [Creature]

    // Activity log messages (most recent last)
    @Published var activityLog: [String]

    init(creatures: [Creature] = [], activityLog: [String] = []) {
        self.creatures = creatures
        self.activityLog = activityLog
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
}

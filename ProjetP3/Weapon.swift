//
//  Weapon.swift
//  ProjetP3
//
//  Created by Romain Buewaert on 31/03/2021.
//

import Foundation


// Creation of the class Weapon
class Weapon {
    var name = "Weapon"
    var possibleAttack = [0]
    var attack = 0

    func attackValue() {
        let attackIndex = Int(arc4random_uniform(UInt32(possibleAttack.count)))
        attack = possibleAttack[attackIndex]
    }
}

// Creation of the class Sword (basic weapon for the warrior)
class Sword: Weapon {
    override init() {
        super.init()
        self.name = "Sword"
        self.possibleAttack = [40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70]
    }
}

// Creation of the class BattleAxe (special weapon for the warrior)
class BattleAxe: Weapon {
    override init() {
        super.init()
        self.name = "Battle axe"
        self.possibleAttack = [55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85]
    }
}

// Creation of the class Scimitar (special weapon for the warrior)
class Scimitar: Weapon {
    override init() {
        super.init()
        self.name = "Scimitar"
        self.possibleAttack = [60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90]
    }
}

// Creation of the class Claymore (special weapon for the warrior)
class Claymore: Weapon {
    override init() {
        super.init()
        self.name = "Claymore"
        self.possibleAttack = [100, 100]
    }
}

// Creation of the class Staff (basic weapon for the mage)
class Staff: Weapon {
    override init() {
        super.init()
        self.name = "Staff"
        self.possibleAttack = [30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 68, 69, 70]
    }
}

// Creation of the class MagicianStaff (special weapon for the mage)
class MagicianStaff: Weapon {
    override init() {
        super.init()
        self.name = "Magician staff"
        self.possibleAttack = [45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85]
    }
}

// Creation of the class MagisteriumStaff (special weapon for the mage)
class MagisteriumStaff: Weapon {
    override init() {
        super.init()
        self.name = "Magisterium staff"
        self.possibleAttack = [65, 66, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85]
    }
}

// Creation of the class WizardStaff (special weapon for the mage)
class WizardStaff: Weapon {
    override init() {
        super.init()
        self.name = "Wizard staff"
        self.possibleAttack = [100, 100]
    }
}

// Creation of the class Bow (basic weapon for the archer)
class Bow: Weapon {
    override init() {
        super.init()
        self.name = "Bow"
        self.possibleAttack = [35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65]
    }
}

// Creation of the class HunterBow (special weapon for the archer)
class HunterBow: Weapon {
    override init() {
        super.init()
        self.name = "Hunter bow"
        self.possibleAttack = [45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80]
    }
}

// Creation of the class ElfBow (special weapon for the archer)
class ElfBow: Weapon {
    override init() {
        super.init()
        self.name = "Elf bow"
        self.possibleAttack = [70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85]
    }
}

// Creation of the class Crossbow (special weapon for the archer)
class Crossbow: Weapon {
    override init() {
        super.init()
        self.name = "Crossbow"
        self.possibleAttack = [100, 100]
    }
}

// Creation of the class Dagger (basic weapon for the thief)
class Dagger: Weapon {
    override init() {
        super.init()
        self.name = "Dagger"
        self.possibleAttack = [45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60]
    }
}

// Creation of the class ThiefDagger (special weapon for the thief)
class ThiefDagger: Weapon {
    override init() {
        super.init()
        self.name = "Thief dagger"
        self.possibleAttack = [60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75]
    }
}

// Creation of the class AssassinDagger (special weapon for the thief)
class AssassinDagger: Weapon {
    override init() {
        super.init()
        self.name = "Assassin dagger"
        self.possibleAttack = [70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85]
    }
}

// Creation of the class GlassDagger (special weapon for the thief)
class GlassDagger: Weapon {
    override init() {
        super.init()
        self.name = "Glass dagger"
        self.possibleAttack = [100, 100]
    }
}

// Creation of the class BloodStaff (basic weapon for the blood mage)
class BloodStaff: Weapon {
    override init() {
        super.init()
        self.name = "Blood staff"
        self.possibleAttack = [30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 68, 69, 70]
    }
}

// Creation of the class BlackMageStaff (special weapon for the blood mage)
class BlackMageStaff: Weapon {
    override init() {
        super.init()
        self.name = "Black mage staff"
        self.possibleAttack = [45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85]
    }
}

// Creation of the class NecromancerStaff (special weapon for the blood mage)
class NecromancerStaff: Weapon {
    override init() {
        super.init()
        self.name = "Necromancer staff"
        self.possibleAttack = [65, 66, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85]
    }
}

// Creation of the class DemonicStaff (special weapon for the blood mage)
class DemonicStaff: Weapon {
    override init() {
        super.init()
        self.name = "Demonic staff"
        self.possibleAttack = [100, 100]
    }
}

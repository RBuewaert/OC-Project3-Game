//
//  Mage.swift
//  ProjetP3
//
//  Created by Romain Buewaert on 31/03/2021.
//

import Foundation


// Creation of the class "Mage"
class Mage: Character {
    
    static var possibleWeapon: [Weapon] = [MagicianStaff(), MagisteriumStaff(), WizardStaff()]
    static func randomWeapon() -> Weapon {
        let weaponIndex = Int(arc4random_uniform(UInt32(possibleWeapon.count)))
        return possibleWeapon[weaponIndex]
    }
    
    // Modification of function specialWeapon to adapt for the mage (weapon for mag are unique)
    override func specialWeapon() {
        let treasureChest = drawForSpecialWeapon()
        if treasureChest == true {
            print(""
            + "\nCongratulations you win a new weapon!"
            + "\nYour \(weapon.name) with damages \(weapon.possibleAttack[0]) - \(weapon.possibleAttack.last!) is replaced by :")
            weapon = Mage.randomWeapon()
            print("\(weapon.name) with damages \(weapon.possibleAttack[0]) - \(weapon.possibleAttack.last!)")
        }
    }
    
    // Modification of function resetproperties to adapt for the mage
    override func resetProperties() {
        damageGiven = 0
        damageReceveid = 0
        health = 250
        powerUsed = false
        weapon = Staff()
    }
    
    // Modification of function specialPower to adapt for the mage (heal all his partners)
    override func specialPower(characterTeam: Team, otherTeam: Team) -> Bool {
        print(""
        + "\nSpecial power: heal all the team"
        + "\n")
        for character in characterTeam.teamPlayer {
            if character.health > 0 {
                character.health += 45
            }
        }
        powerUsed = true
        
        print("Heal = 45 for each team member")
        print("Health:")
        for character in characterTeam.teamPlayer {
            if character.health > 0 {
                print("\(character.name)  health:\(character.health)")
            }
        }
        return false
    }
    
    // Variable configured for mage
    init() {
        super.init(health: 250, heal: 50, classCharacter: "Mage")
        self.weapon = Staff()
    }
}

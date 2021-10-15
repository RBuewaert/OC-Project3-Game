//
//  BloodMage.swift
//  ProjectP3
//
//  Created by Romain Buewaert on 31/03/2021.
//

import Foundation


// Creation of the class "BloodMage""
class BloodMage: Character {

    static var possibleWeapon: [Weapon] = [BlackMageStaff(), NecromancerStaff(), DemonicStaff()]
    static func randomWeapon() -> Weapon {
        let weaponIndex = Int(arc4random_uniform(UInt32(possibleWeapon.count)))
        return possibleWeapon[weaponIndex]
    }

    
    // Modification of function specialWeapon to adapt for the blood mage (weapon for blood mage are unique)
    override func specialWeapon() {
        let treasureChest = drawForSpecialWeapon()
        if treasureChest == true {
            print(""
            + "\nCongratulations you win a new weapon!"
            + "\nYour \(weapon.name) with damages \(weapon.possibleAttack[0]) - \(weapon.possibleAttack.last!) is replaced by :")
            weapon = BloodMage.randomWeapon()
            print("\(weapon.name) with damages \(weapon.possibleAttack[0]) - \(weapon.possibleAttack.last!)")
        }
    }
    
    // Modification of function resetProperties to adapt for the blood mage
    override func resetProperties() {
        damageGiven = 0
        damageReceveid = 0
        health = 250
        powerUsed = false
        weapon = BloodStaff()
    }
    
    // Modification of function specialPower to adapt for the blood mage (hit all the opponent)
    override func specialPower(characterTeam: Team, otherTeam: Team) -> Bool {
        print(""
        + "\nSpecial power: poisons all the opponent's team"
        + "\n")
        for character in otherTeam.teamPlayer {
            if character.health > 0 {
                character.health -= 45
                character.damageReceveid += 45
                damageGiven += 45
            }
        }
        powerUsed = true

        print("Damages = 45 for each team member")
        print("Health:")
        for character in otherTeam.teamPlayer {
            if character.health > 0 {
                print("\(character.name)  health:\(character.health)")
            } else {
                print("\(character.name) is dead")
                
            }
        }
        return false
    }
    
    // Variable configured for blood mage
    init() {
        super.init(health: 250, heal: 50, classCharacter: "Blood mage")
        self.weapon = BloodStaff()
    }
}


//
//  Warrior.swift
//  ProjectP3
//
//  Created by Romain Buewaert on 31/03/2021.
//

import Foundation


// Creation of the class "Warrior"
class Warrior: Character {
    
    static var possibleWeapon: [Weapon] = [BattleAxe(), Scimitar(), Claymore()]
    static func randomWeapon() -> Weapon {
        let weaponIndex = Int(arc4random_uniform(UInt32(possibleWeapon.count)))
        return possibleWeapon[weaponIndex]
    }

    // Modification of function specialWeapon to adapt for the warrior (weapon for warrior are unique)
    override func specialWeapon() {
        let treasureChest = drawForSpecialWeapon()
        if treasureChest == true {
            print(""
            + "\nCongratulations you win a new weapon!"
            + "\nYour \(weapon.name) with damages \(weapon.possibleAttack[0]) - \(weapon.possibleAttack.last!) is replaced by :")
            weapon = Warrior.randomWeapon()
            print("\(weapon.name) with damages \(weapon.possibleAttack[0]) - \(weapon.possibleAttack.last!)")
        }
    }
    
    // Modification of function resetProperties to adapt for the warrior
    override func resetProperties() {
        damageGiven = 0
        damageReceveid = 0
        health = 200
        powerUsed = false
        weapon = Sword()
    }
    
    // Modification of function specialPower to adapt for the warrior (value of attack * 2)
    override func specialPower(characterTeam: Team, otherTeam: Team) -> Bool {
        print(""
        + "\nSpecial power : critical attack")
        print(""
        + "\nChoose an opponent to attack:")
        let characterToAttack = otherTeam.selectCharacter()
        
        weapon.attackValue()
        characterToAttack.health -= (weapon.attack * 2)
        characterToAttack.damageReceveid += (weapon.attack * 2)
        damageGiven += (weapon.attack * 2)
        powerUsed = true
       
        print("Critical damages = \(weapon.attack * 2)")
        if characterToAttack.health > 0 {
            print("\(characterToAttack.name)  health:\(characterToAttack.health)")
        } else {
            print("\(characterToAttack.name) is dead")
        }
        return false
    }
    
    // Variable configured for warrior
    init() {
        super.init(health: 200, heal: 20, classCharacter: "Warrior")
        self.weapon = Sword()
    }
}
   

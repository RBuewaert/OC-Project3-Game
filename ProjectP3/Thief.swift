//
//  Thief.swift
//  ProjectP3
//
//  Created by Romain Buewaert on 31/03/2021.
//

import Foundation


// Creation of the class "Thief""
class Thief: Character {
    
    static var possibleWeapon: [Weapon] = [ThiefDagger(), AssassinDagger(), GlassDagger()]
    static func randomWeapon() -> Weapon {
        let weaponIndex = Int(arc4random_uniform(UInt32(possibleWeapon.count)))
        return possibleWeapon[weaponIndex]
    }
    
    // Modification of function specialWeapon to adapt for the thief (weapon for thief are unique)
    override func specialWeapon() {
        let treasureChest = drawForSpecialWeapon()
        if treasureChest == true {
            print(""
            + "\nCongratulations you win a new weapon!"
            + "\nYour \(weapon.name) with damages \(weapon.possibleAttack[0]) - \(weapon.possibleAttack.last!) is replaced by :")
            weapon = Thief.randomWeapon()
            print("\(weapon.name) with damages \(weapon.possibleAttack[0]) - \(weapon.possibleAttack.last!)")
        }
    }
    
    // Modification of function resetProperties to adapt for the thief
    override func resetProperties() {
        damageGiven = 0
        damageReceveid = 0
        health = 200
        powerUsed = false
        weapon = Dagger()
    }
   
    // Modification of function specialPower to adapt for the thief (attack and skip opponent turn)
    override func specialPower(characterTeam: Team, otherTeam: Team) -> Bool {
        print(""
        + "\nSpecial power: steals the opponent's next turn")
        print(""
        + "\nFirst of all, choose an opponent to attack:")
        let characterToAttack = otherTeam.selectCharacter()

        weapon.attackValue()
        characterToAttack.health -= weapon.attack
        characterToAttack.damageReceveid += weapon.attack
        damageGiven += weapon.attack
        powerUsed = true
        
        print("Damages = \(weapon.attack)")
        if characterToAttack.health > 0 {
            print("\(characterToAttack.name)  health:\(characterToAttack.health)")
        } else{
            print("\(characterToAttack.name) is dead")
        }
        print(""
        + "\nPlayer 2, it's your turn to play again")
        return true
    }
    
    // Variable configured for thief
    init() {
        super.init(health: 200, heal: 30, classCharacter: "Thief")
        self.weapon = Dagger()
    }
}

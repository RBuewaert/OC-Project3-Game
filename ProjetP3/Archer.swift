//
//  Archer.swift
//  ProjetP3
//
//  Created by Romain Buewaert on 31/03/2021.
//

import Foundation


// Creation of the class "Archer"
class Archer: Character {
    
    static var possibleWeapon: [Weapon] = [HunterBow(), ElfBow(), Crossbow()]
    static func randomWeapon() -> Weapon {
        let weaponIndex = Int(arc4random_uniform(UInt32(possibleWeapon.count)))
        return possibleWeapon[weaponIndex]
    }
    
    // Modification of function specialWeapon to adapt for the archer (weapon for archer are unique)
    override func specialWeapon() {
        let treasureChest = drawForSpecialWeapon()
        if treasureChest == true {
            print(""
            + "\nCongratulations you win a new weapon!"
            + "\nYour \(weapon.name) with damages \(weapon.possibleAttack[0]) - \(weapon.possibleAttack.last!) is replaced by :")
            weapon = Archer.randomWeapon()
            print("\(weapon.name) with damages \(weapon.possibleAttack[0]) - \(weapon.possibleAttack.last!)")
        }
    }
    
    // Modification of function resetProperties to adapt for the archer
    override func resetProperties() {
        damageGiven = 0
        damageReceveid = 0
        health = 200
        powerUsed = false
        weapon = Bow()
    }
    
    // Modification of function specialPower to adapt for the archer (can attack two opponent)
    override func specialPower(characterTeam: Team, otherTeam: Team) -> Bool {
        print(""
        + "\nSpecial power: double arrow"
        + "\nYou can attack twice")
        
        for arrow in 1...2 {
            if arrow == 1 {
                print(""
                + "\nChoose the first opponent to attack:")
            } else {
                if otherTeam.totalHealth < 1 {
                    // If all opponent are dead, without this verification the game is blocked.
                    return false
                } else {
                    print(""
                + "\nChoose the second opponent to attack:")
                }
            }
            
            let characterToAttack = otherTeam.selectCharacter()
            
            weapon.attackValue()
            characterToAttack.health -= weapon.attack
            characterToAttack.damageReceveid += weapon.attack
            damageGiven += weapon.attack
           
            print("Damages = \(weapon.attack)")
            if characterToAttack.health > 0 {
                print("\(characterToAttack.name)  health:\(characterToAttack.health)")
            } else {
                print("\(characterToAttack.name) is dead")
            }
        }
        powerUsed = true
        
        return false
    }
    
    // Variable configured for archer
    init() {
        super.init(health: 200, heal: 30, classCharacter: "Archer")
        self.weapon = Bow()
    }
}


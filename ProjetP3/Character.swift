//
//  Character.swift
//  ProjetP3
//
//  Created by Romain Buewaert on 31/03/2021.
//

import Foundation


// Function for entering and checking duplicates for the "name" variable of the character
// Analysis of the name entered with all the names already existing stored on static var names
// If name already used, it return to function enterName to indicate an other name
func enterName() -> String {
    print("Enter name of your character")
    let nameChoosed = betterReadLine()
    if Character.names.contains(nameChoosed) {
        print("Name already used, please choose another")
        return enterName()
    }
    return nameChoosed
}



// Creation of the class "Character"
class Character {

    static var names = [String]()
    var name: String
    var health: Int
    var weapon = Weapon()
    var heal: Int
    var damageGiven = 0
    var damageReceveid = 0
    var classCharacter: String
    let actionType = ["Attack", "Heal", "Use special power"]
    var powerUsed = false
    
    // Function to define if the player will have a special weapon.
    // There is 3 true and 7 false, so with "arc4random_uniform" we have a probability of 30% to have a special weapon if we return true.
    func drawForSpecialWeapon() -> Bool {
        let hazard = [true, true, true, false, false, false, false, false, false, false]
        let hazardIndex = Int(arc4random_uniform(UInt32(hazard.count)))
        return hazard[hazardIndex]
    }
    
    // Function to define the special weapon for player. On this class it's empty, see on others characters class
    func specialWeapon() {
    }
    
    // Function revenge to reset character properties. On this class it's empty, see on others characters class
    func resetProperties() {
    }
    
    // Function to verify if player indicate a valid number (linked with func selectAction)
    private func askForActionNumber() -> Int {
        let number = betterReadLine()
        // Verification if player indicate a number
        guard var myRealNumber = Int(number) else {
            print("Sorry, not understand, please retry.")
            return askForActionNumber()
        }
        // Verification if the number is on the proposal list and on the table of team characters
        if myRealNumber < 1 || myRealNumber > actionType.count {
            print("Sorry, not understand, please retry.")
            return askForActionNumber()
        }
        // -1 to have a correspondence with index from table
        myRealNumber -= 1
        return myRealNumber
    }
    
    // Function to select an action for the character
    func selectAction() -> String {
        print(""
        + "\nWhat do you want to do?")
        for (index, action) in actionType.enumerated() {
            print("\(index + 1) \(action)")
        }
        let choice = askForActionNumber()
        return actionType[choice]
    }
    
    // Function to attack an opponent and to calculate statistics
    func attack(on otherTeam: Team) {
        print(""
        + "\nChoose an opponent to attack:")
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
    
    // Function to heal a partner
    func heal(on teamPlaying: Team) {
        print(""
        + "\nChoose a character to heal:")
        let characterToHeal = teamPlaying.selectCharacter()
        characterToHeal.health += heal
        print("Heal = \(heal)")
        print("\(characterToHeal.name)  health:\(characterToHeal.health)")
    }
    
    // Function for special power
    func specialPower(characterTeam: Team, otherTeam: Team) -> Bool {
        return false
    }
    
    init(health: Int, heal: Int, classCharacter: String) {
        self.name = enterName()
        self.health = health
        self.heal = heal
        self.classCharacter = classCharacter
        
        Character.names.append(name)
    }
}


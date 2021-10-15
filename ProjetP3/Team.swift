//
//  Team.swift
//  ProjetP3
//
//  Created by Romain Buewaert on 31/03/2021.
//

import Foundation


// Creation of the class "Team"
class Team {
    var teamPlayer = [Character]()
    
    var totalHealth: Int {
        var total = 0
        for character in teamPlayer {
            if character.health < 0 {
                character.health = 0
            }
            total += character.health
        }
        return total
    }
    
    var damageGiven = 0
    var damageReceveid = 0

    // Function to create team
    func createTeamPlayer() {
        // If team contain already player, it's necessary to empty this (utility if Player want to do a second fight for example)
        if teamPlayer.count > 0 {
            teamPlayer.removeAll()
            }
        
        // Variable to verify quantity of each class of characters (if true is posssible to take the charaacter)
        var warriorQuantity = true
        var mageQuantity = true
        var archerQuantity = true
        var thiefQuantity = true
        var bloodMageQuantity = true
        var numberOfCharacters = 0
        
        print("Please choose three characters from the list below"
        + "\n1 Warrior equipped with Sword damages 40-70"
        + "\n  Special power : critical attack"
        + "\n2 Mage equipped with Staff damages 30-70"
        + "\n  Special power : heal all the team"
        + "\n3 Archer equipped with Bow damages 35-65"
        + "\n  Special power : double arrow"
        + "\n4 Thief equipped with Dagger damages 45-60"
        + "\n  Special power : steals the opponent's next turn"
        + "\n5 Blood Mage equipped with Blood staff damages 30-70"
        + "\n  Special power : poisons all the opponent's team")
        
        while numberOfCharacters < 3 {
            if let choice = readLine() {
                switch choice {
                case "1":
                        if warriorQuantity == true {
                            teamPlayer.append(Warrior())
                            print("Character added to the team")
                            warriorQuantity = false
                            numberOfCharacters += 1
                            if numberOfCharacters < 3 {
                                print("Choose the next character")
                            }
                        } else {
                            print("You have already chosen this character class, choose another")
                        }
                case "2":
                        if mageQuantity == true {
                            teamPlayer.append(Mage())
                            print("Character added to the team")
                            mageQuantity = false
                            numberOfCharacters += 1
                            if numberOfCharacters < 3 {
                                print("Choose the next character")
                            }
                        } else {
                            print("You have already chosen this character class, choose another")
                        }
                case "3":
                        if archerQuantity == true {
                            teamPlayer.append(Archer())
                            print("Character added to the team")
                            archerQuantity = false
                            numberOfCharacters += 1
                            if numberOfCharacters < 3 {
                                print("Choose the next character")
                            }
                        } else {
                            print("You have already chosen this character class, choose another")
                        }
                case "4":
                        if thiefQuantity == true {
                            teamPlayer.append(Thief())
                            print("Character added to the team")
                            thiefQuantity = false
                            numberOfCharacters += 1
                            if numberOfCharacters < 3 {
                                print("Choose the next character")
                            }
                        } else {
                            print("You have already chosen this character class, choose another")
                        }
                case "5":
                        if bloodMageQuantity == true {
                            teamPlayer.append(BloodMage())
                            print("Character added to the team")
                            bloodMageQuantity = false
                            numberOfCharacters += 1
                            if numberOfCharacters < 3 {
                                print("Choose the next character")
                            }
                        } else {
                            print("You have already chosen this character class, choose another")
                        }
                default :
                    print ("Sorry, not understand, please retry.")
                }
            }
        }
    }
    
    // Function to calcul the damages of the team
    func totalDamages() {
        damageGiven = 0
        damageReceveid = 0
        for character in teamPlayer {
            damageGiven += character.damageGiven
            damageReceveid += character.damageReceveid
        }
    }
    
    // Function to verify if player indicate a valid number and to verify if character is alive
    private func askForCharacterNumber() -> Int {
        let number = betterReadLine()
        // Verification if player indicate a number
        guard var myRealNumber = Int(number) else {
            print("Sorry, not understand, please retry.")
            return askForCharacterNumber()
        }
        // Verification if the number is on the proposal list and on the table of team characters
        if myRealNumber < 1 || myRealNumber > teamPlayer.count {
            print("Sorry, not understand, please retry.")
            return askForCharacterNumber()
        }
        // Verification if the character is alive (-1 to verify with index from table)
        myRealNumber -= 1
        if teamPlayer[myRealNumber].health <= 0 {
            print("The character is dead, you can't choose him")
            return askForCharacterNumber()
        }
        return myRealNumber
    }

    // Function to choose a character (utility for the fight)
    func selectCharacter() -> Character {
        for (index,character) in teamPlayer.enumerated() {
            print("\(index + 1) \(character.classCharacter): \(character.name)   health:\(character.health)")
        }
        let choice = askForCharacterNumber()
        return teamPlayer[choice]
    }
    
}


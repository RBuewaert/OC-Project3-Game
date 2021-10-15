//
//  Game.swift
//  ProjectP3
//
//  Created by Romain Buewaert on 31/03/2021.
//

import Foundation

// ReadLine input function which is used by several Class (Character and Team)
func betterReadLine() -> String {
    if let myReadLine = readLine() {
        return myReadLine
    } else {
        return ""
    }
}


// Creation of the class "Game"
class Game {
    
    private var team1 = Team()
    private var team2 = Team()
    private var turnPlayer1 = 0
    private var turnPlayer2 = 0
    
    // Function to ask if the player wants to read the rules of the game
    private func startGame() {
        print("Do you want to read the rules?"
        + "\nyes for read the rules"
        + "\nno for play")
        if let choice = readLine() {
            switch choice {
            case "yes":
                print ("In this game 2 teams will fight turn based."
                    + "\nEach team is made up of 3 characters."
                    + "\nOnly one character class can be chosen from a team."
                    + "\nEach character has a special power that can be used once per fight."
                    + "\nBonus weapons can appear randomly during the game."
                    + "\nThe fight ends when all the players on the same team are dead."
                    + "\nHave a good game and good luck."
                    + "\n")
                print(""
                + "\nPress any touch to continue")
                var _ = readLine()
            case "no":
                print ("Ok, let's go to play!")
            default :
                print ("Sorry, not understand.")
                startGame()
            }
        }
    }
    
    // Function to create teams for each player
    private func createTeam() {
        print(" "
        + "\nPlayer 1, please choose your characters")
        team1.createTeamPlayer()
        
        print(" "
        + "\nPlayer 2, please choose your characters")
        team2.createTeamPlayer()
        
        print(" "
        + "\nPlayer 1, here your team :")
        for character in team1.teamPlayer {
            print("\(character.name) : \(character.classCharacter)")
        }
        
        print(" "
        + "\nPlayer 2, here your team :")
        for character in team2.teamPlayer {
            print("\(character.name) : \(character.classCharacter)")
        }
        
        print(""
        + "\nPress any touch to continue")
        var _ = readLine()
    }
    
    // Function for player turn (function valid for the two players)
    private func playerTurn(_ teamPlaying: Team, otherTeam: Team, isPlayerOneTurn: Bool) {
        let playerNumber = isPlayerOneTurn ? "1" : "2"
        
        print(""
        + "\nPlayer \(playerNumber), choose the character who will perform the action:")
        let characterWhoPlay = teamPlaying.selectCharacter()

        characterWhoPlay.specialWeapon()
        
        let action = characterWhoPlay.selectAction()
        if action == "Attack" {
            characterWhoPlay.attack(on: otherTeam)
               
        } else if action == "Heal" {
            characterWhoPlay.heal(on: teamPlaying)
         
        } else { // action == Use special power
            if characterWhoPlay.powerUsed == false { // Special power not used
                
                let shouldSkipNextPlayerTurn = characterWhoPlay.specialPower(characterTeam: teamPlaying, otherTeam: otherTeam)
                if shouldSkipNextPlayerTurn && otherTeam.totalHealth > 1 { // Valid only for the thief (thanks to return of value true of the function)
                    // If all opponent are dead, the game is blocked. So we verify totalHeath of opponent team
                    playerTurn(teamPlaying, otherTeam: otherTeam, isPlayerOneTurn: isPlayerOneTurn)
                }
                
            } else { // Special power already used by character
                print(""
                + "\nYour character has already used their special power"
                + "\n"
                + "\nBack to the character selection menu")
                playerTurn(teamPlaying, otherTeam: otherTeam, isPlayerOneTurn: isPlayerOneTurn)
            }
 
        }
    }
    
    
    // Function for the fight
    private func fight() {
        print("The fight will start, sharpen your weapons!")
      
        while (team1.totalHealth > 0 || team1.totalHealth > 0) {
            
            playerTurn(team1, otherTeam: team2, isPlayerOneTurn: true)
            turnPlayer1 += 1
            
            print(""
                    + "\nHealth Team 1: \(team1.totalHealth)"
                    + "\nHealth Team 2: \(team2.totalHealth)")
            
            if team2.totalHealth < 1 {
                result()
            }
            
            playerTurn(team2, otherTeam: team1, isPlayerOneTurn: false)
            turnPlayer2 += 1
            
            print(""
                    + "\nHealth Team 1: \(team1.totalHealth)"
                    + "\nHealth Team 2: \(team2.totalHealth)")
       
        }
    }
    
    // Function to propose an other fight
    private func newProposal(){
        print(""
        + "\nWhat do you want to do?"
        + "\n1 Revenge with the same characters"
        + "\n2 Play a new game with new characters"
        + "\n3 Leave the game")
        if let choice = readLine() {
            switch choice {
            case "1":
                turnPlayer1 = 0
                turnPlayer2 = 0
                for character in team1.teamPlayer {
                    character.resetProperties()
                }
                
                for character in team2.teamPlayer {
                    character.resetProperties()
                }
                
                fight()
                result()
                
            case "2":
                turnPlayer1 = 0
                turnPlayer2 = 0
                createTeam()
                fight()
                result()
                
            case "3":
                exit(0);
                
            default:
                print("Sorry, not understand.")
                newProposal()
            }
        }
    }
    
    // Function to display the results of the fight and to propose an other fight
    private func result(){
        team1.totalDamages()
        team2.totalDamages()

        if team1.totalHealth > team2.totalHealth {
            print(""
            + "\nCongratulations, player 1 you win the fight!"
            + "\n")
        }else{
            print(""
            + "\nCongratulations, player 2 you win the fight!"
            + "\n")
        }

        print("Number of turn for player 1: \(turnPlayer1)"
        + "\nNumber of turn for player 2: \(turnPlayer2)")
        
        print(""
        + "\nTeam Player 1 :")
        for character in team1.teamPlayer {
            print("\(character.name) : \(character.classCharacter)  health: \(character.health)")
        }
        print(""
        + "\nDamages given by the team : \(team1.damageGiven)"
        + "\nDamages receveid by the team : \(team1.damageReceveid)")
        for character in team1.teamPlayer {
            print("Damages given by \(character.name) : \(character.damageGiven)")
            print("Damages receveid by \(character.name) : \(character.damageReceveid)")
        }
        
        print(""
        + "\nTeam Player 2 :")
        for character in team2.teamPlayer {
            print("\(character.name) : \(character.classCharacter)  health: \(character.health)")
        }
        print(""
        + "\nDamages given by the team : \(team2.damageGiven)"
        + "\nDamages receveid by the team : \(team2.damageReceveid)")
        for character in team2.teamPlayer {
            print("Damages given by \(character.name) : \(character.damageGiven)")
            print("Damages receveid by \(character.name) : \(character.damageReceveid)")
        }
        
        print(""
        + "\nPress any touch to continue")
        var _ = readLine()
        
        newProposal()
    }
    
    // Functions to be launched when a new game is started
    init() {
        startGame()
        createTeam()
        fight()
        result()
    }
}



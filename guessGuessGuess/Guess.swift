//
//  Guess.swift
//  guessGuessGuess
//
//  Created by Rebecca Cullimore on 5/27/16.
//  Copyright © 2016 Cullimore Family. All rights reserved.
//

import Foundation

class Guess {
    var column1 = UInt8(0)
    var column2 = UInt8(0)
    var column3 = UInt8(0)
    var column4 = UInt8(0)
    var answer = UInt32(1000)
    var guess = ""
    var correctColumns = [Int]()
    var correctNumberColumns = [Int]()
    
    var calculatedRightNumbers = UInt8(0)
    var calculatedRightPlaces = UInt8(0)
    
    init(answer:UInt32, column1:String?, column2:String?, column3:String?, column4:String?)
    {
        self.answer = answer
        self.column1 = UInt8(column1!)!
        self.column2 = UInt8(column2!)!
        self.column3 = UInt8(column3!)!
        self.column4 = UInt8(column4!)!
        self.guess = "\(column1!)\(column2!)\(column3!)\(column4!)"

        calcRightPlaces()
        calcRemainingRightNumbers()
    }
    
    
    
    func correct() -> Bool {//(answer: UInt32, guess: UInt32) -> Bool {
        let guess = UInt32("\(column1)\(column2)\(column3)\(column4)")
        print(guess)
        return answer == guess
    }
    
    func rightNumbers() -> String {
        return "\(calculatedRightNumbers) Right Numbers"
    }
    
    func rightPlaces() -> String {
        return "\(calculatedRightPlaces) Right Places"
    }
    
    func calcRightPlaces() {
        for (guessIndex, guessChar) in guess.characters.enumerate() {
            for (index, char) in "\(answer)".characters.enumerate() {
                if index == guessIndex && char == guessChar {
//                    print("add right place \(index) \(char)")
                    self.calculatedRightPlaces += 1
//                    print("add right number")
                    self.calculatedRightNumbers += 1
                    self.correctColumns.append(index)
                    break
                }
            }
        }
    }
    
    func calcRemainingRightNumbers() {
        for (guessIndex, guessChar) in guess.characters.enumerate() {
            if !correctColumns.contains(guessIndex) {
                for (index, char) in "\(answer)".characters.enumerate() {
                    if !correctColumns.contains(index) && !correctNumberColumns.contains(index) && char == guessChar {
                        self.calculatedRightNumbers += 1
                        self.correctNumberColumns.append(index)

                        break
                    }
                }
            }
        }
    }
    
}

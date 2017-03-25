//
//  Answer.swift
//  guessGuessGuess
//
//  Created by Rebecca Cullimore on 5/31/16.
//  Copyright © 2016 Cullimore Family. All rights reserved.
//

import Foundation

class Answer
{
    let range = UInt32(1000)...UInt32(9999)
    let answer:UInt32
    
    init() {
        self.answer = arc4random_uniform(UInt32(range.endIndex - range.startIndex) + 1) + UInt32(range.startIndex)//
    }
    
    func get() -> UInt32 {
        return answer
    }
    
}
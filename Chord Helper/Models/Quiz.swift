//
//  ChordQuiz.swift
//  Guitar Chord Finder
//
//  Created by Aadit Bagdi on 12/14/22.
//

import Foundation

class Quiz {
    private var rounds = Answer.allAnswers
    private var currentRoundIndex = 0
    
    var currentRound: Answer {
        return rounds[currentRoundIndex]
    }
    
    var totalRounds: Int {
        rounds.count - 1
    }
    
    func advanceRound() {
        let nextRoundIndex = currentRoundIndex + 1
        currentRoundIndex = nextRoundIndex
    }
    
    func resetAnswers() {
        currentRoundIndex = 0
        var newAnswers = [Answer]()
        for _ in 1...Answer.allAnswers.count {
            let new = Answer.init()
            newAnswers.append(new)
        }
        Answer.allAnswers = newAnswers
    }
    
}

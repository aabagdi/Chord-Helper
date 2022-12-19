//
//  ChordQuiz.swift
//  Guitar Chord Finder
//
//  Created by Aadit Bagdi on 12/14/22.
//

import Foundation

class Quiz {
    private var rounds : [Answer] = [
        Answer(),
        Answer(),
        Answer(),
        Answer(),
        Answer(),
        Answer()
    ]
    private var currentRoundIndex = 0
    
    var currentRound: Answer {
        rounds[currentRoundIndex]
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
        for _ in 1...rounds.count {
            let new = Answer.init()
            newAnswers.append(new)
        }
        rounds = newAnswers
    }
}

//
//  Question.swift
//  Guitar Chord Finder
//
//  Created by Aadit Bagdi on 12/17/22.
//

import Foundation

let roots = ["A", "B", "C", "D", "E", "F", "G"]
let chordType = ["Major", "Minor"]

func chooseChord() -> String {
    let randomRoot = roots.randomElement()!
    let randomType = chordType.randomElement()!
    let randomChord = randomRoot + randomType
    return randomChord
}

func genAnswer() -> (String, [String]) {
    var answers = [String]()
    while answers.count < 4 {
        let randChord = chooseChord()
        if !answers.contains(randChord) {
            answers.append(randChord)
        }
    }
    let correctAnswer = answers.randomElement()!
    return (correctAnswer, answers)
}

struct Answer {
    private var correctAnswer: String
    private var possibleAnswers: [String]
    
    func getCorrectAnswer() -> String {
        return correctAnswer
    }
    
    func getPossibleAnswers() -> [String] {
        return possibleAnswers
    }
    
    init() {
        let answer = genAnswer()
        self.correctAnswer = answer.0
        self.possibleAnswers = answer.1
    }
    
    static var allAnswers: [Answer] = [
        Answer(),
        Answer(),
        Answer(),
        Answer(),
        Answer(),
        Answer()
    ]
    
}

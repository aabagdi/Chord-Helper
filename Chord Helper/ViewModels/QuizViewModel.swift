//
//  QuizViewModel.swift
//  Guitar Chord Finder
//
//  Created by Aadit Bagdi on 12/18/22.
//

import Foundation

class QuizViewModel: ObservableObject {
    @Published var game = Quiz()
    
    var correctAnswerText: String {
        game.currentRound.getCorrectAnswer()
    }
    
    func answerText() -> [String] {
        game.currentRound.getPossibleAnswers()
    }
    
    var totalRounds: Int {
        return game.totalRounds
    }
    
    func advanceGame() {
        game.advanceRound()
    }
}

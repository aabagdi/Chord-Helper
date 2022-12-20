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
    
    var totalRounds: Int {
        game.totalRounds
    }
    
    func answerText() -> [String] {
        return game.currentRound.getPossibleAnswers()
    }
    
    func advanceGame() {
        game.advanceRound()
    }
}

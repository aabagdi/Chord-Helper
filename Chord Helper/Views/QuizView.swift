//
//  QuizView.swift
//  Guitar Chord Finder
//
//  Created by Aadit Bagdi on 12/16/22.
//

import SwiftUI
import AVFoundation

struct QuizView: View {
    var chords = ChordPlayer()
    @ObservedObject var viewModel = QuizViewModel()
    
    @State var score = 0
    @State var roundsPlayed = 0
    @State var showingAlert = false
    
    @Environment(\.presentationMode) var presentation
    
    @Binding var currentInst: String
    
    
    var body: some View {
        let correctAnswer = viewModel.correctAnswerText
        let answers = viewModel.answerText()
        VStack {
            //Text("Current Round: \(roundsPlayed) out of \(viewModel.totalRounds)")
            //Text("Your score \(score)")
            //Text("Correct answer \(viewModel.correctAnswerText)")
            Text("What chord is this?").font(.largeTitle)
            Button("Play Chord") {
                self.chords.playChord(chord: correctAnswer, instrument: currentInst)
            }
            .foregroundColor(Color.white)
            .frame(width: 150, height: 50)
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
        }
        Spacer().frame(height: 30)
        VStack {
            HStack {
                Button(answers[0]) {
                    if roundsPlayed < viewModel.totalRounds - 1 {
                        roundsPlayed += 1
                    }
                    else {
                        showingAlert.toggle()
                    }
                    if answers[0] == correctAnswer {
                        score += 1
                    }
                    viewModel.advanceGame()
                }
                .foregroundColor(Color.white)
                .frame(width: 150, height: 150)
                .background(Color.orange)
                .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                Button(answers[1]) {
                    if roundsPlayed < viewModel.totalRounds - 1 {
                        roundsPlayed += 1
                    }
                    else {
                        showingAlert.toggle()
                    }
                    if answers[1] == correctAnswer {
                        score += 1
                    }
                    viewModel.advanceGame()
                }
                .foregroundColor(Color.white)
                .frame(width: 150, height: 150)
                .background(Color.orange)
                .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
            }
        }
        VStack {
            HStack {
                Button(answers[2]) {
                    if roundsPlayed < viewModel.totalRounds - 1 {
                        roundsPlayed += 1
                    }
                    else {
                        showingAlert.toggle()
                    }
                    if answers[2] == correctAnswer {
                        score += 1
                    }
                    viewModel.advanceGame()
                }
                .foregroundColor(Color.white)
                .frame(width: 150, height: 150)
                .background(Color.orange)
                .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                Button(answers[3]) {
                    if roundsPlayed < viewModel.totalRounds - 1 {
                        roundsPlayed += 1
                    }
                    else {
                        showingAlert.toggle()
                    }
                    if answers[3] == correctAnswer {
                        score += 1
                    }
                    viewModel.advanceGame()
                }
                .foregroundColor(Color.white)
                .frame(width: 150, height: 150)
                .background(Color.orange)
                .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
            }
        }.onDisappear {
            viewModel.game.resetAnswers()
        }
        .alert("You got \(score) right out of \(viewModel.totalRounds)!", isPresented: $showingAlert) {
            Button("Yay!") {
                viewModel.game.resetAnswers()
                presentation.wrappedValue.dismiss()
            }
        }
    }
}

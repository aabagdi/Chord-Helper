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
        let randChord = viewModel.correctAnswerText
        VStack {
          Text("Current Round: \(roundsPlayed) out of \(viewModel.totalRounds)")
          //Text("Your score \(score)")
          //Text("Correct answer \(viewModel.correctAnswerText)")
            Text("What chord is this?").font(.largeTitle)
            Button("Play Chord") {
                self.chords.playChord(chord: randChord, instrument: currentInst)
            }
            .foregroundColor(Color.white)
            .frame(width: 150, height: 50)
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
        }
        VStack {
            HStack {
                Button(viewModel.answerText()[0]) {
                    if roundsPlayed < viewModel.totalRounds - 1 {
                        roundsPlayed += 1
                    }
                    else {
                        showingAlert.toggle()
                    }
                    if viewModel.answerText()[0] == randChord {
                        score += 1
                    }
                    viewModel.advanceGame()
                }
                .foregroundColor(Color.white)
                .frame(width: 150, height: 150)
                .background(Color.orange)
                .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                Button(viewModel.answerText()[1]) {
                  if roundsPlayed < viewModel.totalRounds - 1 {
                      roundsPlayed += 1
                  }
                  else {
                      showingAlert.toggle()
                  }
                  if viewModel.answerText()[1] == randChord {
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
                Button(viewModel.answerText()[2]) {
                  if roundsPlayed < viewModel.totalRounds - 1 {
                      roundsPlayed += 1
                  }
                  else {
                      showingAlert.toggle()
                  }
                  if viewModel.answerText()[2] == randChord {
                      score += 1
                  }
                  viewModel.advanceGame()
                }
                .foregroundColor(Color.white)
                .frame(width: 150, height: 150)
                .background(Color.orange)
                .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                Button(viewModel.answerText()[3]) {
                  if roundsPlayed < viewModel.totalRounds - 1 {
                      roundsPlayed += 1
                  }
                  else {
                      showingAlert.toggle()
                  }
                  if viewModel.answerText()[3] == randChord {
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
        .alert("You got \(score) right out of \(viewModel.totalRounds)!", isPresented: $showingAlert) {
            Button("Yay!") {
                presentation.wrappedValue.dismiss()
            }
        }
    }
}

/*struct quizButton: View {
 let title: String
 let model: QuizViewModel
 var body: some View {
 Button(title) {
 model.advanceGame()
 }
 .foregroundColor(Color.black)
 .frame(width: 150, height: 150)
 .background(Color.white)
 .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
 } */

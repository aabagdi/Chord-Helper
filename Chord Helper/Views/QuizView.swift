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
    @StateObject var viewModel = QuizViewModel()
    
    @State var score = 0
    @State var roundsPlayed = 0
    @State var showingAlert = false
    
    @Environment(\.presentationMode) var presentation
    
    @Binding var currentInst: String
    
    var body: some View {
        let randChord = viewModel.correctAnswerText
        VStack {
            Text("What chord is this?")
            Button("Play Chord Again") {
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
                    if roundsPlayed < viewModel.totalRounds {
                        roundsPlayed += 1
                    }
                    else {
                        showingAlert.toggle()
                    }
                    if viewModel.answerText()[0] == randChord {
                        score += 1
                    }
                    viewModel.advanceGame()
                    self.chords.playChord(chord: randChord, instrument: currentInst)
                }
                .foregroundColor(Color.black)
                .frame(width: 150, height: 150)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                Button(viewModel.answerText()[1]) {
                    viewModel.advanceGame()
                }
                .foregroundColor(Color.black)
                .frame(width: 150, height: 150)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
            }
        }
        VStack {
            HStack {
                Button(viewModel.answerText()[2]) {
                    viewModel.advanceGame()
                }
                .foregroundColor(Color.black)
                .frame(width: 150, height: 150)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                Button(viewModel.answerText()[3]) {
                    viewModel.advanceGame()
                }
                .foregroundColor(Color.black)
                .frame(width: 150, height: 150)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
            }
        }
        
        .onAppear {
            self.chords.playChord(chord: randChord, instrument: currentInst)
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

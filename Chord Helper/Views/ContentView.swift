//
//  ContentView.swift
//  Guitar chord player
//
//  Created by Aadit Bagdi on 12/13/22.
//

import SwiftUI
import AVFoundation



struct ContentView: View {
    var chords = ChordPlayer()
    
    @State var roots = ["A", "B", "C", "D", "E", "F", "G"]
    @State var chordType = ["Major", "Minor"]
    @State var selectedRoot = "A"
    @State var selectedType = "Major"
    @State var currentInst = "Guitar"
    @State var quizOn = false
    
    @State var showSettings = false
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    Text("Choose a chord").font(.largeTitle)
                    Image(systemName: currentInst == "Guitar" ? "guitars.fill" : "pianokeys")
                        .imageScale(.large)
                }
                let fullChord = selectedRoot + selectedType
                HStack {
                    VStack{
                        Text("Root Note").font(.title3)
                        Picker("Root Note", selection: $selectedRoot) {
                            ForEach(roots, id: \.self) {
                                item in Text(item)
                            }
                        }
                        
                        .pickerStyle(.wheel)
                    }
                    VStack{
                        Text("Chord Type").font(.title3)
                        Picker("Major/Minor", selection: $selectedType) {
                            ForEach(chordType, id: \.self) {
                                item in Text(item)
                            }
                        }
                        .pickerStyle(.wheel)
                    }
                }
                VStack {
                    Button("Play Chord") {
                        self.chords.playChord(chord: fullChord, instrument: currentInst)
                    }
                    .foregroundColor(Color.white)
                    .frame(width: 150, height: 50)
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                    
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        showSettings.toggle()
                    } label: {
                        Image(systemName: "gear")
                    }
                    
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        quizOn.toggle()
                    } label: {
                        Text("Chord Quiz")
                    }
                }
            }
            .navigationDestination(isPresented: $showSettings) {
                SettingsView(currentInst: $currentInst)
            }
            .navigationDestination(isPresented: $quizOn) {
                QuizView(currentInst: $currentInst)
            }
        }
        .onAppear {
            if quizOn {
                quizOn.toggle()
            }
        }
    }
}

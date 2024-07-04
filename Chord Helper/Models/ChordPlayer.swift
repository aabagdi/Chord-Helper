//
//  CursedPlayer.swift
//  
//
//  Created by Aadit Bagdi on 12/13/22.
//

import AVFoundation

class ChordPlayer {
    private var chordPlayer: AVAudioPlayer!
    
    func playChord(chord: String, instrument: String) {
        let sound = Bundle.main.url(forResource: chord, withExtension: "wav", subdirectory: instrument)
        self.chordPlayer = try! AVAudioPlayer(contentsOf: sound!)
        self.chordPlayer?.play()
    }
    
}


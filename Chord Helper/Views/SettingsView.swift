//
//  SettingsView.swift
//  Guitar Chord Finder
//
//  Created by Aadit Bagdi on 12/15/22.
//

import SwiftUI

struct SettingsView: View {
    @Binding var currentInst: String
    
    var body: some View {
        Form {
            Section("Settings") {
                Picker(selection: $currentInst, label: Text("Instrument"), content: {
                    Text("Guitar").tag("Guitar")
                    Text("Piano").tag("Piano")})
            }
            Section("Thanks so much to Sima for her help!") {
            }
        }
    }
}

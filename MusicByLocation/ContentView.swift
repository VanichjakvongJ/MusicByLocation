//
//  ContentView.swift
//  MusicByLocation
//
//  Created by Vanichjakvong, Jakpat (IRG) on 25/02/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var state = StateController()
    
    var body: some View {
        VStack {
            List {
                ForEach(state.artistsByLocation, id: \.self) { artist in
                    Text("\(artist)")
                }
            }
            .padding()
            Spacer()
            Button("Find Music") {
                state.findMusic()
            } .onAppear(perform: {
                state.requestAccessToLocationData()
            })
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

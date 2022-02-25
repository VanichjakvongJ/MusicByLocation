//
//  ContentView.swift
//  MusicByLocation
//
//  Created by Vanichjakvong, Jakpat (IRG) on 25/02/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var locationHandler = LocationHandler()
    var lastKnownLocation: String = ""
    
    var body: some View {
        VStack {
            Text(locationHandler.locationInformation)
                .padding()
            Spacer()
            Button("Find Music") {
                locationHandler.requestLocation()
            } .onAppear(perform: {
                locationHandler.requestAuthorization()
            })
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

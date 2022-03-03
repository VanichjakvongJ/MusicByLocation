//
//  StateController.swift
//  MusicByLocation
//
//  Created by Vanichjakvong, Jakpat (IRG) on 28/02/2022.
//

import Foundation

class StateController: ObservableObject {
    @Published var artistsByLocation: [String] = []
    let locationHandler: LocationHandler = LocationHandler()
    let iTunesAdaptor = ITunesAdaptor()
    
    var lastKnownLocation: String = "" {
        didSet {
            iTunesAdaptor.getArtists(search: lastKnownLocation, completion: updateArtistsByLocation)
        }
    }
    
    func findMusic() {
        locationHandler.requestLocation()
    }
    
    func requestAccessToLocationData() {
        locationHandler.stateController = self
        locationHandler.requestAuthorization()
    }
    
    func updateArtistsByLocation(artists: [Artist]?) {
        let names = artists?.map { return $0.name }
        DispatchQueue.main.async {
            self.artistsByLocation = names ?? ["Error finding Artists from your location"]
        }
    }
}

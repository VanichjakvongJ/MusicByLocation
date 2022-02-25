//
//  LocationHandler.swift
//  MusicByLocation
//
//  Created by Vanichjakvong, Jakpat (IRG) on 25/02/2022.
//

import Foundation
import CoreLocation

class LocationHandler: NSObject, CLLocationManagerDelegate, ObservableObject {
    let manager = CLLocationManager()
    let geocoder = CLGeocoder()
    @Published var locationInformation: String = ""
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func requestAuthorization() {
        manager.requestWhenInUseAuthorization()
    }
    
    func requestLocation() {
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let firstLocation = locations.first {
            geocoder.reverseGeocodeLocation(firstLocation, completionHandler: { (placemarks, error) in
                if error != nil {
                    self.locationInformation = "Could not perform lookup of location from coordinate information"
                } else {
                    if let firstPlacemark = placemarks?[0] {
                        self.locationInformation = """
                                                   Name: \(firstPlacemark.name ?? "Could not find name")
                                                   ISO country code: \(firstPlacemark.isoCountryCode ?? "Could not find ISO country code")
                                                   Country: \(firstPlacemark.country ?? "Could not find country")
                                                   Postal Code: \(firstPlacemark.postalCode ?? "Could not find postal code")
                                                   Administrative Area: \(firstPlacemark.administrativeArea ?? "Could not find administrative area")
                                                   Administrative Area Information: \(firstPlacemark.subAdministrativeArea ?? "Could not find administrative area information")
                                                   Locality: \(firstPlacemark.locality ?? "Could not find locality")
                                                   Locality Information: \(firstPlacemark.subLocality ?? "Could not find locality information")
                                                   Street Address: \(firstPlacemark.thoroughfare ?? "Could not find street address")
                                                   Street Address Information: \(firstPlacemark.subThoroughfare ?? "Could not find street address information ")
                                                   """
                    }
                }
            })
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        locationInformation = "Error finding location"
    }
}

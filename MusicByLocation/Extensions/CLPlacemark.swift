//
//  CLPlacemark.swift
//  MusicByLocation
//
//  Created by Vanichjakvong, Jakpat (IRG) on 28/02/2022.
//

import Foundation
import CoreLocation

extension CLPlacemark {
    func getLocationBreakdown() -> String {
        return """
               Name: \(self.name ?? "Could not find name")
               ISO country code: \(self.isoCountryCode ?? "Could not find ISO country code")
               Country: \(self.country ?? "Could not find country")
               Postal Code: \(self.postalCode ?? "Could not find postal code")
               Administrative Area: \(self.administrativeArea ?? "Could not find administrative area")
               Sub-Administrative Area: \(self.subAdministrativeArea ?? "Could not find sub-administrative area")
               City: \(self.locality ?? "Could not find city")
               Sub-City: \(self.subLocality ?? "Could not find sub-city")
               Street Address: \(self.thoroughfare ?? "Could not find street address")
               Sub-Street Address: \(self.subThoroughfare ?? "Could not find sub-street address")
               """
        
    }
}

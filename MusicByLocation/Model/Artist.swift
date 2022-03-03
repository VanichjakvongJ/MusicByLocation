//
//  Artist.swift
//  MusicByLocation
//
//  Created by Vanichjakvong, Jakpat (IRG) on 28/02/2022.
//

import Foundation

struct Artist: Codable {
    var name: String
    var type: String
    
    private enum CodingKeys: String, CodingKey {
        case name = "artistName"
        case type = "artistType"
        //seems not to work with primaryGenreName
    }
}

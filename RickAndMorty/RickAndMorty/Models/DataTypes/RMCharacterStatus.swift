//
//  RMCharacterStatus.swift
//  RickAndMorty
//
//  Created by Ali Amanvermez on 30.12.2022.
//

import Foundation
enum RMCharacterStatus: String, Codable {
    
    case Alive = "Alive"
    case Dead = "Dead"
    case `unknown` = "unknown"
    
    var text : String {
        switch self {
        case .Alive, .Dead:
            return rawValue
        case .unknown:
            return "Unknown"
        }
    }
    
}



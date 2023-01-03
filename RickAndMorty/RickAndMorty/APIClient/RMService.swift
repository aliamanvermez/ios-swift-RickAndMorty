//
//  RMService.swift
//  RickAndMorty
//
//  Created by Ali Amanvermez on 30.12.2022.
//

import Foundation
///Primary API Service object to get Rick and Morty Data 
final class RMService {
    static let shared = RMService()
    private init(){}
    public func execute<T : Codable>(_request: RMRequest, expecting type : T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        
    }
}

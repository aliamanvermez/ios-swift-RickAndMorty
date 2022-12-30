//
//  RMService.swift
//  RickAndMorty
//
//  Created by Ali Amanvermez on 30.12.2022.
//

import Foundation
final class RMService {
    static let shared = RMService()
    private init(){}
    public func execute(_request: RMRequest, completion: @escaping () -> Void) {
        
    }
}

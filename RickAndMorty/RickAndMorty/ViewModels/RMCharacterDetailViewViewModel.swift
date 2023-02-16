//
//  RMCharacterDetailViewViewModel.swift
//  RickAndMorty
//
//  Created by Ali Amanvermez on 16.02.2023.
//

import Foundation

final class RMCharacterDetailViewViewModel {
    private let character : RMCharacter
    init(character: RMCharacter){
        self.character = character
    }
    
    public var title: String {
        character.name.uppercased()
    }
}

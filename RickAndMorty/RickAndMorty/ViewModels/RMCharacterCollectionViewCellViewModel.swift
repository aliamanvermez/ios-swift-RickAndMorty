//
//  RMCharacterCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Ali Amanvermez on 8.01.2023.
//

import Foundation

final class RMCharacterCollectionViewCellViewModel{
    
    public let characterName : String
    private let characterStatus : RMCharacterStatus
    private let characterImageURL : URL?
    
    //MARK: Init
    
    init(characterName: String, characterStatus: RMCharacterStatus, characterImageURL: URL?) {
        self.characterName = characterName
        self.characterStatus = characterStatus
        self.characterImageURL = characterImageURL
    }
    
    //Because of the RMCharacterStatus is an enum, we used raw value.
    public var characterStatusText : String {
        return characterStatus.rawValue
    }
    
    public func fetchImage(completion : @escaping (Result <Data, Error>) -> Void) {
        //TODO: Abstract to Image Manager
        guard let url = characterImageURL else {
            completion(.failure(URLError(.badURL)))
            return
        }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? URLError(.badServerResponse)))
                return
            }
            completion(.success(data))
        }
        task.resume()
    }
}

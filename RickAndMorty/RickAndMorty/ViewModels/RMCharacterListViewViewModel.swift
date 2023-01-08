//
//  CharacterListViewViewModel.swift
//  RickAndMorty
//
//  Created by Ali Amanvermez on 5.01.2023.
//

import Foundation
import UIKit
final class RMCharacterListViewViewModel: NSObject{
    func fetchCharacters() {
        RMService.shared.execute(.listCharactersRequest, expecting: RMGetAllCharacterResponse.self) { result in
            switch result {
            case .success(let model):
                print("Example image url :" + String(model.results.first?.image ?? "No image"))
            case .failure(let failure):
                print(String(describing: failure))
            }
        }
    }
}

extension RMCharacterListViewViewModel : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RMCharacterCollectionViewCell.identifier, for: indexPath) as? RMCharacterCollectionViewCell else {
            fatalError("Unsupported cell")
        }
        let viewModel = RMCharacterCollectionViewCellViewModel(characterName: "Ali", characterStatus: .alive, characterImageURL: nil)
        cell.configure(with: viewModel )
        cell.backgroundColor = .darkGray
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width - 30)/2
        return CGSize(
            width: width,
            height: width * 1.5
        )
    }
    
    
    
    
}

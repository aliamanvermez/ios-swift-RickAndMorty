//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by Ali Amanvermez on 29.12.2022.
//

import UIKit

final class RMCharacterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Characters"
        
//        let request = RMRequest(endpoint: .character,
//                                queryParameters: [URLQueryItem(name: "name", value: "rick"),
//                                                 URLQueryItem(name: "status", value: "alive")])
//        print(request.url)
//        RMService.shared.execute(request, expecting: RMCharacter.self) { result in
//            switch result {
//            case .success:
//                break
//            case .failure(let error):
//                print(String(describing: error))
//r
//            }
//        }
        
        RMService.shared.execute(.listCharactersRequest, expecting: RMGetAllCharacterResponse.self) { result in
            switch result {
            case .success(let success):
                print(String(describing: success))
            case .failure(let failure):
                print(String(describing: failure))
            }
        }

    }
}

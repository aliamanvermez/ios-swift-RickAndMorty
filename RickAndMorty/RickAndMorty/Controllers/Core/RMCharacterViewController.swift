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
        
        let request = RMRequest(endpoint: .character,
                                queryParameters: [URLQueryItem(name: "name", value: "rick"),
                                                 URLQueryItem(name: "status", value: "alive")])
        RMService.shared.execute(_request: request, expecting: String.self) { result in
            
        }
        print(request.url)
    }
}

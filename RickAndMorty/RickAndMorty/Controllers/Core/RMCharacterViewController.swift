//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by Ali Amanvermez on 29.12.2022.
//

import UIKit
import SnapKit
final class RMCharacterViewController: UIViewController, RMCharacterListViewDelegate {
  
    
    private let characterListView = RMCharacterListView()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Characters"
        view.addSubview(characterListView)
        createSnapkit()
    }
    
    func createSnapkit() {
        characterListView.delegate = self
        characterListView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(150)
            make.width.equalToSuperview()
            make.height.equalTo(600)
        }
    }
    
    //MARK: RMCharacterListViewDelegate
    func rmCharacterListView(_ characterListView: RMCharacterListView, didSelectCharacter character: RMCharacter) {
        //Open detail controller for that character
        //Karakterin ayrıntı pageini açan fonksiyon
        let viewModel = RMCharacterDetailViewViewModel(character: character)
        let detailVC = RMCharacterDetailViewController(viewModel: viewModel)
        detailVC.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(detailVC, animated: true)
    }
}









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

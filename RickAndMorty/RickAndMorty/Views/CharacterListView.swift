//
//  CharacterListView.swift
//  RickAndMorty
//
//  Created by Ali Amanvermez on 5.01.2023.
//

import UIKit
import SnapKit
///View that handles showing list of characters, loader, etc.
final class CharacterListView: UIView {
   
    private let viewModel = CharacterListViewViewModel()
    
    
    private let spinner : UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        return spinner
    }()
    
    private let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isHidden = true
        collectionView.alpha = 0
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return collectionView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews(collectionView,spinner)
        createSnapkitConstraints()
        spinner.startAnimating()
        viewModel.fetchCharacters()
        setUpCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createSnapkitConstraints() {
        spinner.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(100)
            make.centerX.equalTo(self.snp.centerX)
            make.centerY.equalTo(self.snp.centerY)
        }
        collectionView.snp.makeConstraints { make in
            make.width.equalTo(self.snp.width)
            make.top.equalTo(self.snp.top).offset(30)
            make.height.equalTo(550)
        
        }
    }
    
    private func setUpCollectionView() {
        collectionView.dataSource =  viewModel
        collectionView.delegate = viewModel
        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
            self.spinner.stopAnimating()
            self.collectionView.isHidden = false
            UIView.animate(withDuration: 0.4){
            self.collectionView.alpha = 1
            }
            
        })
    }
    

}

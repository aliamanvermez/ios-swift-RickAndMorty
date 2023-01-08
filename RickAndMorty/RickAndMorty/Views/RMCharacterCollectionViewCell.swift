//
//  RMCharacterCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Ali Amanvermez on 6.01.2023.
//

import UIKit
import SnapKit
///Single cell for a character
final class RMCharacterCollectionViewCell: UICollectionViewCell {
    static let identifier = "RMCharacterCollectionViewCell"
    
    public let imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let nameLabel : UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 18, weight: .medium)
        return label
    }()
    
    private let statusLabel : UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    //MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubviews(imageView, nameLabel, statusLabel)
        contentView.backgroundColor = .secondarySystemBackground
        addConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addConstraints() {
        statusLabel.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.width.equalToSuperview()
            make.left.equalTo(contentView.snp.left)
            make.bottom.equalTo(contentView.snp.bottom).offset(-3)
        }
        nameLabel.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.width.equalToSuperview()
            make.left.equalTo(contentView.snp.left)
            make.bottom.equalTo(statusLabel.snp.top).offset(-5)
        }
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top)
            make.width.equalTo(contentView.snp.width)
            make.height.equalTo(100)
            make.left.equalTo(contentView.snp.left)
            make.bottom.equalTo(nameLabel.snp.top).offset(-3)
        }
        
        
    }
    
    override func prepareForReuse() {
        imageView.image = nil
        nameLabel.text = nil
        statusLabel.text = nil
    }
    
    public func configure(with viewModel: RMCharacterCollectionViewCellViewModel) {
        nameLabel.text = viewModel.characterName
        statusLabel.text = viewModel.characterStatusText
        viewModel.fetchImage { [weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    self?.imageView.image = image
                }
            case .failure(let error):
                print(String(describing: error))
                break
            }
        }
    }
}
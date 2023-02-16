//
//  RMFooterLoadingCollectionReusableView.swift
//  RickAndMorty
//
//  Created by Ali Amanvermez on 23.01.2023.
//

import UIKit
import SnapKit
final class RMFooterLoadingCollectionReusableView: UICollectionReusableView {
    static let identifier = "RMFooterLoadingCollectionReusableView"
    
    private let spinner : UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        return spinner
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor  = .systemBackground
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private  func addConstraints() {
        addSubview(spinner)
        spinner.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(100)
            make.centerX.equalTo(center)
        }
    }
    
    public func startAnimating() {
        spinner.startAnimating()
    }
    
}

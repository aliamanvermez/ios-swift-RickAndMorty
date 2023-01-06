//
//  UIView+Extensipns.swift
//  RickAndMorty
//
//  Created by Ali Amanvermez on 6.01.2023.
//

import UIKit
extension UIView{
    func addSubviews(_ views: UIView...){
        views.forEach({
            addSubview($0)
        })
    }
}

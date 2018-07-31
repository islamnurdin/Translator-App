//
//  Extensions.swift
//  Translator App
//
//  Created by ITLabAdmin on 7/27/18.
//  Copyright © 2018 ITLabAdmin. All rights reserved.
//

import Foundation
import UIKit


extension UIView {
    func applyStylesViews() {
        self.layer.cornerRadius = 4
        self.layer.shadowColor = UIColor(red:0.54, green:0.79, blue:0.79, alpha:1.0).cgColor
        self.layer.shadowRadius = 4
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowOpacity = 0.5
    }
}

extension UIButton {
    func applyStyleButton() {
        self.backgroundColor = UIColor(red:0.45, green:0.88, blue:0.88, alpha:1.0)
        self.layer.cornerRadius = 4
        self.setTitle("Посмотреть историю", for: .normal)
        self.setTitleColor(UIColor.white, for: .normal)
    }
}


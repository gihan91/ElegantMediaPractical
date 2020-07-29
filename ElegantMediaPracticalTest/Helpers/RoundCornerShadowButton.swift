//
//  RoundCornerShadowButton.swift
//  ElegantMediaPracticalTest
//
//  Created by Gihan on 7/29/20.
//  Copyright © 2020 Gihan. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class RoundConerShadowButton: UIButton {

    @IBInspectable var shadow: Bool = false {
        didSet {
            self.addShadow()
        }
    }

    @IBInspectable var shadowColor: UIColor = UIColor.white {
        didSet {
            self.addShadow()
        }
    }

    @IBInspectable var shadowOffset: CGPoint = .zero {
        didSet {
            self.addShadow()
        }
    }

    @IBInspectable var shadowOpacity: CGFloat = 0.0 {
        didSet {
            self.addShadow()
        }
    }

    @IBInspectable var shadowRadius: CGFloat = 0.0 {
        didSet {
            self.addShadow()
        }
    }

    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
            // Don't touch the masksToBound property if a shadow is needed in addition to the cornerRadius
            if shadow == false {
                self.layer.masksToBounds = true
            }
        }
    }

    @IBInspectable var backgroundColour: UIColor {
        get {
            return UIColor(cgColor: self.layer.backgroundColor ?? UIColor.white.cgColor)
        }
        set {
            self.layer.backgroundColor = newValue.cgColor
            if shadow == false {
                self.layer.masksToBounds = true
            }
        }
    }

    private func addShadow() {
        if shadow {
            layer.shadowColor = shadowColor.cgColor
            layer.shadowOffset = CGSize(width: shadowOffset.x, height: shadowOffset.y)
            layer.shadowOpacity = Float(shadowOpacity)
            layer.shadowRadius = shadowRadius
        }
    }
}

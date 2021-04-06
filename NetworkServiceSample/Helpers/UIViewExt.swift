//
//  UIViewExt.swift
//  NetworkServiceSample
//
//  Created by sHiKoOo on 4/6/21.
//

import UIKit

extension UIView{
    
    func fadeTo(alphaValue: CGFloat, withDuration duration: TimeInterval) {
        UIView.animate(withDuration: duration) {
            self.alpha = alphaValue
        }
    }
}

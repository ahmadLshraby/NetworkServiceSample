//
//  UIViewControllerSpinnerExt.swift
//  NetworkServiceSample
//
//  Created by sHiKoOo on 4/6/21.
//

import UIKit

extension UIViewController {
    
    func shouldPresentLoadingView(_ status: Bool) {
        var fadeView: UIView?
        
        if status == true {
            fadeView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
//            fadeView?.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.3867134452, blue: 0.5730444193, alpha: 1)
//            fadeView?.alpha = 1.0
            fadeView?.tag = 99
            
            let spinner = UIActivityIndicatorView()
            spinner.color = #colorLiteral(red: 0.1176470588, green: 0.1176470588, blue: 0.1176470588, alpha: 1)
            if #available(iOS 13.0, *) {
                spinner.style = .large
            } else {
                spinner.style = .whiteLarge
            }
            spinner.center = view.center
            
            view.addSubview(fadeView!)
            fadeView?.addSubview(spinner)
            
            spinner.startAnimating()
            
            fadeView?.fadeTo(alphaValue: 1.0, withDuration: 0.2)
        }else {
            for subview in view.subviews {
                if subview.tag == 99 {
                    UIView.animate(withDuration: 0.2, animations: {
                        subview.alpha = 0.0
                    }) { (finished) in
                        subview.removeFromSuperview()
                    }
                }
            }
        }
    }
    
    func shouldPresentAlertViewWithAction(withTitle title: String, message msg: String,
                                          yesActionTitle: String, noActionTitle: String?,
                                          yesActionColor: UIColor, noActionColor: UIColor,
                                          delegate del: Any?, parentViewController parentVC: UIViewController, completionHandler: @escaping (Bool) -> Void ) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        
        let yesAction = UIAlertAction(title: yesActionTitle, style: .default) { (response) in
            completionHandler(true)
        }
        yesAction.setValue(yesActionColor, forKey: "titleTextColor")
        alert.addAction(yesAction)
        
        if let no = noActionTitle {
            let noAction = UIAlertAction(title: no, style: .cancel) { (response) in
                completionHandler(false)
            }
            noAction.setValue(noActionColor, forKey: "titleTextColor")
            alert.addAction(noAction)
        }
        
        parentVC.present(alert as UIViewController, animated: true, completion: nil)
    }
    
    
    
}

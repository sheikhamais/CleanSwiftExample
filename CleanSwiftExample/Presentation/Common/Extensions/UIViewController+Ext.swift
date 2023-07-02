//
//  UIViewController+Ext.swift
//  CleanSwiftExample
//
//  Created by Pro on 02/07/2023.
//

import UIKit

extension UIViewController {
    
    func showErrorAlert(with message: String) {
        
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .default))
        self.present(alert, animated: true)
    }
    
    func showActivityIndicator() {
        
        guard ActivityIndicatorReferences.reference[self] == nil else {
            return
        }
        
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.tintColor = .purple
        indicator.startAnimating()
        
        view.addSubview(indicator)
        
        NSLayoutConstraint.activate([
            indicator.heightAnchor.constraint(equalToConstant: 60),
            indicator.widthAnchor.constraint(equalToConstant: 60),
            indicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            indicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        view.isUserInteractionEnabled = false
        ActivityIndicatorReferences.reference[self] = indicator
    }
    
    func hideActivityIndicator() {
        let indicator = ActivityIndicatorReferences.reference[self]
        indicator?.removeFromSuperview()
        view.isUserInteractionEnabled = true
        ActivityIndicatorReferences.reference[self] = nil
    }
}

extension UIViewController {
    
    struct ActivityIndicatorReferences {
        static var reference = [UIViewController: UIActivityIndicatorView]()
    }
}

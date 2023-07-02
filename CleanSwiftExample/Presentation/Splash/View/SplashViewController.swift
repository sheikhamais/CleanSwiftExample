//
//  SplashViewController.swift
//  CleanSwiftExample
//
//  Created by Pro on 04/06/2023.
//

import UIKit

class SplashViewController: UIViewController {
    
    static func create(viewModel: SplashViewModel = SplashViewModel()) -> SplashViewController {
        let vc = UIStoryboard.splash.instantiateViewController(withIdentifier: "SplashViewController") as! SplashViewController
        vc.viewModel = viewModel
        return vc
    }
    
    private var viewModel: SplashViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTapStart(_ sender: Any) {
        
        let vc = HomeViewController.create(dependencyValue: 10)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

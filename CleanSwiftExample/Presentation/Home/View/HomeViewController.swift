//
//  HomeViewController.swift
//  CleanSwiftExample
//
//  Created by Pro on 04/06/2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    static func create(viewModel: HomeViewModel = HomeViewModel(), dependencyValue: Int) -> HomeViewController {
        let vc = UIStoryboard(name: "HomeViewController", bundle: nil).instantiateInitialViewController() as! HomeViewController
        vc.viewModel = viewModel
        vc.dependencyValue = dependencyValue
        return vc
    }
    
    @IBOutlet weak var numberLabel: UILabel!
    private var dependencyValue: Int?
    private var viewModel: HomeViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabelValue()
    }
    
    @IBAction func someEventOccured(_ sender: Any) {
        
        guard let value = dependencyValue else {
            return
        }
        
        self.showActivityIndicator()
        viewModel?.fetchData(fromParameters: value) { result in
            self.hideActivityIndicator()
            
            switch result {
            case .success(let newValue):
                self.dependencyValue = newValue
                self.setLabelValue()
            case .failure(let error):
                self.showErrorAlert(with: error.localizedDescription)
            }
        }
    }
    
    private func setLabelValue() {
        if let val = dependencyValue {
            numberLabel.text = "\(val)"
        } else {
            numberLabel.text = ""
        }
    }
}

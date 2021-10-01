//
//  HomeViewController.swift
//  MetideCountryList
//
//  Created by Norhan Boghdadi on 10/1/21.
//

import UIKit

class HomeViewController: UIViewController {

    var viewModel: ViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel = HomeViewModel(viewController: self)
        
    }


}


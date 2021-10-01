//
//  HomeViewModel.swift
//  MetideCountryList
//
//  Created by Norhan Boghdadi on 10/1/21.
//

import Foundation

class HomeViewModel: ViewModel {
    var viewController: DataLoaderController?
    var numberOfCountries: Int = 0
    var countriesList = [CountiresList]()
    
    
    init(viewController: DataLoaderController) {
        self.viewController = viewController
        DispatchQueue.main.async {
            viewController?.dataLoaded()
        }
    }
    
    func data(for cellAt: IndexPath) -> CountiresList {
        countriesList[cellAt.row]
    }
    
    
    
}

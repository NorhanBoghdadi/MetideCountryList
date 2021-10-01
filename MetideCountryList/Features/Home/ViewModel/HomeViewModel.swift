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
    
    init(viewController: DataLoaderController) {
        self.viewController = viewController
        DispatchQueue.main.async {
            <#code#>
        }
    }
    
    func data(for cellAt: IndexPath) -> CountiresList {
        <#code#>
    }
    
    
}

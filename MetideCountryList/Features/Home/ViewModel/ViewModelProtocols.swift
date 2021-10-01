//
//  ViewModelProtocols.swift
//  MetideCountryList
//
//  Created by Norhan Boghdadi on 10/1/21.
//

import Foundation

typealias DataLoaderController = (LoadableController & NotifaiableController)?

protocol ViewModel: ReusableDataViewModel {
    var viewController: DataLoaderController? { get }
    var numberOfCountries: Int { get }
}

protocol ReusableDataViewModel {
    func data(for cellAt: IndexPath) -> CountiresList
}

protocol LoadableController: AnyObject {
    func showLoader()
    func hideLoader()
}

protocol NotifaiableController: AnyObject {
    func dataLoaded()
}

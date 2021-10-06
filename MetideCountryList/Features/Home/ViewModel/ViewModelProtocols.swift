//
//  ViewModelProtocols.swift
//  MetideCountryList
//
//  Created by Norhan Boghdadi on 10/1/21.
//

import Foundation


protocol ViewModel: ReusableDataViewModel {
    var viewController: NotifaiableController? { get }
    var numberOfCountries: Int { get }
}

protocol ReusableDataViewModel {
    func data(for cellAt: IndexPath) -> CountiresList
}

protocol NotifaiableController: AnyObject {
    func dataLoaded()
}
protocol TransferData {
    func sendData(indexPath: IndexPath)
}

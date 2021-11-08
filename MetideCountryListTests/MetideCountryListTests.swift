//
//  MetideCountryListTests.swift
//  MetideCountryListTests
//
//  Created by Norhan Boghdadi on 10/1/21.
//

import XCTest
@testable import MetideCountryList


class ViewControllerMock  {

}
extension ViewControllerMock: NotifaiableController {
    func dataLoaded() {
        
    }
    
    
}


class MetideCountryListTests: XCTestCase {

    
//    var fakeData = CountiresList(id: 23, enabled: "hd", code3L: "hdhd", code2L: "dghd", name: "Eg", nameOfficial: "Egypt", flag: "hfdj", latitude: "hdf", longitude: "dhfjhd", zoom: "dhhdhd")

    
    func testNumberOfCountriesWhenItsZero() throws  {
        let sut = HomeViewModel(viewController: ViewControllerMock())
        XCTAssertEqual(sut.numberOfCountries, 0)
    
    }
    
//    func testNumberOfCountriesWhenHasItems() throws  {
//        let sut = HomeViewModel(viewController: ViewControllerMock())
//        
//        sut.countriesList.append(contentsOf: [CountiresList](repeating: fakeData , count: 10))
//        XCTAssertEqual(sut.numberOfCountries, 10)
//        XCTAssertEqual(sut.numberOfCountries, 20)
//
//
//    }
}

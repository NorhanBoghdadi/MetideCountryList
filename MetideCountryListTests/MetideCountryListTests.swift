//
//  MetideCountryListTests.swift
//  MetideCountryListTests
//
//  Created by Norhan Boghdadi on 10/1/21.
//

import XCTest
@testable import MetideCountryList

class MetideCountryListTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        class testView: HomeViewModel {
            
        }
        var viewModel = testView(viewController: HomeViewController())
        XCTAssertEqual(viewModel.sayHello(), "Hello")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

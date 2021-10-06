//
//  MetideCountryListUITests.swift
//  MetideCountryListUITests
//
//  Created by Norhan Boghdadi on 10/1/21.
//


import XCTest

class MetideCountryListUITests: XCTestCase {

//    var app: XCUIApplication!

    override class func setUp() {
        let app = XCUIApplication()
        setupSnapshot(app)
        app.launch()
    }
    override class func tearDown() {
        
    }


    func testSnapshot() {
        let app = XCUIApplication()
        snapshot("1Launch")
        app.tables["table--countriesTableView"]
        snapshot("2Howitworks")
    }
    
    func testView() {
        let app = XCUIApplication()
        app.launch()
        let table = app.tables["table--countriesTableView"]
        XCTAssertTrue(table.exists, "Countries TableView exists." )
    }

}


//
//  MetideCountryListUITests.swift
//  MetideCountryListUITests
//
//  Created by Norhan Boghdadi on 10/1/21.
//

   
import XCTest

class MetideCountryListUITests: XCTestCase {
   
    var app: XCUIApplication!

    override func setUpWithError() throws {
        try super.setUpWithError()
    }
    
    func testView() throws {
        app = XCUIApplication()
        app.launch()
        let table = app.tables["table--countriesTableView"]
        XCTAssertTrue(table.exists, "Countries TableView exists." )
        
    }
   
}

//
//  ImageLoaderTests.swift
//  MetideCountryListTests
//
//  Created by Norhan Boghdadi on 11/8/21.
//

import XCTest
@testable import MetideCountryList

class ImageLoaderTests: XCTestCase {
    
    func testImageLoader() {
        let sut = ImageLoader.shared
        let imageUrl = "https://firebasestorage.googleapis.com/v0/b/job-interview-cfe5a.appspot.com/o/AR.png?alt=media"
        let img = UIImage(named: "ar-test")
        let imgData = img?.pngData()
        sut.loadImageData(url: URL(string: imageUrl)!) { results in
            switch results {
            case .failure(let error):
                XCTAssertThrowsError(error)
            case .success(let data):
                XCTAssertEqual(data, imgData)
            }
                
        }
    }

}

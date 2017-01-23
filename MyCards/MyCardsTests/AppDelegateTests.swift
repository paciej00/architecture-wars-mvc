//
//  AppDelegateTests.swift
//  MyCards
//
//  Created by Maciej Piotrowski on 22/01/17.
//

import XCTest
@testable import MyCards

class AppDelegateTests: XCTestCase {
    
    var sut: AppDelegate!
    override func setUp() {
        super.setUp()
        sut = AppDelegate()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    
    
    
    
    
    
    
    
    

    func testNoSourceApplication() {
        let validURL: URL = URL(string: "io.swifting.MyCards")!
        
        XCTAssertFalse(sut.application(UIApplication.shared, open: validURL, options: [:]))
    }

    
    
    
    
    
    
    
    
    
    
    

    func testInvalidSourceApplication() {
        let validURL: URL = URL(string: "io.swifting.MyCards")!
        let invalidSource: String = "com.malware.DestroyerApp"

        XCTAssertFalse(sut.application(UIApplication.shared, open: validURL, options: [.sourceApplication : invalidSource]))
    }
    
    
    
    
    
    
    
    
    
    
    
    
    func testSomeParamsURL() {
        let validURL: URL = URL(string: "io.swifting.MyCards?card=1234&secure=true&destroy_this_damn_app=false")!
        let validSource: String = "io.swifting.OtherApp"
        print(validURL)
        XCTAssertTrue(sut.application(UIApplication.shared, open: validURL, options: [.sourceApplication : validSource]))
    }
    
    
    
    
    
    
    
    
    
    
    
    
    func testInvalidParamsURL() {
        let invalidURL: URL = URL(string: "io.swifting.MyCards?destroy_this_damn_app=true")!
        let validSource: String = "io.swifting.OtherApp"
        print(invalidURL)

        
        XCTAssertFalse(sut.application(UIApplication.shared, open: invalidURL, options: [.sourceApplication : validSource]))
    }
    
    
    
    
    
    
    
    
    
    
    
    
    func testInvalidContent() {
        let invalidURL: URL = URL(string: "io.swifting.MyCards?destroy_this_damn_app=true")!
        let invalidSource: String = "com.malware.DestroyerApp"
        
        XCTAssertFalse(sut.application(UIApplication.shared, open: invalidURL, options: [.sourceApplication : invalidSource]))
    }
    
    
    
    
    
    
    
    
    
    
    
    func testValidSourceApplication() {
        let validURL: URL = URL(string: "io.swifting.MyCards")!
        let validSource: String = "io.swifting.OtherApp"
        
        XCTAssertTrue(sut.application(UIApplication.shared, open: validURL, options: [.sourceApplication : validSource]))
    }
    
    
    
    
    
    
    
    
    
    
    
    
}

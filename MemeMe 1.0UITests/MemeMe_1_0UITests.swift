//
//  MemeMe_1_0UITests.swift
//  MemeMe 1.0UITests
//
//  Created by David Koch on 08.09.22.
//

import XCTest

class MemeMe_1_0UITests: XCTestCase {
    var app: XCUIApplication!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        
        try super.setUpWithError()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    /*override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }*/

    func testRenderImage() {
        

        app.toolbars["Toolbar"].buttons["Album"].tap()
        app/*@START_MENU_TOKEN@*/.scrollViews.otherElements.images["Photo, 09 octobre 2009, 2:09 PM"]/*[[".otherElements[\"Photos\"].scrollViews.otherElements",".otherElements[\"Photo, 13 mars 2011, 1:17 AM, Photo, 09 octobre 2009, 2:09 PM, Photo, 08 août 2012, 1:52 PM, Photo, 08 août 2012, 4:29 PM, Photo, 08 août 2012, 4:55 PM, Photo, 30 mars 2018, 9:14 PM\"].images[\"Photo, 09 octobre 2009, 2:09 PM\"]",".images[\"Photo, 09 octobre 2009, 2:09 PM\"]",".scrollViews.otherElements"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["_TtGC7SwiftUI19UIHosting"].children(matching: .other).element(boundBy: 0).children(matching: .other).element.tap()
                

        
    }
}

//
//  lec10_9_maps_notificationsUITestsLaunchTests.swift
//  lec10-9-maps-notificationsUITests
//
//  Created by ATLAS Laptop 4 Guest on 10/9/23.
//

import XCTest

final class lec10_9_maps_notificationsUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}

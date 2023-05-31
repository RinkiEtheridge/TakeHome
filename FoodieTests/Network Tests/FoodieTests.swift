//
//  FoodieTests.swift
//  FoodieTests
//
//  Created by Rinki Etheridge on 5/31/23.
//

import XCTest
@testable import Foodie

final class FoodieTests: XCTestCase {

    func testFoodieSearch() throws {
        let request = FoodFinderService()
        let expectation = self.expectation(description: "FoodSearchRequest")
        let result = await request.getFoodList(text: "chicken")
        switch result {
        case .success(let foodItems):
            XCTAssertNotNil(foodItems.count)
        case .failure(let error):
            XCTAssertNil(error)
        }
        expectation.fulfill()

        self.waitForExpectations(timeout: 5) { error in
            XCTAssertNil(error)
        }

    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}

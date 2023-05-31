//
//  FoodieTests.swift
//  FoodieTests
//
//  Created by Rinki Etheridge on 5/31/23.
//

import XCTest
@testable import Foodie

final class FoodieTests: XCTestCase {

    func testFoodieSearch() async throws {
        let request = FoodFinderService()
        let expectation = self.expectation(description: "FoodSearchRequest")
        let result = await request.getFoodList(text: "Chicken")
        switch result {
        case .success(let foodItems):
            XCTAssertNotNil(foodItems.count)
        case .failure(let error):
            XCTAssertNil(error)
        }
        expectation.fulfill()

        await self.waitForExpectations(timeout: 5) { error in
            XCTAssertNil(error)
        }
    }
}

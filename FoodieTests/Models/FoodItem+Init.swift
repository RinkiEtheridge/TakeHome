//
//  FoodItem+Init.swift
//  FoodieTests
//
//  Created by Rinki Etheridge on 5/31/23.
//

import Foundation

extension FoodItem {
    static func mock(id: Int = 0,
                     brand: String = "Journal Communications",
                     name: String = "BBQ Chicken Pizza",
                     calories: Int = 119,
                     portion: Int = 231) -> FoodItem {
        return FoodItem(id: id,
                        brand: brand,
                        name: name,
                        calories: calories,
                        portion: portion)
    }
}

extension FoodItem: Equatable {
    public static func == (lhs: FoodItem, rhs: FoodItem) -> Bool {
        lhs.id == rhs.id
    }
}

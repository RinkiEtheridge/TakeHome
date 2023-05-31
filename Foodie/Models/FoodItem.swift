//
//  FoodItem.swift
//  Foodie
//
//  Created by Rinki Etheridge on 5/30/23.
//

import Foundation

struct FoodItem: Codable {
    let id: Int
    let brand: String
    let name: String
    let calories: Int
    let portion: Int
}

typealias FoodItems = [FoodItem]


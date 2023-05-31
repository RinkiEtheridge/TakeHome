//
//  FoodieText.swift
//  Foodie
//
//  Created by Rinki Etheridge on 5/30/23.
//

import Foundation

// MARK: - Labels

struct FoodieText {
    static let Search: String = "Search".localized()
    static let Cancel: String = "Cancel".localized()
    static let OK: String = "OK".localized()
    static let Error: String = "Error".localized()
}

// MARK: - Messages displayed in the app

struct Messages {
    static let NoResults: String = "No results found for the entered food item.".localized()
    static let EnterFood: String = "Enter atleast 3 letters to get food list.".localized()
}

// MARK: - Localization utility

public extension String {

    /// SwifterSwift: Returns a localized string, with an optional comment for translators.
    ///
    /// "Hello world".localized -> Hallo Welt
    ///
    func localized(comment: String = "") -> String {
        return NSLocalizedString(self, comment: comment)
    }

}

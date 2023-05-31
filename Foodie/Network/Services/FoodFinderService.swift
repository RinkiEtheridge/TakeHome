//
//  FoodFinderService.swift
//  Foodie
//
//  Created by Rinki Etheridge on 5/30/23.
//

import Foundation

protocol FoodFinderServiceable {
    /// A method to call an endpoint to fetch list of food items
    /// - Parameter text: User Entered Text
    func getFoodList(text: String?) async -> Result<FoodItems, NetworkError>
}


/// We can cache the response locally to avoid multiple network callls
struct FoodFinderService: HttpClient, FoodFinderServiceable {
    func getFoodList(text: String?) async -> Result<FoodItems, NetworkError> {
        let result = await sendRequest(endPoint: FoodieEndpoint.getSearchResults(searchText: text), responseModel: FoodItems.self)
        switch result {
            case .success(let foodItems):
                // In case of an empty list, return NoResults error
                guard !foodItems.isEmpty else {
                    return .failure(NetworkError.other(Messages.NoResults))
                }
                return result
            case .failure(_):
                return result
        }
    }
}

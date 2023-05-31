//
//  FoodieEndpoint.swift
//  Foodie
//
//  Created by Rinki Etheridge on 5/30/23.
//

import Foundation

enum FoodieEndpoint: Endpoint {
    case getSearchResults(searchText: String?)

    var path: String {
        switch self {
            case .getSearchResults:
                return "/dev/search"
        }
    }

    var parameters: [URLQueryItem]? {
        switch self {
            case .getSearchResults(let searchText):
                return [URLQueryItem(name: "kv", value: searchText)]
        }
    }

    var header: [String : String]? {
        // Access Token to use in header
        let accessToken = "jhdusgd"
        switch self {
        default:
            return [
                "Authorization": "JWT \(accessToken)",
                "Content-Type": "application/json;charset=utf-8"
            ]
        }
    }

    var body: Any? {
        switch self {
        case .getSearchResults:
            return nil
        }
    }
}

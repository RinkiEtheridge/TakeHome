//
//  Endpoint.swift
//  Foodie
//
//  Created by Rinki Etheridge on 5/30/23.
//

import Foundation

protocol Endpoint {

    /// http or https
    var scheme: String { get }

    /// "uih0b7slze.execute-api.us-east-1.amazonaws.com"
    var baseURL: String { get }

    /// "/dev//search"
    var path: String { get }

    /// "GET" or "POST" or "DELETE"
    var method: HttpMethod { get }

    /// [URLQueryItem(name: "api_key",  value: API_KEY)]
    var parameters: [URLQueryItem]? { get }

    var header: [String: String]? { get }

    var body: Any? { get }
}

extension Endpoint {
    var scheme: String {
        switch self {
        default:
            return "https"
        }
    }

    var baseURL: String {
        switch self {
        default:
            return "uih0b7slze.execute-api.us-east-1.amazonaws.com"
        }
    }

    var method: HttpMethod {
        switch self {
        default:
            return HttpMethod.get
        }
    }
}

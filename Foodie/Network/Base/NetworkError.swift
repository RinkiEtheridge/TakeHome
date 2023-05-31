//
//  NetworkError.swift
//  Foodie
//
//  Created by Rinki Etheridge on 5/30/23.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noResponse
    case unAuthorized
    case malformedRequest
    case malformedResponse
    case internalServerError
    case unexpectedStatusCode
    case unknown
    case other(String?)

    var errorMessage: String {
        switch self {
            case .unAuthorized:
                return "Unauthorized"
            case .other(let error):
                return error ?? "Unknown error"
            default:
                return "Unknown error"
        }
    }
}


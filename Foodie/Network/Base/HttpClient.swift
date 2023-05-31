//
//  HttpClient.swift
//  Foodie
//
//  Created by Rinki Etheridge on 5/30/23.
//

import Foundation

protocol HttpClient {
    /// A method to send request to the server
    /// - Parameter endPoint: End Point consists meta data to form url
    /// - Parameter responseModel: Generic endpoint response model type
    func sendRequest<T: Decodable>(endPoint: Endpoint, responseModel: T.Type) async -> Result<T, NetworkError>
}

extension HttpClient {
    func sendRequest<T: Decodable>(
        endPoint: Endpoint,
        responseModel: T.Type
    ) async -> Result<T, NetworkError> {
        var urlComponents = URLComponents()
        urlComponents.scheme = endPoint.scheme
        urlComponents.host = endPoint.baseURL
        urlComponents.path = endPoint.path
        urlComponents.queryItems = endPoint.parameters
        guard let url = urlComponents.url else {
            return .failure(.invalidURL)
        }

        var request = URLRequest(url: url)
        request.httpMethod = endPoint.method.rawValue
        //request.allHTTPHeaderFields = endPoint.header

        if let body = endPoint.body {
            request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        }

        do {
            let (data, response) = try await URLSession.shared.data(for: request, delegate: nil)
            guard let response = response as? HTTPURLResponse else {
               return .failure(.noResponse)
            }
            switch response.statusCode {
            case 200...299:
               guard let decodedResponse = try? JSONDecoder().decode(responseModel, from: data) else {
                   return .failure(.malformedResponse)
               }
               return .success(decodedResponse)
           case 401:
               return .failure(.unAuthorized)
           default:
               return .failure(.unexpectedStatusCode)
           }
       } catch {
           return .failure(.unknown)
       }
    }

}

//
//  NetworkClient.swift
//  IOS Network Call
//
//  Created by Arslan on 27/01/2026.
//

import Foundation


final class NetworkClient {
    func send<T: APIRequestProtocol> (_ request : T) async throws -> T.Response {
        
        guard let url = request.url else {
            throw NetworkError.invalidURL
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.endpoint.method.rawValue
        
        let (data, response) : (Data, URLResponse)
        
        do {
            (data, response) = try await URLSession.shared.data(for: urlRequest)
        } catch {
            throw NetworkError.UnknownError(error)
        }
        
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.UnknownError(NSError(domain: "Invalid response", code: 0))
        }
        
        guard (200 ..< 300).contains(httpResponse.statusCode) else {
            throw NetworkError.ServerError(statusCode: httpResponse.statusCode)
        }
        
        do {
            return try JSONDecoder().decode(T.Response.self, from: data)
        }
        catch {
            throw NetworkError.decodingError
        }
        
        
    }
}

//
//  APIRequestProtocol.swift
//  IOS Network Call
//
//  Created by Arslan on 27/01/2026.
//

import Foundation

protocol APIRequestProtocol {
    associatedtype Response: Decodable
    var endpoint: Endpoint { get }
}


extension APIRequestProtocol {
    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "jsonplaceholder.typicode.com"  //Base URL
        components.path = endpoint.path
        return components.url
    }
}

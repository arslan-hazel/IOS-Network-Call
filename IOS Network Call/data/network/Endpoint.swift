//
//  Endpoint.swift
//  IOS Network Call
//
//  Created by Arslan on 27/01/2026.
//

import Foundation

enum Endpoint{
    case users
    case posts
    case comments(postId: Int)
    
    var path: String{
        switch self {
        case .users:
            return "/users"
        case .posts:
            return "/posts"
        case .comments(postId: let postId):
            return "/posts/\(postId)/comments"
        }
    }
    
    var method: HTTPMethod{
        switch self {
        case .users, .posts, .comments:
            return .GET
    
        }
    }
}


enum NetworkError: Error{
    case invalidURL
    case decodingError
    case ServerError(statusCode: Int)
    case UnknownError(Error)
}

enum HTTPMethod: String{
    case GET, POST, PUT, DELETE
}

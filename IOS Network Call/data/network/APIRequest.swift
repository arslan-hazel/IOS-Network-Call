//
//  APIRequest.swift
//  IOS Network Call
//
//  Created by Arslan on 27/01/2026.
//

import Foundation


struct GetUserRequest: APIRequestProtocol {
    typealias Response = [User]
    let endpoint: Endpoint = .users
}

struct GetPostsRequest: APIRequestProtocol {
    typealias Response = [Post]
    let endpoint: Endpoint = .posts
}

struct GetCommentsRequest: APIRequestProtocol {
    typealias Response = [Comment]
    let endpoint: Endpoint = .users
}

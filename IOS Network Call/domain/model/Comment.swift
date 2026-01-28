//
//  Comment.swift
//  IOS Network Call
//
//  Created by Arslan on 27/01/2026.
//

import Foundation
struct Comment: Codable, Identifiable {
    let id: Int
    let postId: Int
    let name: String
    let email: String
    let body: String
}

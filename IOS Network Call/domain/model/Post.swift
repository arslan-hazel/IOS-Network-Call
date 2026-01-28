//
//  Post.swift
//  IOS Network Call
//
//  Created by Arslan on 27/01/2026.
//

import Foundation

struct Post: Codable, Identifiable {
    let id: Int
    let userId: Int
    let title: String
    let body: String
}

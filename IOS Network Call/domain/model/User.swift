//
//  User.swift
//  IOS Network Call
//
//  Created by Arslan on 27/01/2026.
//

import Foundation

struct User: Codable, Identifiable {
    let id: Int
    let name: String
    let username: String
    let email: String
}

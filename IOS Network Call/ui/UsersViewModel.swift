//
//  UsersViewModel.swift
//  IOS Network Call
//
//  Created by Arslan on 27/01/2026.
//

import Foundation
import SwiftUI
import Observation

@MainActor
@Observable
class UsersViewModel{
    
     var users: [User] = []
     var errorMessage: String?
     var isLoading: Bool = false
    
    private let client = NetworkClient()
    
    func loadUsers() async {
        isLoading = true
        errorMessage = nil
        do{
            self.users = try await client.send(GetUserRequest())
        }catch{
            self.errorMessage = "Failed to load users: \(error.localizedDescription)"
        }
        isLoading = false
    }
}

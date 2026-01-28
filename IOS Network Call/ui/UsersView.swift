//
//  UsersView.swift
//  IOS Network Call
//
//  Created by Arslan on 28/01/2026.
//

import SwiftUI

struct UsersView: View {
    @State private var viewModel = UsersViewModel()
    var body: some View {

        NavigationStack{
            Group{
                if viewModel.isLoading {
                    ProgressView("Loading...")
                } else if let error = viewModel.errorMessage {
                    Text(error).foregroundColor(.red)
                } else {
                    List(viewModel.users) {
                        user in
                        VStack(alignment: .leading) {
                            Text(user.name).bold()
                            Text(user.email).font(Font.subheadline).foregroundColor(.gray)
                            
                        }
                    }
                }
            }
            .navigationTitle("Users")
            .task {
                await viewModel.loadUsers()
            }
        }
    }
}

#Preview {
    UsersView()
}

//
//  RootView.swift
//  TMDBMovieApp
//
//  Created by Sagar Rathode   on 10/07/25.
//

import SwiftUI

struct RootView: View {
    @State private var isLoggedIn = false

    var body: some View {
        NavigationStack {
            if isLoggedIn {
                HomeView()
            } else {
                LoginView(isLoggedIn: $isLoggedIn)
            }
        }
    }
}

#Preview {
    RootView()
}

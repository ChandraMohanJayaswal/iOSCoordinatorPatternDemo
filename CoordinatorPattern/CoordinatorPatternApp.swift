//
//  CoordinatorPatternApp.swift
//  CoordinatorPattern
//
//  Created by Chandra Jayaswal on 25/08/2024.
//

import SwiftUI

@main
struct CoordinatorPatternApp: App {
    @StateObject private var appCoordinator = AppCoordinator()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $appCoordinator.path) {
                EmptyView() // Starting point, will be replaced by the coordinator
                    .navigationDestination(for: LoginViewModel.self) { viewModel in
                        LoginView(viewModel: viewModel)
                    }
                    .navigationDestination(for: HomeViewModel.self) { viewModel in
                        HomeView(viewModel: viewModel)
                    }
                    .navigationDestination(for: HomeDetailViewModel.self) { viewModel in
                        HomeDetailView(viewModel: viewModel)
                    }
            }
            .onAppear {
                appCoordinator.start()
            }
        }
    }
}

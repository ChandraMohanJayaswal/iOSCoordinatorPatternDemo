//
//  AppCoordinator.swift
//  CoordinatorPattern
//
//  Created by Chandra Jayaswal on 25/08/2024.
//

import Foundation
import SwiftUI

import SwiftUI

protocol Coordinator {
    func start()
}

class AppCoordinator: Coordinator, ObservableObject {
    @Published var path = NavigationPath()
    @Published var isLoggedIn = false
    
    // Custom array to track view models
    private var viewModelsStack: [any IdentifiableViewModel] = []
    
    func start() {
        if isLoggedIn {
            showHome()
        } else {
            showLogin()
        }
    }
    
    func showLogin() {
        let loginViewModel = LoginViewModel(coordinator: self)
        
        if let index = viewModelsStack.firstIndex(where: { $0 is LoginViewModel }) { // Pop to the existing HomeViewModel
            viewModelsStack = Array(viewModelsStack.prefix(index + 1))
            // Rebuild the NavigationPath
            var newPath = NavigationPath()
            for viewModel in viewModelsStack {
                newPath.append(viewModel)
            }
            path = newPath
        } else {
            path.append(loginViewModel)
            viewModelsStack.append(loginViewModel)
        }
    }
    
    func showHome() {
        let homeViewModel = HomeViewModel(coordinator: self)
        if let index = viewModelsStack.firstIndex(where: { $0 is HomeViewModel }) { // Pop to the existing HomeViewModel
            viewModelsStack = Array(viewModelsStack.prefix(index + 1))
            // Rebuild the NavigationPath
            var newPath = NavigationPath()
            for viewModel in viewModelsStack {
                newPath.append(viewModel)
            }
            path = newPath
        } else {
            path.append(homeViewModel)
            viewModelsStack.append(homeViewModel)
        }
    }
    
    func showHomeDetail(with itemID: String) {
        let homeDetailViewModel = HomeDetailViewModel(itemID: itemID, coordinator: self)
        
        if let index = viewModelsStack.firstIndex(where: { $0 is HomeDetailViewModel }) { // Pop to the existing HomeViewModel
            viewModelsStack = Array(viewModelsStack.prefix(index + 1))
            // Rebuild the NavigationPath
            var newPath = NavigationPath()
            for viewModel in viewModelsStack {
                newPath.append(viewModel)
            }
            path = newPath
        } else {
            path.append(homeDetailViewModel)
            viewModelsStack.append(homeDetailViewModel)
        }
    }
    
    func didLogin() {
        isLoggedIn = true
        showHome()
    }
    
    func logout() {
        isLoggedIn = false
        showLogin()
    }
}

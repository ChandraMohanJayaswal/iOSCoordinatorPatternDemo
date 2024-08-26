//
//  LoginViewModel.swift
//  CoordinatorPattern
//
//  Created by Chandra Jayaswal on 25/08/2024.
//

import Foundation

class LoginViewModel: ObservableObject, IdentifiableViewModel {
    weak var coordinator: AppCoordinator?
    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
    }
    
    func login() {
        coordinator?.didLogin()
    }
    
    static func == (lhs: LoginViewModel, rhs: LoginViewModel) -> Bool {
        return lhs === rhs
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}

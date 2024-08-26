//
//  HomeViewModel.swift
//  CoordinatorPattern
//
//  Created by Chandra Jayaswal on 25/08/2024.
//

import Foundation

class HomeViewModel: ObservableObject, IdentifiableViewModel {
    weak var coordinator: AppCoordinator?
    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
    }
    
    func showDetail(for itemID: String) {
        coordinator?.showHomeDetail(with: itemID)
    }
    
    func logout() {
        coordinator?.logout()
    }
    
    static func == (lhs: HomeViewModel, rhs: HomeViewModel) -> Bool {
        return lhs === rhs
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}

//
//  HomeDetailViewModel.swift
//  CoordinatorPattern
//
//  Created by Chandra Jayaswal on 25/08/2024.
//

import Foundation

class HomeDetailViewModel: ObservableObject, IdentifiableViewModel {
    var itemID: String
    weak var coordinator: AppCoordinator?
    
    init(itemID: String, coordinator: AppCoordinator) {
        self.itemID = itemID
        self.coordinator = coordinator
    }
    
    func goBack() {
        coordinator?.path.removeLast() // Go back to the previous view (HomeView)
    }
    
    func showHome() {
        coordinator?.showHome()
    }
    
    func logout() {
        coordinator?.logout() // Trigger the logout action in the coordinator
    }
    
    static func == (lhs: HomeDetailViewModel, rhs: HomeDetailViewModel) -> Bool {
        return lhs.itemID == rhs.itemID
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(itemID)
    }
}

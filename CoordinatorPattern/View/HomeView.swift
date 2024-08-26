//
//  HomeView.swift
//  CoordinatorPattern
//
//  Created by Chandra Jayaswal on 25/08/2024.
//

import Foundation
import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack {
            Text("Home Screen")
            
            Button("Go to Detail for Item 1") {
                viewModel.showDetail(for: "1")
            }
            
            Button("Logout") {
                viewModel.logout()
            }
        }
        .navigationTitle("Home")
        .navigationBarHidden(true)
    }
}

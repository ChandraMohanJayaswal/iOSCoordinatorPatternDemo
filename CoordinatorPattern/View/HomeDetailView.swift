//
//  HomeDetailView.swift
//  CoordinatorPattern
//
//  Created by Chandra Jayaswal on 25/08/2024.
//

import Foundation
import SwiftUI

struct HomeDetailView: View {
    @ObservedObject var viewModel: HomeDetailViewModel
    
    var body: some View {
        VStack {
            Text("Detail for item ID: \(viewModel.itemID)")
            
            Button("Logout") {
                viewModel.logout()
            }
            
            Button("Back to Home") {
                viewModel.showHome()
            }
        }
        .navigationTitle("Detail")
        .navigationBarHidden(true)
    }
}

//
//  LoginView.swift
//  CoordinatorPattern
//
//  Created by Chandra Jayaswal on 25/08/2024.
//

import Foundation
import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel: LoginViewModel
    
    var body: some View {
        VStack {
            Text("Login Screen")
            Button("Login") {
                viewModel.login()
            }
        }
        .navigationTitle("Login")
        .navigationBarHidden(true)
    }
}

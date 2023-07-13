//
//  MainView.swift
//  AlamofireNetworkingDemo
//
//  Created by Kārlis Štekels on 13/07/2023.
//

import SwiftUI

struct MainView: View {
    
    @StateObject private var viewModel = UserLoginViewModel()
    
    var body: some View {
        switch viewModel.state {
        case .loading:
            ProgressView()
        case .idle:
            Color.clear
                .task {
                    await viewModel.getBearerToken()
                }
        case .failed(let error):
            Text(error.localizedDescription)
        case .loaded:
            VStack {
                Spacer()
                Text("Token: \(viewModel.token)")
                Spacer()
                Button {
                    //TODO: Implement
                } label: {
                    Text("Get User Data")
                }

                Spacer()
            }.padding(.horizontal, 16)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

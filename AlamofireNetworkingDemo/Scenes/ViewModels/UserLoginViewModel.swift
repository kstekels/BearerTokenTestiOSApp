//
//  UserLoginViewModel.swift
//  AlamofireNetworkingDemo
//
//  Created by Kārlis Štekels on 13/07/2023.
//

import Foundation

class UserLoginViewModel: ObservableObject {
    
    let repository: LoginRepository
    
    @Published var token: String = ""
    @Published private(set) var state: LoadingState = .idle
    
    init(with repository: LoginRepository = LoginRepository(apiClient: LoginService())) {
        self.repository = repository
    }
    
    @MainActor
    func getBearerToken() async {
        state = .loading
        let result = await repository.getBearerToken()
        switch result {
        case .success(let tokenResponse):
            self.token = tokenResponse.token
            state = .loaded
            print(self.token)
        case .failure(let error):
            print(error.localizedDescription)
            state = .failed(error)
        }
    }
}

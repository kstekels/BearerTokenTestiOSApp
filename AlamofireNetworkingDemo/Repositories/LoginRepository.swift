//
//  LoginRepository.swift
//  AlamofireNetworkingDemo
//
//  Created by Kārlis Štekels on 13/07/2023.
//

import Foundation

struct LoginRepository {
    
    var apiClient: LoginServiceable
    
    init(apiClient: LoginServiceable) {
        self.apiClient = apiClient
    }
    
    func getBearerToken() async -> Result<TokenResponse, RequestError> {
        await apiClient.getBearerToken()
    }
}

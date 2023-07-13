//
//  UserDataRepository.swift
//  AlamofireNetworkingDemo
//
//  Created by Kārlis Štekels on 13/07/2023.
//

import Foundation

struct UserDataRepository {
    
    var apiClient: UserDataServiceable
    
    init(apiClient: UserDataServiceable) {
        self.apiClient = apiClient
    }
    
    func getUserData() async -> Result<AuthDataResponse, RequestError> {
        await apiClient.getUserData()
    }
}

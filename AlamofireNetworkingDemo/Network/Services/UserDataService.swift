//
//  CategoryService.swift
//  AlamofireNetworkingDemo
//
//  Created by Kārlis Štekels on 13/07/2023.
//

import Foundation

protocol UserDataServiceable {
    func getUserData() async -> Result<AuthDataResponse, RequestError>
}

struct UserDataService: NetworkManager, UserDataServiceable {
    func getUserData() async -> Result<AuthDataResponse, RequestError> {
        return await request(endpoint: UserEndpoint.profile, response: AuthDataResponse.self)
    }
}

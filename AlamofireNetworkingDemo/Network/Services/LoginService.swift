//
//  loginService.swift
//  AlamofireNetworkingDemo
//
//  Created by Kārlis Štekels on 13/07/2023.
//

import Foundation

protocol LoginServiceable {
    func getBearerToken() async -> Result<TokenResponse, RequestError>
}

struct LoginService: NetworkManager, LoginServiceable {
    func getBearerToken() async -> Result<TokenResponse, RequestError> {
        return await request(endpoint: UserEndpoint.login, response: TokenResponse.self)
    }
}

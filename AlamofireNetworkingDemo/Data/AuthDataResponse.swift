//
//  AuthDataResponse.swift
//  AlamofireNetworkingDemo
//
//  Created by Kārlis Štekels on 13/07/2023.
//

struct AuthDataResponse: Codable {
    let message: String
    let userData: UserData
}

struct UserData: Codable {
    let user: User
    let lat: Int
}

struct User: Codable {
    let id: Int
    let userEmail: String
    let password: String
}

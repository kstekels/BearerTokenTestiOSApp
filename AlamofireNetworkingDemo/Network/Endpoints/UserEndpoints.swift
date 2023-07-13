//
//  Endpoint.swift
//  AlamofireNetworkingDemo
//
//  Created by Kārlis Štekels on 13/07/2023.
//

import Foundation

enum UserEndpoint {
    case login
    case profile
}

extension UserEndpoint: Endpoint {

    var sessionController: SessionController {
        DefaultSessionController.shared
    }
    
    var queryItems: [URLQueryItem]? {
        switch self {
        case .login:
            return nil
        case .profile:
            return nil
        }
    }
    
    var path: String {
        switch self {
        case .login:
            return "/login"
        case .profile:
            return "/profile"
        }
    }
    
    var serviceName: String {
        "api"
    }
    
    var headers: [String : String]? {
        switch self {
        case .login:
            return nil
        case .profile:
            return nil
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .login:
            return .post
        case .profile:
            return .get
        }
    }
    
    var body: Data? {
        switch self {
        case .login:
            return nil
        case .profile:
            return nil
        }
    }
    
    
}

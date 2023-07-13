//
//  Endpoint.swift
//  AlamofireNetworkingDemo
//
//  Created by Kārlis Štekels on 13/07/2023.
//

import Foundation

protocol Endpoint: Requestable, CustomStringConvertible {}

extension Endpoint {
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var body: Data? {
        return nil
    }
    
    var queryItems: [URLQueryItem]? {
        nil
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    var description: String {
        return """
        httpMethod: \(httpMethod)
        headers: \(String(describing: headers))
        """
    }
    
}

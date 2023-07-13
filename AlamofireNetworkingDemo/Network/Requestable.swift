//
//  Requestable.swift
//  AlamofireNetworkingDemo
//
//  Created by Kārlis Štekels on 13/07/2023.
//

import Foundation

protocol Requestable {
    
    var sessionController: SessionController { get }
    var path: String { get }
    var queryItems: [URLQueryItem]? { get }
    var serviceName: String { get }
    var httpMethod: HTTPMethod { get }
    var body: Data? { get }
    var headers: [String: String]? { get }
}

extension Requestable {
    
    func url() throws -> URL {
        guard var urlComponents = URLComponents(string: sessionController.serviceURL(for: serviceName)) else {
            throw RequestError.invalidURL
        }
        
        urlComponents.queryItems = queryItems
        urlComponents.path = urlComponents.path.appending(path)
        
        guard let url = urlComponents.url else {
            throw RequestError.invalidURL
        }
        return url
    }
    
    func urlRequest() throws -> URLRequest {
        do {
            let url = try self.url()
            let timeout = sessionController.session.sessionConfiguration.timeoutIntervalForRequest
            
            var urlRequest = URLRequest(url: url, timeoutInterval: timeout)
            urlRequest.httpMethod = httpMethod.rawValue
            urlRequest.allHTTPHeaderFields = headers
            
            if let body = body {
                urlRequest.httpBody = body
            }
            return urlRequest
        } catch {
            throw RequestError.invalidURL
        }
    }
    
}

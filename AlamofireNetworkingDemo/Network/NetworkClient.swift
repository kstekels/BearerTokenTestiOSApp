//
//  NetworkClient.swift
//  AlamofireNetworkingDemo
//
//  Created by Kārlis Štekels on 13/07/2023.
//

import Foundation
import Alamofire

enum DateError: String, Error {
    case invalidDate
}

protocol NetworkManager: RequestInterceptor {
    func request<T: Decodable>(endpoint: Requestable, response: T.Type) async -> Result<T, RequestError>
}

extension NetworkManager {
    func request<T: Decodable>(endpoint: Requestable, response: T.Type) async -> Result<T, RequestError> {
        do {
            
            let jsonDecoder = JSONDecoder()
            let dateFormatter = DateFormatter()
            
            jsonDecoder.dateDecodingStrategy = .custom { decoder -> Date in
                let container = try decoder.singleValueContainer()
                let dataStr = try container.decode(String.self)
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSSSSZ"
                if let date = dateFormatter.date(from: dataStr) {
                    return date
                }
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
                if let date = dateFormatter.date(from: dataStr) {
                    return date
                }
                throw DateError.invalidDate
            }
            
            let urlRequest = try endpoint.urlRequest()
            let dataTask = AF.request(urlRequest).serializingDecodable(T.self, decoder: jsonDecoder)
            
            let response = await dataTask.result
            let data = await dataTask.response.data
            
            // Uncomment to see data
            /*
             let dataString = String(decoding: data!, as: UTF8.self)
             print(dataString)
             */
            
            switch response {
            case .success(let value):
                return .success(value)
                
            case .failure(_):
                
                guard let data = data else {
                    return .failure(.unknownError)
                }
                
                do {
                    let json = try jsonDecoder.decode(BackendError.self, from: data)
                    return .failure(.backendError(description: json.message))
                } catch _ as RequestError {
                    return .failure(.faildToPraseJSON)
                }
                
            }
        } catch {
            return .failure(.unknownError)
        }
    }
}

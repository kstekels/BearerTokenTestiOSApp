//
//  LoadingState.swift
//  AlamofireNetworkingDemo
//
//  Created by Kārlis Štekels on 13/07/2023.
//

import Foundation

enum LoadingState {
    case idle
    case loading
    case failed(Error)
    case loaded
}

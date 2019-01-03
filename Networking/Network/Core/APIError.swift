//
//  APIError.swift
//  Networking
//
//  Created by Lakshmi Narayanan N on 20/12/18.
//  Copyright © 2018 Lakshmi Narayanan N. All rights reserved.
//

import Foundation

enum APIError: Error {
    case unknown
    case badURL
    case unauthorized
    case forbidden
    case notFound
    case internalError
    case timeout
    case noInternetConnection
    
    var localizedDescription: String {
        switch self {
        case .unknown:              return "Unknown Error"
        case .badURL:               return "Invalid URL"
        case .unauthorized:         return "Unauthorized access"
        case .forbidden:            return "Forbidden URL"
        case .notFound:             return "Server not found"
        case .internalError:        return "Internal error"
        case .timeout:              return "Request timed out"
        case .noInternetConnection: return "No internet connection"
        }
    }
}

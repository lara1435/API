//
//  EndPoint.swift
//  Networking
//
//  Created by Lakshmi Narayanan N on 20/12/18.
//  Copyright © 2018 Lakshmi Narayanan N. All rights reserved.
//

import Foundation

typealias HTTPHeaders = [String: String]
typealias HTTPBody = [String: Any]

protocol Endpoint {
    var method: HTTPMethod { get }
    var baseURLString: String { get }
    var path: String? { get }
    var query: String? { get }
    var HTTPHeaderFields: HTTPHeaders { get }
    var payload: HTTPBody? { get }
    var task: HTTPTask { get }
    
    func request() throws -> URLRequest
}

extension Endpoint {
    var apiKey: String {
        return "api_key=34a92f7d77a168fdcd9a46ee1863edf1"
    }
    
    var baseURLString: String {
        return "https://demo3564417.mockable.io"
    }
    
    var urlComponents: URLComponents {
        var components = URLComponents(string: baseURLString)!
        if let path = path {
            components.path = path
        }
        
        if let query = query {
            components.query = query
        }
        
        return components
    }
    
    var url: URL? {
        return urlComponents.url
    }
    
    func request() throws -> URLRequest {
        guard let url = urlComponents.url else {
            throw APIError.badURL
        }

        var mutableURLRequest = URLRequest(url: url)
        mutableURLRequest.httpMethod = method.rawValue
        
        if let payload = payload {
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: payload, options: .prettyPrinted)
                mutableURLRequest.httpBody = jsonData
            } catch {
                print(error.localizedDescription)
            }
        }
        
        for field in HTTPHeaderFields {
            mutableURLRequest.setValue(field.value, forHTTPHeaderField: field.key)
        }
        
        return mutableURLRequest
    }
    
    var HTTPHeaderFields: HTTPHeaders {
        var fields: [String : String] = [:]
        fields["Content-Type"] = "application/json"
        return fields
    }
}

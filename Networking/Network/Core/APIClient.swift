//
//  APIClient.swift
//  Networking
//
//  Created by Lakshmi Narayanan N on 20/12/18.
//  Copyright © 2018 Lakshmi Narayanan N. All rights reserved.
//

import Foundation

public typealias APIClientCompletion = (_ data: Data?,_ response: URLResponse?,_ error: Error?) -> ()

protocol APIClient {
    var session: URLSession { get }
    func send(_ endpoint: Endpoint, onComplition: @escaping (APIClientCompletion))
    func cancel(_ endpoint: Endpoint) -> Void
    
    func fethData(endpoint: Endpoint, onComplition: @escaping APIClientCompletion)
    func downLoadData(endpoint: Endpoint, onComplition: @escaping APIClientCompletion)
    func uploadData(endpoint: Endpoint, onComplition: @escaping APIClientCompletion)
}

protocol requestable {
    func fethData(endpoint: Endpoint, onComplition: @escaping APIClientCompletion)
    func downLoadData(endpoint: Endpoint, onComplition: @escaping APIClientCompletion)
    func uploadData(endpoint: Endpoint, onComplition: @escaping APIClientCompletion)
}

extension APIClient {
    var session: URLSession {
        let session = URLSession.shared
        return session
    }
    
    func send(_ endpoint: Endpoint, onComplition: @escaping (APIClientCompletion)) {
        switch endpoint.task {
        case .data:
            fethData(endpoint: endpoint) { (data, response, error) in
                onComplition(data, response, error)
            }
        case .download:
            downLoadData(endpoint: endpoint) { (data, response, error) in
                onComplition(data, response, error)
            }
        case .upload:
            uploadData(endpoint: endpoint) { (data, response, error) in
                onComplition(data, response, error)
            }
            
        }
    }
    
    func cancel(_ endpoint: Endpoint) {
    }
    
    func fethData(endpoint: Endpoint, onComplition: @escaping APIClientCompletion) {
        guard let request = try? endpoint.request() else {
            onComplition(nil, nil, APIError.badURL)
            return
        }
        
        session.dataTask(with: request, completionHandler: { (data, response, error) in
            onComplition(data, response, error)
        }).resume()
    }
    
    func downLoadData(endpoint: Endpoint, onComplition: @escaping APIClientCompletion) {
    }
    
    func uploadData(endpoint: Endpoint, onComplition: @escaping APIClientCompletion) {
    }
}

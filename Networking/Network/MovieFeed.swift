//
//  MovieFeed.swift
//  Networking
//
//  Created by Lakshmi Narayanan N on 20/12/18.
//  Copyright © 2018 Lakshmi Narayanan N. All rights reserved.
//

import Foundation

enum MovieFeed {
    case movies
    case topRated
}

extension MovieFeed: Endpoint {
    var query: String? {
        switch self {
        case .movies: return nil
        case .topRated: return nil
        }
    }
    
    var payload: HTTPBody? {
        switch self {
        case .movies: return nil
        case .topRated: return nil
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .movies: return .data
        case .topRated: return .data
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .movies: return .get
        case .topRated: return .get
        }
    }
    
    var HTTPHeaderFields: HTTPHeaders {
        switch self {
        case .movies: return [:]
        case .topRated: return [:]
        }
        
    }
    
    var path: String? {
        switch self {
        case .movies: return "/movies"
        case .topRated: return "/3/movie/top_rated"
        }
    }
}

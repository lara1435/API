//
//  ParseError.swift
//  Networking
//
//  Created by Lakshmi Narayanan N on 21/12/18.
//  Copyright © 2018 Lakshmi Narayanan N. All rights reserved.
//


import Foundation

enum ParseError: Error {
    case jsonConversionFailure
    case invalidData
    case jsonParsingFailure
    
    var localizedDescription: String {
        switch self {
        case .jsonConversionFailure:    return "JSON Conversion Failure"
        case .invalidData:              return "Invalid Data"
        case .jsonParsingFailure:       return "JSON Parsing Failure"
        }
    }
}

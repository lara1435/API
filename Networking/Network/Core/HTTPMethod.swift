//
//  HTTPMethod.swift
//  ProtocolBasedNetworkingTutorialFinal
//
//  Created by Lakshmi Narayanan N on 21/12/18.
//  Copyright © 2018 James Rochabrun. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
    case get        = "GET"
    case post       = "POST"
    case put        = "PUT"
    case patch      = "PATCH"
    case delete     = "DELETE"
    case copy       = "COPY"
    case head       = "HEAD"
    case options    = "OPTIONS"
    case link       = "LINK"
    case unlink     = "UNLINK"
    case purge      = "PURGE"
    case lock       = "LOCK"
    case unlock     = "UNLOCK"
    case propfind   = "PROFIND"
    case view       = "VIEW"
}

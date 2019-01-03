//
//  GenericParseClient.swift
//  Networking
//
//  Created by Lakshmi Narayanan N on 31/12/18.
//  Copyright © 2018 Lakshmi Narayanan N. All rights reserved.
//

import Foundation

class GenericParseClient : ParseClient {
    func parse<C>(data: Data, to objectType: C.Type) -> C? where C : Decodable, C : Encodable {
        let response = try? JSONDecoder().decode(C.self, from: data)
        return response
    }
}


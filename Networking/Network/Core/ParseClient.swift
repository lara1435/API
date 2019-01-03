//
//  ParseClient.swift
//  Networking
//
//  Created by Lakshmi Narayanan N on 31/12/18.
//  Copyright © 2018 Lakshmi Narayanan N. All rights reserved.
//

import Foundation

protocol ParseClient {
    func parse<C: Codable>(data: Data, to objectType: C.Type) -> C?
}

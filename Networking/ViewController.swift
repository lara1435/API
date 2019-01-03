//
//  ViewController.swift
//  Networking
//
//  Created by Lakshmi Narayanan N on 20/12/18.
//  Copyright © 2018 Lakshmi Narayanan N. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear")
        
        let movies = MovieFeed.movies
        let apiClient = GenericAPIClient()
        apiClient.send(movies) { (data, response, error) in
            print(data ?? "No data")
            print(response ?? "No response")
            print(error ?? "No error")
            let parseClient = GenericParseClient()
            let movie = parseClient.parse(data: data!, to: Movie.self)
            print(movie ?? "no movies")
        }
    }
}


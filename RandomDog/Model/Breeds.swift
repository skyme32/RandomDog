//
//  Breeds.swift
//  RandomDog
//
//  Created by Marcos Mejias on 29/1/22.
//

import Foundation

struct Breeds: Codable {
    let status: String
    let message: String
}

enum CodingKeys: String, CodingKey {
    case name = "food_name"
    case taste = "taste"
    case calories = "number of calories"
}



//
//  DogAPI.swift
//  RandomDog
//
//  Created by Marcos Mejias on 29/1/22.
//

import Foundation
import UIKit

class DogAPI {
    
    enum Endpoint {
        case randomImageFromAllDogsCollection
        case randomImageForBreed(String)
        case allDogsCollection
        
        var url: URL {
            return URL(string: self.stringValue)!
        }
        
        var stringValue: String {
            switch self {
                case .randomImageFromAllDogsCollection:
                    return "https://dog.ceo/api/breeds/image/random"
                case .randomImageForBreed(let breed):
                    return "https://dog.ceo/api/breed/\(breed)/images/random"
                case .allDogsCollection:
                    return "https://dog.ceo/api/breeds/list/all"
            }
        }
    }

}

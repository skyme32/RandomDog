//
//  DogAPI.swift
//  RandomDog
//
//  Created by Marcos Mejias on 29/1/22.
//

import Foundation

class DogAPI {
    
    enum EndPoint: String {
        case randomImageFRomAllDogsCollection = "https://dog.ceo/api/breeds/image/random"
        
        var url: URL {
            return URL(string: self.rawValue)!
        }
    }
    
    
}

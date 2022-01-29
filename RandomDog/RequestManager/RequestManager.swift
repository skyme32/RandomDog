//
//  RequestManager.swift
//  RandomDog
//
//  Created by Marcos Mejias on 29/1/22.
//

import Foundation
import UIKit


class RequesManager {

    class func requestAllDogsCollection(completionHandler: @escaping ([String], Error?) -> Void) {
        let task = URLSession.shared.dataTask(with: DogAPI.Endpoint.allDogsCollection.url) {
            data, responses, error in
            guard let data = data else {
                completionHandler([], error)
                return
            }
            
            let decoder = JSONDecoder()
            let breedsResponse = try! decoder.decode(Breeds.self, from: data)
            let listOfBreeds = breedsResponse.message.keys.map({$0})
            completionHandler(listOfBreeds, nil)
        }
        task.resume()
    }

    class func requestRandomImage(breed: String, completionHandler: @escaping (DogImage?, Error?) -> Void) {
        let task = URLSession.shared.dataTask(with: DogAPI.Endpoint.randomImageForBreed(breed).url) {
            data, response, error in
            guard let data = data else {
                completionHandler(nil, error)
                return
            }
            
            let decoder = JSONDecoder()
            let imageData = try! decoder.decode(DogImage.self, from: data)
            completionHandler(imageData, nil)
        }
        task.resume()
    }

    class func requestImageFile(url: URL, completionHandler: @escaping (UIImage?, Error?) -> Void) {
        let task = URLSession.shared.dataTask(with: url, completionHandler: {
            data, response, error in
            guard let data = data else {
                completionHandler(nil, error)
                return
            }
            
            let downloadedImage = UIImage(data: data)
            completionHandler(downloadedImage, nil)
        })
        task.resume()
    }
    
}

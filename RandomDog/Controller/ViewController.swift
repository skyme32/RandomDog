//
//  ViewController.swift
//  RandomDog
//
//  Created by Marcos Mejias on 28/1/22.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var imageViewDog: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DogAPI.requestRandomImage(completionHandler: handleRandomImageResponse(imageData:error:))
    }
    
    func handleRandomImageResponse(imageData: DogImage?, error: Error?) {
        guard let imageURL = URL(string: imageData!.message) else {
            return
        }
        DogAPI.requestImageFile(url: imageURL, completionHandler: handleImageFileRespon(image:error:))
    }
    
    func handleImageFileRespon(image: UIImage?, error: Error?) {
        DispatchQueue.main.async {
            self.imageViewDog.image = image
        }
    }


}


//
//  ViewController.swift
//  RandomDog
//
//  Created by Marcos Mejias on 28/1/22.
//

import UIKit

let API_IMAGE: String = "message"

class ViewController: UIViewController {
    
    @IBOutlet weak var imageViewDog: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let randomImageEndpoint = DogAPI.EndPoint.randomImageFRomAllDogsCollection.url
        
        let task = URLSession.shared.dataTask(with: randomImageEndpoint) { (data, response, error) in
            guard let data = data else { return }
            guard let imageUrl = URL(string: self.parseJson(data: data)) else { return }
            
            let task = URLSession.shared.dataTask(with: imageUrl, completionHandler: { (data, response, error) in
                guard let data = data else { return }
                self.donwloadImage(data: data)
            })
            task.resume()
        }
        task.resume()
    }
    
    private func parseJson(data: Data?) -> String  {
        let decoder = JSONDecoder()
        let imageData = try! decoder.decode(DogImage.self, from: data!)
        return imageData.message
    }
    
    private func donwloadImage(data: Data?)  {
        let downloadedImage = UIImage(data: data!)
        DispatchQueue.main.async {
            self.imageViewDog.image = downloadedImage
        }
    }


}


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
        // Do any additional setup after loading the view.
        
        let randomImageEndpoint = DogAPI.EndPoint.randomImageFRomAllDogsCollection.url
        
        let task = URLSession.shared.dataTask(with: randomImageEndpoint) { (data, response, error) in
            guard let data = data else { return }
            print(data)
        }
        task.resume()
        
        print(DogAPI.EndPoint.randomImageFRomAllDogsCollection.url)
    }


}


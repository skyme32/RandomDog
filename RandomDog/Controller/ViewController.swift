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
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                let url = json[API_IMAGE] as! String
                print(url)
            } catch {
                print(error)
            }
        }
        task.resume()
    }


}


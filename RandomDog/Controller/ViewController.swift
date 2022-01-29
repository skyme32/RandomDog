//
//  ViewController.swift
//  RandomDog
//
//  Created by Marcos Mejias on 28/1/22.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var imageViewDog: UIImageView!
    @IBOutlet weak var pickerViewBreed: UIPickerView!
    
    let breads = ["groenendael", "cattledog"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerViewBreed.dataSource = self
        pickerViewBreed.delegate = self
        

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

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return breads.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return breads[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        DogAPI.requestRandomImage(breed: breads[row], completionHandler: handleRandomImageResponse(imageData:error:))
    }
    
    
}

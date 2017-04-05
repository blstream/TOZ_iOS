//
//  GalleryViewController.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit
import Foundation

class GalleryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var galleryTableView: UITableView!

    var animalsArray = [GalleryEntity]()

    @IBOutlet weak var imageView: UIImageView!
    //@IBOutlet weak var indicator: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
//        getListOfAnimals()
        let firstAnimal = GalleryEntity(name: "Piorun", age: "3 lata", description: "Dog ipsum dolor sit amet, consectetur adipiscing elit. Proin nibh augue, suscipit a, scelerisque sed, lacinia in, mi. Cras vel lorem. Etiam pellentesque aliquet tellus. Phasellus pharetra nulla ac diam. Quisque semper justo at risus.", image: UIImage(named: "dog1"))
        let secondAnimal = GalleryEntity(name: "Asti", age: "5 lat", description: "Dog ipsum dolor sit amet, consectetur adipiscing elit. Proin nibh augue, suscipit a, scelerisque sed, lacinia in, mi. Cras vel lorem. Etiam pellentesque aliquet tellus.", image: UIImage(named: "dog2"))
        let thirdAnimal = GalleryEntity(name: "Lola", age: "4 lata", description: "Dog ipsum dolor sit amet, consectetur adipiscing elit. Proin nibh augue, suscipit a, scelerisque sed, lacinia in, mi. Cras vel lorem. Etiam pellentesque aliquet tellus. Phasellus pharetra nulla ac diam. Quisque semper justo at risus. Donec venenatis, turpis vel hendrerit interdum, dui ligula ultricies.", image: UIImage(named: "dog3"))
        animalsArray = [firstAnimal, secondAnimal, thirdAnimal]
    }
    // UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animalsArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "galleryTableViewCell", for: indexPath)
        if let cell = cell as? GalleryTableViewCell {
            let animalInfo = animalsArray[indexPath.row]
            cell.animalDescription.text = animalInfo.description
            cell.animalName.text = animalInfo.name
            cell.animalAge.text = animalInfo.age
            cell.animalImage.image = animalInfo.image
        }
        return cell
    }
    // UITableViewDelegate
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showGalleryDetail", sender: self)
    }

    let listOfAnimalsOperation = ListOfAnimalsOperation()

//    func getListOfAnimals() {
//        listOfAnimalsOperation.resultCompletion = { result in
//            switch result {
//            case .success(let listOfAnimals): break
//            case .failure(let error): break
//            }
//            DispatchQueue.main.async {
//                // Do something
//            }
//        }
//        listOfAnimalsOperation.start()
//    }
}

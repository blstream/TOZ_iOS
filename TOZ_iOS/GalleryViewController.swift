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
    var animalsArray = [AnimalItem]()
    var selectedGalleryCellID: String?
    @IBOutlet weak var imageView: UIImageView!
    //@IBOutlet weak var indicator: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        getListOfAnimals()
        //     let firstAnimal = GalleryEntity(name: "Piorun", type: "Golden Retriever", image: UIImage(named: "dog1"), animalID: "45eb78b5-6a4d-41cc-9bf9-52b09fe20c95")
        //        let secondAnimal = GalleryEntity(name: "Asti", type: "Beagle", image: UIImage(named: "dog2"), animalID: "a3e652a5-91cd-45a7-9327-6608f675f05b")
        //        let thirdAnimal = GalleryEntity(name: "Lola", type: "Owczarek", image: UIImage(named: "dog3"), animalID: "45eb78b5-6a4d-41cc-9bf9-52b09fe20c95")
        //        animalsArray = [firstAnimal, secondAnimal, thirdAnimal]
    }
    // UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animalsArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "galleryTableViewCell", for: indexPath)
        if let cell = cell as? GalleryTableViewCell {
           cell.configure(for: animalsArray[indexPath.row])
        }
        return cell
    }
    // UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell = animalsArray[indexPath.row]
        selectedGalleryCellID = selectedCell.animalID
        performSegue(withIdentifier: "showGalleryDetail", sender: selectedGalleryCellID)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showGalleryDetail" {
            let galleryDetailViewController = segue.destination as? GalleryDetailViewController
            galleryDetailViewController?.selectedCellID = selectedGalleryCellID
        }
    }
    let listOfAnimalsOperation = ListOfAnimalsOperation()
    func getListOfAnimals() {
        listOfAnimalsOperation.resultCompletion = { result in
            switch result {
            case .success(let listOfAnimals):
                DispatchQueue.main.async {
                    self.animalsArray = listOfAnimals
                    self.galleryTableView.reloadData()
                }
            case .failure(let error):
                print ("\(error)")
            }
        }
            listOfAnimalsOperation.start()
        }
    }


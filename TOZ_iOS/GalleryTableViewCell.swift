//
//  GalleryTableViewCell.swift
//  TOZ_iOS
//
//  Created by Kobsonauta on 27.03.2017.
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

class GalleryTableViewCell: UITableViewCell {
    @IBOutlet weak var animalImage: UIImageView!
    @IBOutlet weak var animalName: UILabel!
    @IBOutlet weak var animalType: UILabel!

    private var animalID: String?

    func configure(for animal: AnimalItem) {
        animalID = animal.animalID
        self.animalName.text = animal.name
        self.animalType.text = animal.type
        let imageUrl: URL? = animal.imageUrl
        animalImage.image = nil
        if let imageUrl = imageUrl {
            PhotoManager.shared.getPhoto(from: imageUrl, completion: {(image) -> (Void) in
                if self.animalID == animal.animalID {
                    self.animalImage.image = image
                }
            })
        }
    }
}

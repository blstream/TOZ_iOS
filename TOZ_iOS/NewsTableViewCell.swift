//
//  NewsTableViewCell.swift
//  TOZ_iOS
//
//  Created by RKB on 05/03/2017.
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var dataPublish: UILabel!
    @IBOutlet weak var picture: UIView!
    @IBOutlet weak var messageShort: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

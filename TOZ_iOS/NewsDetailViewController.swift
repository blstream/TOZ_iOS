//
//  NewsDetailViewController.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

class NewsDetailViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var photoImageViewHeight: NSLayoutConstraint!
    @IBOutlet weak var contentLabel: UILabel!
    var selectedNews: NewsItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

    private func configureView() {
        scrollView.backgroundColor = Color.NewsDetailView.Background.secondary
        self.view.backgroundColor = Color.NewsDetailView.Background.primary
        titleLabel.textColor = Color.NewsDetailView.Font.title
        dateLabel.textColor = Color.NewsDetailView.Font.date
        contentLabel.textColor = Color.NewsDetailView.Font.content
        titleLabel.text = selectedNews?.title.uppercased()
        dateLabel.text = selectedNews?.published?.dateToFormattedString()
        photoImageView.image = #imageLiteral(resourceName: "placeholder")
        let photoURL: URL? = selectedNews?.photoUrl
        if let photoURL = photoURL {
            PhotoManager.shared.getPhoto(from: photoURL, completion: {(image) -> (Void) in
                if let image = image {
                    self.photoImageView.image = image
                }
            })
        } else {
            self.photoImageViewHeight.constant = 0
        }

        let atributedContentString = NSMutableAttributedString(string: selectedNews?.contents ?? "")
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 8
        atributedContentString.addAttribute(NSParagraphStyleAttributeName, value: style, range: NSRange(location: 0, length: atributedContentString.length))

        contentLabel.attributedText = atributedContentString
    }

}

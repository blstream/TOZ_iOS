//
//  HelpFinanceViewController.swift
//  TOZ_iOS
//
//  Created by Kobsonauta on 28.03.2017.
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

class HelpFinanceViewController: UIViewController {

    @IBAction func HelpBackButton(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "financeView", sender: self)
    }
}

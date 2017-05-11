//
//  ResetPasswordViewController.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

class ChangePasswordViewController: UIViewController {
    @IBOutlet weak var oldPassword: TextInputView!
    @IBOutlet weak var newPassword: TextInputView!
    @IBOutlet weak var confirmNewPassword: TextInputView!
    @IBOutlet weak var changePasswordButton: UIButton!
    @IBOutlet weak var signOutButton: UIButton!

    weak var delegate: TabBarDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        oldPassword.textChecker = PasswordChecker()
        oldPassword.isTextSecure = true
        newPassword.textChecker = PasswordChecker()
        newPassword.isTextSecure = true

        let confirmationTextChecker = PasswordChecker()
        confirmationTextChecker.confirmView = self.newPassword

        confirmNewPassword.textChecker = confirmationTextChecker
        confirmNewPassword.isTextSecure = true

        self.view.backgroundColor = Color.LoginViewController.background

        changePasswordButton.backgroundColor = Color.LoginViewController.Button.background
        changePasswordButton.tintColor = Color.LoginViewController.Button.tint
        changePasswordButton.layer.cornerRadius = 5

        signOutButton.backgroundColor = Color.LoginViewController.Button.background
        signOutButton.tintColor = Color.LoginViewController.Button.tint
        signOutButton.layer.cornerRadius = 5

        oldPassword.placeholder = "Stare hasło"
        newPassword.placeholder = "Nowe hasło"
        confirmNewPassword.placeholder = "Powtórz nowe hasło"

        oldPassword.icon = UIImage(named: "passwordIcon.png")
        newPassword.icon = UIImage(named: "passwordIcon.png")
        confirmNewPassword.icon = UIImage(named: "passwordIcon.png")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.view.reloadInputViews()
    }

    @IBAction func confirmButtonAction(_ sender: Any) {

//    private func isPasswordValid() -> Bool {
//        //to be continued when possible
//        //send request to BE for confirmation
//        return false
    }

    @IBAction func signOut(_ sender: Any) {
        BackendAuth.shared.deleteToken()
        delegate?.switchAccountTab()
    }
}

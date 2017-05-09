//
//  BackendAuth.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

final class BackendAuth {

   private let key = "BackendAuthToken"
   private let defaults: UserDefaults

    static let shared: BackendAuth = BackendAuth(defaults: UserDefaults.standard)

    init(defaults: UserDefaults) {
        self.defaults = defaults
    }

    var token: String? {
        return defaults.value(forKey: key) as? String
    }

    func setToken(_ token: String) {
        defaults.setValue(token, forKey: key)
    }

    func deleteToken() {
        if self.token != nil {
            defaults.removeObject(forKey: key)
            print("Token was revoked")
        }
    }
}

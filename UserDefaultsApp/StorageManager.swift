//
//  StorageManager.swift
//  UserDefaultsApp
//
//  Created by Александр Манжосов on 10.10.2024.
//

import Foundation

class StorageManager {
    
    static let shared = StorageManager()
    
    private var user = User()
    private let defaults = UserDefaults.standard
    
    func getUser() -> User {
        guard let savedUser = defaults.object(forKey: "savedUser") as? Data else { return user }
        guard let loadedUser = try? JSONDecoder().decode(User.self, from: savedUser) else { return user }
        user = loadedUser
        return user
    }
    func saveUser(_ user: User) {
        guard let userEncoded = try? JSONEncoder().encode(user) else { return }
        defaults.set(userEncoded, forKey: "savedUser")
    }
}

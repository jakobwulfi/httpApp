//
//  StateController.swift
//  httpApp
//
//  Created by dmu mac 31 on 18/09/2024.
//

import SwiftUI

@Observable
class StateController {
    var users: [User] = []
    
    init() {
        guard let randomUserURL = URL(string: "https://randomuser.me/api/?nat=DK&results=100") else {return}
        fetchUsers(from: randomUserURL)
    }
    
    private func fetchUsers(from url: URL) {
        Task(priority: .low) {
            guard let rawUserData = await NetworkService.getData(from: url) else {return}
            print(rawUserData)
            let decoder = JSONDecoder()
            do {
                let jsonResult = try decoder.decode(RandomUserResult.self, from: rawUserData)
                Task {@MainActor in
                    self.users = jsonResult.results
                }
            } catch {
                fatalError("Konverteringen gik ad H til")
            }
        }
    }
}

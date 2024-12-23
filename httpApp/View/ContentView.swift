//
//  ContentView.swift
//  httpApp
//
//  Created by dmu mac 31 on 18/09/2024.
//

import SwiftUI

struct ContentView: View {
    @Environment(StateController.self) var stateController: StateController
    var body: some View {
        List(stateController.users, id: \.self.fullName) { user in
            HStack {
                AsyncImage(url: user.picture.thumbnail) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(height: 40.0)
                        .cornerRadius(40)
                } placeholder: {
                    ProgressView()
                }
                Text(user.fullName)
            }
        }
    }
}

#Preview {
    ContentView().environment(StateController())
}

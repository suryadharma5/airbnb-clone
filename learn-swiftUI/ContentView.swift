//
//  ContentView.swift
//  learn-swiftUI
//
//  Created by ITBCA on 15/07/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Bikini Bottom")
                .font(.largeTitle)
                .foregroundColor(.purple)
            HStack {
                Text("is a place to hide")
                    .font(.subheadline)
                Spacer()
                Text("at California")
                    .font(.subheadline)
            }
        }
        .padding(20)
    }
}

#Preview {
    ContentView()
}

//
//  WishlistView.swift
//  learn-swiftUI
//
//  Created by ITBCA on 18/07/24.
//

import SwiftUI

struct WishlistView: View {
    var body: some View {
        NavigationStack {
            VStack (alignment: .leading, spacing: 32) {
                VStack (alignment: .leading, spacing: 4) {
                    Text("Login to view your wishlists")
                        .font(.headline)
                    
                    Text("You can create, view or edit wishlists once you logged in")
                        .font(.footnote)
                }
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Log in")
                        .foregroundStyle(.white)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 360, height: 48)
                        .background(.pink)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                })
                
                Spacer()
            }
            .padding()
            .navigationTitle("Wishlists")
        }
    }
}

#Preview {
    WishlistView()
}

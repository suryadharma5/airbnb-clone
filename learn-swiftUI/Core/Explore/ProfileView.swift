//
//  ProfileView.swift
//  learn-swiftUI
//
//  Created by ITBCA on 17/07/24.
//

import SwiftUI

struct ProfileOptionRowViewItem: Hashable {
    let imageName: String
    let title: String
}

struct ProfileView: View {
    let items: [ProfileOptionRowViewItem] = [
        ProfileOptionRowViewItem(imageName: "gear", title: "Settings"),
        ProfileOptionRowViewItem(imageName: "accessibility", title: "Accessibility"),
        ProfileOptionRowViewItem(imageName: "questionmark.circle", title: "Visit the Help Center")
    ]
    
    var body: some View {
        VStack {
            // Profile login view
            VStack(alignment: .leading, spacing: 32) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Profile")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    
                    Text("Log in to start planning your next trip")
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
                
                HStack {
                    Text("Don't have an account?")
                    
                    Text("Sign up")
                        .fontWeight(.semibold)
                        .underline()
                }
                .font(.caption)
            }
            
            // options view
            VStack (spacing: 24) {
                ForEach(items, id: \.self) {item in
                    ProfileOptionRowView(imageName: item.imageName, title: item.title)
                }
            }
            .padding(.vertical)
        }
        .padding()
    }
}

#Preview {
    ProfileView()
}

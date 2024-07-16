//
//  ListingView.swift
//  learn-swiftUI
//
//  Created by ITBCA on 16/07/24.
//

import SwiftUI

struct ListingItemView: View {
    var body: some View {
        VStack(spacing: 8) {
            // images
            ListingImageCarouselView()
                .frame(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            // listing details
            HStack(alignment: .top) {
                // details
                VStack(alignment: .leading) {
                    Text("Miami, Florida")
                        .fontWeight(.bold)
                        .foregroundStyle(.black)
                    
                    Text("12 mil away")
                        .foregroundStyle(.gray)
                    
                    Text("Nov 3 - 10")
                        .foregroundStyle(.gray)
                    
                    HStack(spacing: 4) {
                        Text("$567")
                            .fontWeight(.bold)
                        Text("night")
                    }
                    .foregroundStyle(.black)
                }
                
                Spacer()
                
                HStack(spacing: 2) {
                    Image(systemName: "star.fill")
                    Text("4.86")
                }
                .foregroundStyle(.black)
                
            }
            .font(.footnote)
            .padding(.horizontal, 6)
            
        }
        .padding()
    }
}

#Preview {
    ListingItemView()
}

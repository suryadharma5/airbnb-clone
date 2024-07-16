//
//  ExploreView.swift
//  learn-swiftUI
//
//  Created by ITBCA on 16/07/24.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        NavigationStack {
            SearchAndFliterBar()
            ScrollView {
                LazyVStack(spacing: 32) {
                    ForEach(0 ... 10, id: \.self) { listing in
                        NavigationLink(value: listing) {
                            ListingItemView()
                                .frame(height: 400)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                }
            }
            .navigationDestination(for: Int.self) { listing in
                ListingDetailView()
                    .navigationBarBackButtonHidden()
            }
        }
    }
}

#Preview {
    ExploreView()
}

//
//  DestinationSearchView.swift
//  learn-swiftUI
//
//  Created by ITBCA on 16/07/24.
//

import SwiftUI

enum DestinationSearchOptions {
    case location
    case dates
    case guests
}

struct DestinationSearchView: View {
    // untuk menghubungkan state yang ada di parent view (Explore View)
    @Binding var show: Bool
    @State private var destination = ""
    @State private var selectedOption: DestinationSearchOptions = .location
    @State private var startDate: Date = Date()
    @State private var endDate: Date = Date()
    @State private var totalGuest: Int = 0
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    withAnimation(.snappy) {
                        show.toggle()
                    }
                }, label: {
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundStyle(.black)
                })
                
                Spacer()
                
                if destination.count > 0 {
                    Button("Clear") {
                        destination = ""
                    }
                    .foregroundStyle(.black)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                }
            }
            .padding()
            
            VStack(alignment: .leading){
                if(selectedOption == .location) {
                    Text("Where to?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .imageScale(.small)
                                                
                        TextField("Search Destination", text: $destination)
                            .font(.subheadline)
                    }
                    .frame(height: 44)
                    .padding(.horizontal)
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: 1)
                            .foregroundStyle(Color(.systemGray4))
                    }
                } else {
                    CollapsedPickerView(title: "Where", description: "Add destination")
                }
                
            }
            .modifier(CollapsibleDestinationViewModifier())
            .frame(height: selectedOption == .location ? 120 : 64)
            .onTapGesture {
                withAnimation(.snappy) {
                    selectedOption = .location
                }
            }
            
            // Date picker view
            VStack(alignment: .leading) {
                if(selectedOption == .dates) {
                    Text("When's your trip?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    VStack {
                        DatePicker("From", selection: $startDate, displayedComponents: .date)
                            .onTapGesture(count: 99) {}
                        Divider()
                        
                        DatePicker("To", selection: $endDate, displayedComponents: .date)
                            .onTapGesture(count: 99) {}
                    }
                    .foregroundStyle(.gray)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                } else {
                    CollapsedPickerView(title: "When", description: "Add dates")
                }
            }
            .modifier(CollapsibleDestinationViewModifier())
            .frame(height: selectedOption == .dates ? 180 : 64)
            .onTapGesture {
                withAnimation(.snappy) {
                    selectedOption = .dates
                }
            }
            
            // Num guests view
            VStack(alignment: .leading) {
                if(selectedOption == .guests) {
                    Text("Who's coming?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Stepper {
                        Text("\(totalGuest) \(totalGuest > 1 ?"Adults" : "Adult")")
                    } onIncrement: {
                        totalGuest += 1
                    } onDecrement: {
                        if totalGuest > 0 {
                            totalGuest -= 1
                        }
                    }
                    .onTapGesture(count: 99) {}
                    
                } else {
                    CollapsedPickerView(title: "Who", description: "Add guests")
                }
            }
            .modifier(CollapsibleDestinationViewModifier())
            .frame(height: selectedOption == .guests ? 120 : 64)
            .onTapGesture {
                withAnimation(.snappy) {
                    selectedOption = .guests
                }
            }
        }
        Spacer()
        
    }
}

#Preview {
    DestinationSearchView(show: .constant(false))
}

struct CollapsibleDestinationViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        
//            .padding()
//            .frame(height: selectedOption == .location ? 120 : 64)
//            .background(.white)
//            .clipShape(RoundedRectangle(cornerRadius: 12))
//            .padding()
//            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
    }
}

struct CollapsedPickerView: View {
    let title: String
    let description: String
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .foregroundStyle(.gray)
                
                Spacer()
                
                Text(description)
            }
            .fontWeight(.semibold)
            .font(.subheadline)
        }
    }
}

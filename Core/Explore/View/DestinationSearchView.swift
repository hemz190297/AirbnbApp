//
//  DestinationSearchView.swift
//  Airbnb1
//
//  Created by Hemant Sonkusare on 24/05/25.
//

import SwiftUI

enum DestinationSearchOptions{
    case location
    case dates
    case guests
}

struct DestinationSearchView: View {
    @ObservedObject var viewModal: ExploreViewModel
      @Binding var show: Bool
    @State private var selectedOption :DestinationSearchOptions = .location
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var guestCount = 0

    var body: some View {
        VStack {
            HStack{
                Button{
                    withAnimation(.snappy){
                        viewModal.updateListingForLocation()
                        show.toggle()
                    }
                    
                }label: {
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundColor(.black)
                }
                Spacer()
                
                if !viewModal.searchLocation.isEmpty{
                    Button("Clear"){
                        viewModal.searchLocation = ""
                        viewModal.updateListingForLocation()
                    }
                    .foregroundStyle(.black)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                }
              
                
            }
            .padding()
          
            VStack(alignment: .leading){
                if selectedOption == .location{
                    Text("Where to?")
                        .font(.headline)
                    
                    HStack{
                        Image(systemName: "magnifyingglass")
                        TextField("Search Destination..",text:$viewModal.searchLocation)
                            .font(.subheadline)
                            .onSubmit {
                                viewModal.updateListingForLocation()
                                show.toggle()
                            }
                    }
                    .padding()
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    .overlay{
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 1)
                            .foregroundStyle(Color(.systemGray4))
                    }
                }else{
                    CollapsPickerView(title: "Where", description: "Add Description")
                }
              
            }
            .modifier(CollapsibleDestinationViewModier())
            .frame(height:selectedOption == .location ? 120 : 64)
            
                .onTapGesture {
                    withAnimation(.snappy){(selectedOption = .location)
                    }}
            
            VStack(alignment: .leading){
                if selectedOption == .dates{
                  
                        Text("When's your trip?")
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        VStack{
                            DatePicker("From",selection:$startDate, displayedComponents: .date)
                            Divider()
                            DatePicker("To",selection:$endDate, displayedComponents: .date)
                        }
                        .foregroundStyle(.gray)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                }else{
                    CollapsPickerView(title: "When", description: "Add Dates")
                }
            }
            .modifier(CollapsibleDestinationViewModier())
            .frame(height:selectedOption == .dates ? 180 : 64)
           
            .onTapGesture {
                withAnimation(.snappy){(selectedOption = .dates)
                }}
            
            VStack(alignment: .leading){
                if selectedOption == .guests{
                        Text("Who's comming?")
                        .font(.title)
                        .fontWeight(.semibold)
                    
                    Stepper{
                        Text("\(guestCount) Adults")
                    } onIncrement: {
                        guestCount+=1
                    } onDecrement: {
                        guard guestCount > 0 else { return }
                        guestCount-=1
                    }
                }else{
                    CollapsPickerView(title: "Who", description: "Add Guest")
                }
            }
            .modifier(CollapsibleDestinationViewModier())
            .frame(height:selectedOption == .guests ? 120 : 64)
            .onTapGesture {
                withAnimation(.snappy){(selectedOption = .guests)
                }}
            }
        Spacer()
        }
    }

#Preview {
    DestinationSearchView(
        viewModal: ExploreViewModel(service: ExploreService()),
        show: .constant(false)
    )
}

struct CollapsibleDestinationViewModier : ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
    }
}

struct CollapsPickerView: View {
    let title: String
    let description: String
    var body: some View {
        VStack{
            HStack{
                Text(title)
                    .foregroundStyle(.gray)
                Spacer()
                Text(description)
            }
          
        }
    }
}

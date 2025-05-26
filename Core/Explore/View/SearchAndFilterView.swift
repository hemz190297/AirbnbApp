//
//  SearchAndFilterView.swift
//  Airbnb1
//
//  Created by Hemant Sonkusare on 23/05/25.
//

import SwiftUI

struct SearchAndFilterView: View {
    @Binding var location: String
    
    var body: some View {
        HStack{
            Image(systemName:"magnifyingglass")
            VStack(alignment:.leading,spacing:2){
                Text(location.isEmpty ? "Where" : location)
                    .font(.footnote)
                    .fontWeight(.semibold)
                Text("\(location.isEmpty ? "Anywhere -" :"")Any Week - Add guest")
                    .font(.caption2)
                    .fontWeight(.light)
            }
           Spacer()
            
            Button(action: {}, label: {
                Image(systemName: "line.3.horizontal.decrease.circle")
                    .foregroundStyle(.black)
            })
        }
        .padding(10)
        .overlay{Capsule()
                .stroke(lineWidth:0.5)
                .foregroundStyle(Color(.systemGray4))
                .shadow(color: .black.opacity(0.4),radius: 2)
        }
        .padding()
    }
}

#Preview {
    SearchAndFilterView(location:.constant("Los Angeles"))
}

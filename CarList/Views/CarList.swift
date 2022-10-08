//
//  ContentView.swift
//  CarList
//
//  Created by Eric on 07/10/2022.
//

import SwiftUI

struct CarList: View {
    
    @EnvironmentObject var model: ContentModel
    @State private var searchMake = ""
    
    var body: some View {
        NavigationStack {
            
            ScrollView {
                LazyVStack(spacing: 20) {
                    ForEach(model.searchMake(for: searchMake)) { car in
                        CardView(car: car)
                    }
                }
                .padding()
            }
            .searchable(text: $searchMake, prompt: "Search make or model")
        }
    }
}

struct CarList_Previews: PreviewProvider {
    static var previews: some View {
        CarList()
            .environmentObject(ContentModel())
    }
}

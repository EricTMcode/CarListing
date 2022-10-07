//
//  ContentView.swift
//  CarList
//
//  Created by Eric on 07/10/2022.
//

import SwiftUI

struct CarList: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 20) {
                ForEach(model.cars) { car in
                    CardView(car: car)
                }
            }
            .padding()
        }
    }
}

struct CarList_Previews: PreviewProvider {
    static var previews: some View {
        CarList()
            .environmentObject(ContentModel())
    }
}

//
//  CardDetailView.swift
//  CarList
//
//  Created by Eric on 07/10/2022.
//

import SwiftUI

struct CardDetailView: View {
    
    let car: Car
    
    var body: some View {
        VStack(alignment: .leading) {
            
            // Add Pros List
            if !car.prosList.isEmpty {
                Text("Pros:")
                    .font(.caption.bold())
                ForEach(car.prosList, id: \.self) { pros in
                    if pros != "" {
                        Text("• \(pros)")
                            .font(.caption)
                    }
                }
            }
            
            // Add Cons List
            if !car.consList.isEmpty {
                Text("Cons:")
                    .font(.caption.bold())
                ForEach(car.consList, id: \.self) { cons in
                    if cons != "" {
                        Text("• \(cons)")
                            .font(.caption)
                    }
                }
            }
        }
    }
}

struct CardDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CardDetailView(car: Car.example)
    }
}

//
//  CarRating.swift
//  CarList
//
//  Created by Eric on 07/10/2022.
//

import SwiftUI

struct CarRating: View {
    
    var car: Car
    
    var body: some View {
        ForEach(0..<car.rating, id: \.self) { _ in
            Image(systemName: "star.fill")
                .foregroundColor(.yellow)
        }
    }
}

struct CarRating_Previews: PreviewProvider {
    static var previews: some View {
        CarRating(car: Car.example)
    }
}

//
//  CardView.swift
//  CarList
//
//  Created by Eric on 07/10/2022.
//

import SwiftUI

struct CardView: View {
    
    var car: Car
    
    var body: some View {
        ZStack {
            
            Rectangle()
                .foregroundColor(.white)
            
            VStack(alignment: .leading) {
                Image(car.image)
                    .resizable()
                    .scaledToFit()
                
                HStack(spacing: 1) {
                    Text(car.make)
                        .font(.title.bold())
                    
                    Spacer()

                    CarRating(car: car)
   
                }
                .padding([.leading, .trailing])
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(car.model)
                        .font(.title3)
                    
                    Text("$ \(car.customerPrice, format: .number)")
                        .font(.subheadline.bold())
                    
                    Divider()
                }
                .padding(.leading)
            }
            .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color(.gray), lineWidth: 0.3))
            .cornerRadius(10)
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(car: Car.example)
    }
}

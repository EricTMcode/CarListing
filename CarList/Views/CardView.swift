//
//  CardView.swift
//  CarList
//
//  Created by Eric on 07/10/2022.
//

import SwiftUI

struct CardView: View {
    @EnvironmentObject var model: ContentModel
    
    @State private var isExpanded: Bool = false
    
    var car: Car
    
    var body: some View {
        
        ZStack {
            
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
                    
                    VStack(alignment: .leading, spacing: 10) {
                        
                        Divider()
                        
                        if car.id == model.selectedCar {
                            CardDetailView(car: car)
                        }
                        
                        Button {
                            DispatchQueue.main.async {
                                withAnimation {
                                    
                                    if car.id == model.selectedCar {
                                        model.selectedCar = nil
                                    } else {
                                        model.selectedCar = car.id
                                    }
                                }
                            }
                        } label: {
                            Text(car.id == model.selectedCar ? "Hide details" : "Show details")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        .padding(.bottom, 10)
                    }
                }
                .padding(.leading)
            }
            .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color(.gray), lineWidth: 0.6))
            .cornerRadius(15)
            
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(car: Car.example)
            .environmentObject(ContentModel())
    }
}

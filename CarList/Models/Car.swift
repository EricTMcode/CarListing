//
//  Car.swift
//  CarList
//
//  Created by Eric on 07/10/2022.
//

import Foundation

struct Car: Identifiable, Codable {
    
    var id: UUID?
    var consList: [String]
    var customerPrice: Double
    var make: String
    var marketPrice: Double
    var model: String
    var prosList: [String]
    var rating: Int
    var image: String
    
    static let example = Car(consList: ["You can heard the engine over children cry at the back","","You may lose this one if you divorce"], customerPrice: 12550, make: "Land Rover", marketPrice: 14500, model: "Range Rover", prosList: ["Your average business man car","Can bring the family home safely","The city must have"], rating: 4, image: "Range_Rover")
}

//
//  ContentModel.swift
//  CarList
//
//  Created by Eric on 07/10/2022.
//

import Foundation

class ContentModel: ObservableObject {
    
    @Published var cars = [Car]()
    
    @Published var selectedCar: UUID?
    
    @Published var searchText: String = ""
    
    init() {
        
        getLocalData()
        
        // Define the default selected car for the CarList View
        selectedCar = cars[0].id
    }
    
    // MARK: - Data method
    
    func getLocalData() {
        
        // Get a url to the JSON File
        let jsonURL = Bundle.main.url(forResource: "car_list", withExtension: "json")
        
        do {
            // Read the file into a data object
            let jsonData = try Data(contentsOf: jsonURL!)
            
            // Try to decode the JSON into an array of car
            let jsonDecoder = JSONDecoder()
            var cars = try jsonDecoder.decode([Car].self, from: jsonData)
            
            // Loop through cars and add ID's
            for index in 0..<cars.count {
                cars[index].id = UUID()
            }
            
            // Assign parsed cars to cars property
            self.cars = cars
        }
        catch {
            // Log error
            print("Couldn't parse local data")
        }
    }
    
    // MARK: - Search Method
    
    func searchMake(for search: String) -> [Car] {
        let search = search.trimmingCharacters(in: .whitespaces)
        if search.isEmpty { return cars }
        
        return cars.filter {
            $0.make.localizedStandardContains(search) || $0.model.localizedStandardContains(search)
        }
    }
}

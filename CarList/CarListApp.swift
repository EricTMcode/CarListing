//
//  CarListApp.swift
//  CarList
//
//  Created by Eric on 07/10/2022.
//

import SwiftUI

@main
struct CarListApp: App {
    var body: some Scene {
        WindowGroup {
            CarList()
                .environmentObject(ContentModel())
        }
    }
}

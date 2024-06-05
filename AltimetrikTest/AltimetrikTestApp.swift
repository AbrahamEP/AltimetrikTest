//
//  AltimetrikTestApp.swift
//  AltimetrikTest
//
//  Created by Abraham Escamilla Pinelo on 05/06/24.
//

import SwiftUI

@main
struct AltimetrikTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: PhotoViewModel())
        }
    }
}

//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Nandini Saha on 2022-08-22.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = MemoryGameViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}

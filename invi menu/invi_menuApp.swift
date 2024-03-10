//
//  invi_menuApp.swift
//  invi menu
//
//  Created by Anubhav Gain on 29/02/24.
//

import SwiftUI

@main
struct invi_menuApp: App {
    // 1
    @State var currentNumber: String = "1"
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        // 2
        MenuBarExtra(currentNumber, systemImage: "\(currentNumber).circle") {
            // 3
            Button("One") {
                currentNumber = "1"
            }
            Button("Two") {
                currentNumber = "2"
            }
            Button("Three") {
                currentNumber = "3"
            }
        }
    }
}


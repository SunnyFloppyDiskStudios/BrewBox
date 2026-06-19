//
//  brewboxApp.swift
//  brewbox
//
//  Created by SunnyFlops on 19/06/2026.
//

import SwiftUI

@main
struct brewboxApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .frame(width: 1200, height: 650)
        }.windowResizability(.contentSize)
    }
}

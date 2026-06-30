//
//  brewboxApp.swift
//  brewbox
//
//  Created by SunnyFlops on 19/06/2026.
//

import SwiftUI

@main
struct brewboxApp: App {
    @StateObject private var appModel = AppModelController()
    
    var body: some Scene {
        WindowGroup(id: "contentView") {
            ContentView()
                .frame(width: 1200, height: 650)
                .environmentObject(appModel)
        }.windowResizability(.contentSize)
        
        WindowGroup(id: "runTerminalCommand") {
            RunTerminalCommand()
                .environmentObject(appModel)
        }.windowResizability(.contentSize)
    }
}

//
//  RunCleanup.swift
//  brewbox
//
//  Created by SunnyFlops on 30/06/2026.
//

import Foundation
import SwiftUI

func runCleanup(_ console: Binding<String>) {
    // cleanup (crazy)
    
    let out = shell("/opt/homebrew/bin/brew cleanup")
    console.wrappedValue += "\n> brew cleanup\n"
    console.wrappedValue += "\n\(out)\n"
}

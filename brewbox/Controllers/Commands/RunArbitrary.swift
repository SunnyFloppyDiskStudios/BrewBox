//
//  RunArbitrary.swift
//  brewbox
//
//  Created by SunnyFlops on 30/06/2026.
//

import Foundation
import SwiftUI

func runArbitrary(_ command: String, _ console: Binding<String>) {
    // run any brew command that the user requests
    
    let out = shell("/opt/homebrew/bin/brew \(command)")
    console.wrappedValue += "\n> brew \(command)\n"
    console.wrappedValue += "\n\(out)\n"
}

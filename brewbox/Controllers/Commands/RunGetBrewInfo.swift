//
//  RunGetBrewInfo.swift
//  brewbox
//
//  Created by SunnyFlops on 30/06/2026.
//

import Foundation
import SwiftUI

func runGetBrewInfo(_ console: Binding<String>) -> String {
    // get brew info
    
    let out = shell("/opt/homebrew/bin/brew info")
    console.wrappedValue += "\n> brew info\n"
    console.wrappedValue += "\n\(out)\n"
    
    return out
}

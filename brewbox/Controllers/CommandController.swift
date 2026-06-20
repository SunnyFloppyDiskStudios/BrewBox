//
//  CommandController.swift
//  brewbox
//
//  Created by SunnyFlops on 20/06/2026.
//

import Foundation
import SwiftUI

func runRefreshList(_ console: Binding<String>) -> [String.SubSequence] {
    // refresh the list of packages
    
    let out = shell("/opt/homebrew/bin/brew list")
    
    let packages = out.split(separator: "\n")
    
    print(packages)
    
    console.wrappedValue += "\n> brew list\n"
    console.wrappedValue += "\n\(out)\n"
    
    return packages
}

func runGetBrewInfo(_ console: Binding<String>) -> String {
    // get brew info
    
    let out = shell("/opt/homebrew/bin/brew info")
    
    console.wrappedValue += "\n> brew info\n"
    console.wrappedValue += "\n\(out)\n"
    return out
}

func runArbitrary(_ command: String, _ console: Binding<String>) {
    let out = shell("/opt/homebrew/bin/brew \(command)")
    
    console.wrappedValue += "\n> brew \(command)\n"
    console.wrappedValue += "\n\(out)\n"
}

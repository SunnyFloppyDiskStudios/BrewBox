//
//  RunRefreshList.swift
//  brewbox
//
//  Created by SunnyFlops on 30/06/2026.
//

import Foundation
import SwiftUI

func runRefreshList(_ console: Binding<String>) -> [String.SubSequence] {
    // refresh the list of packages
    
    let out = shell("/opt/homebrew/bin/brew list")
    console.wrappedValue += "\n> brew list\n"
    console.wrappedValue += "\n\(out)\n"
    
    let packages = out.split(separator: "\n")
    
    return packages
}

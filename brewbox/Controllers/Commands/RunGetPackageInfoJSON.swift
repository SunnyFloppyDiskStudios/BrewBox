//
//  RunGetPackageInfoJSON.swift
//  brewbox
//
//  Created by SunnyFlops on 30/06/2026.
//

import Foundation
import SwiftUI

struct PackageInfo: Decodable {
    let name: String
    let full_name: String
    
    let tap: String
    
    let desc: String
    
    let homepage: String
    
    let version: String // versions[0]
}


var packageInfos: [PackageInfo] = []


func runGetPackageInfoJSON(_ packageName: String, _ console: Binding<String>) {
    // get packages infos (in json)
    
    let out = shell("/opt/homebrew/bin/brew info \(packageName) --json")
    console.wrappedValue += "\n> brew info \(packageName) --json\n"
    console.wrappedValue += "\n\(out)\n"
    
    if out.contains("Error: Invalid usage: Cannot specify") {
        // try cask
        
        let out = shell("/opt/homebrew/bin/brew info \(packageName) --json=v2 --cask")
        console.wrappedValue += "\n> brew info \(packageName) --json=v2 --cask\n"
        console.wrappedValue += "\n\(out)\n"
        
        if out.contains("Error: Cask '\(packageName)' is unavailable:") {
            // error
            parsePackageInfoJSON(out, "NOEXISTCASK")
            
        } else {
            parsePackageInfoJSON(out)
        }
        
    } else if out.contains("Error: Refusing to load formula") {
        // error
        parsePackageInfoJSON(out, "REFUSEFORMULA")
        
    } else if out.contains("Error: No available formula with the name") {
        // error
        parsePackageInfoJSON(out, "NOEXISTFORMULA")
        
    } else {
        // usual parse
        parsePackageInfoJSON(out)
        
    }
}

func parsePackageInfoJSON(_ out: String, _ errorStatus: String = "NOERROR") {
    
}

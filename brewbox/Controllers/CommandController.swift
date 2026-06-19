//
//  CommandController.swift
//  brewbox
//
//  Created by SunnyFlops on 20/06/2026.
//

import Foundation

func refreshList() -> [String.SubSequence] {
    // refresh the list of packages
    
    let out = shell("/opt/homebrew/bin/brew list")
    
    let packages = out.split(separator: "\n")
    
    print(packages)
    
    return packages
}

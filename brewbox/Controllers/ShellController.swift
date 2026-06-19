//
//  ShellController.swift
//  brewbox
//
//  Created by SunnyFlops on 20/06/2026.
//

import Foundation

// run shell command
@discardableResult func shell(_ command: String) -> String {
    let task = Process()
    let pipe = Pipe()
    
    task.standardOutput = pipe
    task.standardError = pipe
    task.arguments = ["-c", command]
    task.launchPath = "/bin/zsh"
    task.standardInput = nil
    
    task.launch()
    
    let data = pipe.fileHandleForReading.readDataToEndOfFile()
    let output = String(data: data, encoding: .utf8)!
    
    print(output)
    
    return output
}

//
//  RunTerminalCommand.swift
//  brewbox
//
//  Created by SunnyFlops on 30/06/2026.
//

import SwiftUI

struct RunTerminalCommand: View {
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow
    
    @EnvironmentObject var appModel: AppModelController
    
    @State private var commandString: String = ""
    
    var body: some View {
        VStack {
            Text("Run any \(Text("brew").monospaced()) command")
            
            Text("\(Text("/opt/homebrew/bin/").monospaced())\(Text("brew").italic().monospaced())")
                .foregroundStyle(.secondary)
            
            HStack {
                Text("> brew").monospaced()
                    .frame(height: 20)
                
                TextField("...", text: $commandString).monospaced()
                    .frame(height: 20)
                    .onSubmit { closeAndSubmit() }
                
                Button {
                    closeAndSubmit()
                } label: {
                    Image(systemName: "chevron.right")
                        .frame(height: 20)
                }
            }
        }
        .padding()
    }
    
    func closeAndSubmit() {
        runArbitrary(commandString, $appModel.consoleOutput)
        
        dismissWindow(id: "runTerminalCommand")
    }
}

#Preview {
//    RunTerminalCommand()
}

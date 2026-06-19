//
//  ContentView.swift
//  brewbox
//
//  Created by SunnyFlops on 19/06/2026.
//

import SwiftUI

struct ContentView: View {
    @State var searchString: String = ""
    
    var body: some View {
        HStack {
            VStack {
                // list of packages
                // [NAME] (space) [URLBUTTON] [FILELOCCATIONBUTTON]
                
                List {
                    
                }
                
                HStack {
                    Button {
                        // refresh list
                        
                    } label: {
                        Image(systemName: "arrow.clockwise")
                            .frame(height: 20)
                    }
                    .tint(.accentColor)
                    
                    Button {
                        // upgrade homebrew
                        
                    } label: {
                        Image(systemName: "chevron.up.2")
                            .frame(height: 20)
                    }
                    .tint(.accentColor)
                    
                    Button {
                        // cleanup
                        
                    } label: {
                        Image(systemName: "sparkles.2")
                            .frame(height: 20)
                    }
                    
                    Button {
                        // terminal command
                        
                    } label: {
                        Image(systemName: "apple.terminal")
                            .frame(height: 20)
                    }
                    
                    Button {
                        // add a package
                        
                    } label: {
                        Image(systemName: "plus")
                            .frame(height: 20)
                    }
                    .tint(.green)
                    
                    Button {
                        // delete a selected package
                        
                    } label: {
                        Image(systemName: "minus")
                            .frame(height: 20)
                    }
                    .tint(.red)
                    
                    TextField("Search", text: $searchString)
                    
                }
                
                // buttons
                // refresh
                
                // brew manager
                // update, upgrade
                
            }
            
            VStack {
                Text("Console")
            }
            .frame(maxWidth: 200, maxHeight: .infinity)
            .background(Color.black)
        }
        .padding()
    }
}

#Preview(traits: .fixedLayout(width: 1200, height: 650)) {
    ContentView()
}

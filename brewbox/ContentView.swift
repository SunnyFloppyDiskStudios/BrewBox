//
//  ContentView.swift
//  brewbox
//
//  Created by SunnyFlops on 19/06/2026.
//

import SwiftUI

struct ContentView: View {
    @State var searchString: String = ""
    
    @State var brewInfo: String = "0 kegs, 0 files, 0B"
    
    @State public var consoleOutput: String = "Console\n\n"
    
    @State var packages: [String.SubSequence] = []
    @State var selectedPackages: Set<String.SubSequence> = []
    
    var body: some View {
        HStack {
            VStack {
                HStack {
                    Text(brewInfo)
                        .frame(alignment: .leading)
                }
                
                // list of packages
                // [NAME] (space) [VERSION] [URLBUTTON] [FILELOCCATIONBUTTON]
                
                List(selection: $selectedPackages) {
                    ForEach(packages, id: \.self) { package in
                        HStack {
                            Text(package)
                            
                            Spacer()
                            
                            Text("0.0")
                            
                            Button {
                                // url
                                
                            } label: {
                                Image(systemName: "globe")
                                    .frame(height: 20)
                            }
                            
                            Button {
                                // filepath
                                
                            } label: {
                                Image(systemName: "folder")
                                    .frame(height: 20)
                            }
                        }
                    }
                }
                
                HStack {
                    Button {
                        // refresh list
                        packages = runRefreshList($consoleOutput)
                        
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
            
            ScrollViewReader { proxy in
                ScrollView {
                    VStack {
                        Text(consoleOutput)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                            .padding()
                            .monospaced()
                        
                        Color.clear
                            .frame(height: 1)
                            .id("BOTTOM")
                    }
                }
                .onChange(of: consoleOutput) {
                    withAnimation {
                        proxy.scrollTo("BOTTOM", anchor: .bottom)
                    }
                }
            }
            .frame(maxWidth: 300, maxHeight: .infinity)
            .background(Color.black)
        }
        .padding()
        .onAppear() {
            brewInfo = runGetBrewInfo($consoleOutput)
            packages = runRefreshList($consoleOutput)
        }
    }
}

#Preview(traits: .fixedLayout(width: 1200, height: 650)) {
    ContentView()
}

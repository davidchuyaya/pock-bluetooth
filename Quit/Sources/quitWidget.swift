//
//  quitWidget.swift
//  Quit
//
//  Created by Kyle Gorter on 1/25/22.
//  
//

import Foundation
import AppKit
import PockKit

class quitWidget: PKWidget {
    
    static var identifier: String = "com.example.Quit"
    var customizationLabel: String = "Quit"
    var view: NSView!
    
    required init() {
        self.view = PKButton(title: "Quit", target: self, action: #selector(quit))
    }
    
    @objc private func quit() {
        
        let running = NSWorkspace.shared.frontmostApplication
        running?.terminate()
        
    }
    
}

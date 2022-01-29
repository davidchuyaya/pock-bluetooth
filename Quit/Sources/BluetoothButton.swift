//
//  BluetoothButton.swift
//  Quit
//
//  Created by David Chu on 1/29/22.
//

import Foundation
import AppKit

class BluetoothButton: NSButton {
    let width = 40
    
    init(target: Any, action: Selector) {
        super.init(frame: .init(x: 0, y: 0, width: width, height: 30))
        cell = NSButtonCell(imageCell: NSImage(systemSymbolName: "airpods", accessibilityDescription: nil))
        bezelStyle = .rounded
        setButtonType(.onOff)
        
        let clickGesture = NSClickGestureRecognizer(target: target, action: action)
        clickGesture.allowedTouchTypes = .direct
        addGestureRecognizer(clickGesture)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    /// The natural size for the receiving view, considering only properties of the view itself.
        override public var intrinsicContentSize: NSSize {
            return .init(width: width, height: 30)
        }
}

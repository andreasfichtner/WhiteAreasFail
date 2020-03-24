//
//  CustomView.swift
//  DrawFailDemo
//
//  Created by Andreas Fichtner on 23.03.20.
//  Copyright © 2020 iPrax Systems GmbH & Co. KG. All rights reserved.
//

import Foundation
import AppKit

class CustomView : NSView {
    
    override func viewDidMoveToWindow() {
        let trackingArea = NSTrackingArea.init(rect: self.bounds, options: [.activeInActiveApp, .mouseMoved], owner: self, userInfo: nil)
        addTrackingArea(trackingArea)
    }
    
    override func draw(_ dirtyRect: NSRect) {
        let ctx = NSGraphicsContext.current!.cgContext
        ctx.setBlendMode(CGBlendMode.multiply)
        ctx.setFillColor(NSColor.yellow.cgColor)
        if needsToDraw(dirtyRect) {
            ctx.fill(dirtyRect)
            ctx.stroke(dirtyRect)
        }
    }
    
    override var isFlipped: Bool {
        return true
    }
}

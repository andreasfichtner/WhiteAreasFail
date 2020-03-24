//
//  RootViewController.swift
//  DrawFailDemo
//
//  Created by Andreas Fichtner on 23.03.20.
//  Copyright © 2020 iPrax Systems GmbH & Co. KG. All rights reserved.
//

import Foundation
import AppKit

class RootViewController : NSViewController {
    @IBOutlet var scrollView : NSScrollView!
    var currentX = 0
    let nSubviews = 20
    
    override init(nibName nibNameOrNil: NSNib.Name?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        scrollView.contentView.contentInsets = NSEdgeInsetsZero

        for _ in 0...nSubviews {
            let view = CustomView(frame: NSRect(x: currentX, y: 0, width: 128, height: 3000))
            scrollView.documentView?.addSubview(view)
            currentX += 128
        }
        
        scrollView.documentView?.setFrameSize(NSSize(width: 128 * nSubviews, height: 3000))
    }
}

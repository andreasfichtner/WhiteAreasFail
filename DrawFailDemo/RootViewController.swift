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
    var subviews : [NSView] = []
    
    override init(nibName nibNameOrNil: NSNib.Name?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        scrollView.contentView.contentInsets = NSEdgeInsetsZero
        NotificationCenter.default.addObserver(forName: NSView.boundsDidChangeNotification, object: scrollView.contentView, queue: OperationQueue.main) { (Notification) in
            self.addViewToScrollView()
        }
    }
    
    func addViewToScrollView() {
        for subview in subviews {
            if subview.frame.intersects(scrollView.documentView!.visibleRect) {
                return
            }
        }
        let view = CustomView(frame: NSRect(x: currentX, y: 0, width: 128, height: 3000))
        scrollView.documentView?.addSubview(view)
        currentX += 128
        scrollView.documentView?.setFrameSize(NSSize(width: currentX + 128, height: 3000))
    }
}

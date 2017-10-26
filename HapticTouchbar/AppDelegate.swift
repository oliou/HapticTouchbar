//
//  AppDelegate.swift
//  HapticTouchbar
//
//  Created by Olivier Piau on 25/10/17.
//  Copyright © 2017 Olivier Piau. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    
    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var theLabel: NSTextField!
    @IBOutlet weak var theButton: NSButton!
    var trackingTouchIdentity: AnyObject?
    
    
    var buttonPresses = 0;
    
    var statusBar = NSStatusBar.system()
    var statusBarItem : NSStatusItem = NSStatusItem()
    var menu: NSMenu = NSMenu()
    var menuItem : NSMenuItem = NSMenuItem()
    
    override func awakeFromNib() {
        theLabel.stringValue = "You've pressed the button -1 \(buttonPresses) times!"
        
        //Add statusBarItem
        statusBarItem = statusBar.statusItem(withLength: -1)
        statusBarItem.menu = menu
        statusBarItem.title = "Presses"
        
        //Add menuItem to menu
        menuItem.title = "Clicked"
        menuItem.action = Selector(("setWindowVisible:"))
        menuItem.keyEquivalent = ""
        menu.addItem(menuItem)
        NSHapticFeedbackManager.defaultPerformer().perform(.alignment, performanceTime: .default)
    }
    
    func touchesBegan(with event: NSEvent) {
    
    }

    func applicationDidFinishLaunching(aNotification: NSNotification?) {
        self.window!.orderOut(self)
    }
    
    @IBAction func buttonPressed(_ sender: NSButtonCell) {
        buttonPresses+=1
        theLabel.stringValue = "You've pressed the button \n \(buttonPresses) times!"
        menuItem.title = "Clicked \(buttonPresses)"
        statusBarItem.title = "Presses \(buttonPresses)"
        
       // NSHapticFeedbackManager.defaultPerformer().perform(.alignment, performanceTime: .default)

    }
    
    func setWindowVisible(sender: AnyObject){
        self.window!.orderFront(self)
    }
    
}


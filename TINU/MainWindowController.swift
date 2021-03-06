//
//  mainWindowController.swift
//  TINU
//
//  Created by Pietro Caruso on 05/05/17.
//  Copyright © 2017 Pietro Caruso. All rights reserved.
//

import Cocoa

//this class maages the window
public class mainWindowController: GenericWindowController {

    override public func windowDidLoad() {
        super.windowDidLoad()
        
        window?.delegate = self
        
        window?.toolbar = NSApplication.shared().windows[0].toolbar
        
        //we have got all the needed data, so we can setup the look properly
        self.setUI()
        
        sharedWindow = self.window
        
        sharedStoryboard = self.storyboard
        
        //self.contentViewController?.viewDidLoad()
        
        /*
        if sharedIsOnRecovery{
            self.contentViewController?.openSubstituteWindow(windowStoryboardID: "chooseSide", sender: self)
        }*/
    }
    
    public func windowWillClose(_ notification: Notification){
        NSApplication.shared().terminate(self)
    }
    
    func windowShouldClose(_ sender: Any) -> Bool {
        if sharedIsCreationInProgress{
            //if !dialogYesNoWarning(question: "Stop the process?", text: "Do you want to abort the Installer cration process?", style: .informational){
                if let w = self.contentViewController as? InstallingViewController{
                    return w.stopWithAsk()
                }
            //}
        }
        
        if sharedIsPreCreationInProgress{
            return false
        }
        
        return true
    }
    
}

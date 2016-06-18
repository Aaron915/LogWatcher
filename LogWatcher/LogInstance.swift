//
//  LogInstance.swift
//  LogWatcher
//
//  Created by Aaron Williams on 6/18/16.
//  Copyright © 2016 Aaron Williams. All rights reserved.
//

class LogInstance: NSObject {
    
    let title: String
    let startTime = NSDate()
    
    private var logs: [LogEvent] = []
    
    init(title: String) {
        self.title = title
    }
    
    func logEvent(event: String) {
        logs.append(LogEvent(text: event))
    }
    
    func endLog() {
        
    }
}

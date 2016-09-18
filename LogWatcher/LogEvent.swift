//
//  LogEvent.swift
//  LogWatcher
//
//  Created by Aaron Williams on 6/18/16.
//  Copyright © 2016 Aaron Williams. All rights reserved.
//

import Foundation

/**
 *  Represents a single log event.
 */
struct LogEvent {
    
    /// Text of the log.
    let text: String
    
    /// Date the event was recorded.
    let date: Date = Date()
    
    /**
     Returns the log representation of the date and the text.
     
     - parameter dateFormatter: Formatter used convert the date property to a string.
     
     - returns: String representation of the log.
     */
    func log(_ dateFormatter: DateFormatter) -> String {
        let dateText = dateFormatter.string(from: date)
        return dateText + "-" + text
    }
    
    /**
     - parameter items: Items to be logged.
     */
    init(items: AnyObject...) {
        self.text = items.reduce("") {$0 + $1.debugDescription}
    }
}

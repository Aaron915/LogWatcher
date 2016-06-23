//
//  LogInstance.swift
//  LogWatcher
//
//  Created by Aaron Williams on 6/18/16.
//  Copyright © 2016 Aaron Williams. All rights reserved.
//

/// Object that will keep, group and format a set of logs.
public class LogInstance: NSObject {
    
    /// Title that will appear at the top of the aggregate log.
    private let title: String
    
    /// Start time of the log.
    private let startTime = NSDate()
    
    /// Main formatter for dates on the logs.
    private static let dateFormatter: NSDateFormatter = {
        let dateFormatter = NSDateFormatter()
        
        dateFormatter.timeStyle = .LongStyle
        dateFormatter.dateStyle = .LongStyle
        
        return dateFormatter
    }()
    
    /// Log events that have been grouped together.
    private var logs: [LogEvent] = []
    
    public init(title: String) {
        self.title = title
    }
    
    /**
     Adds an event to the list of logs/
     
     - parameter items: Items to be included in the log.
     */
    public func addEvent(items: AnyObject...) {
        debugPrint(items)
        logs.append(LogEvent(items: items))
    }
    
    /**
     Ends the log instance and delivers the aggregated log 
     asynchronously.
     
     - parameter completion: closure to be executed with the final log.
     */
    public func endLog(withCompletion completion: (log: String) -> Void) {
        let localSelf = self
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            let fullLogs = localSelf.buildLogString()
            completion(log: fullLogs)
        }
    }
    
    /**
     Builds the final aggegrated log string
     
     - returns: Full aggregated log.
     */
    private func buildLogString() -> String {
        let dateString = LogInstance.dateFormatter.stringFromDate(startTime)
        let events: [String] = logs.map {$0.log(LogInstance.dateFormatter)}
        
        return events.reduce(title + "\n" + dateString + "\n") { $0 + "\n" + $1}
    }
}

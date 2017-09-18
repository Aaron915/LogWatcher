//
//  LogInstance.swift
//  LogWatcher
//
//  Created by Aaron Williams on 6/18/16.
//  Copyright © 2016 Aaron Williams. All rights reserved.
//

/// Object that will keep, group and format a set of logs.
open class LogInstance: NSObject {
    
    /// Title that will appear at the top of the aggregate log.
    fileprivate let title: String
    
    /// Start time of the log.
    fileprivate let startTime = Date()
    
    /// Main formatter for dates on the logs.
    fileprivate static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        
        dateFormatter.timeStyle = .long
        dateFormatter.dateStyle = .long
        
        return dateFormatter
    }()
    
    /// Log events that have been grouped together.
    fileprivate var logs: [LogEvent] = []
    
    public init(title: String) {
        self.title = title
    }
    
    /**
     Adds an event to the list of logs.
     
     - parameter items: Items to be included in the log.
     */
    open func addEvent(_ items: AnyObject...) {
        #if DEBUG
            debugPrint(items)
        #endif
        logs.append(LogEvent(items: items as AnyObject))
    }
    
    /**
     Ends the log instance and delivers the aggregated log 
     asynchronously.
     
     - parameter completion: closure to be executed with the final log.
     */
    open func endLog(withCompletion completion: @escaping (_ log: String) -> Void) {
        let localSelf = self
        DispatchQueue.global(qos: .default).async { 
            let fullLogs = localSelf.buildLogString()
            completion(fullLogs)
        }
    }
    
    /**
     Builds the final aggegrated log string
     
     - returns: Full aggregated log.
     */
    fileprivate func buildLogString() -> String {
        let dateString = LogInstance.dateFormatter.string(from: startTime)
        let events: [String] = logs.map {$0.log(LogInstance.dateFormatter)}
        
        return events.reduce(title + "\n" + dateString + "\n") { $0 + "\n" + $1}
    }
    
}

//
// Created by Daijiro Abe on 2016/02/26.
//

import HeliumLogger
import LoggerAPI
#if os(Linux)
import Glibc
#else
import Foundation
#endif

public enum LogLevel : Int {
    case Verbose = 1
    case Info = 2
    case Debug = 3
    case Warning = 4
    case Error = 5
}

public class LithimLogger {

    public var logLevel : LogLevel = .Verbose
    private let heliumLogger : HeliumLogger = HeliumLogger()

    public var colored: Bool {
        get {
            return heliumLogger.colored
        }
        set {
            heliumLogger.colored = newValue
        }
    }

    public var details: Bool {
        get {
            return heliumLogger.details
        }
        set {
            heliumLogger.details = newValue
        }
    }


    public init(logLevel: LogLevel) {
        self.logLevel = logLevel
    }

    private func messageTypeToLevel(type: LoggerMessageType) -> LogLevel {
        switch(type) {
            case .Verbose:
                return .Verbose
            case .Info:
                return .Info
            case .Debug:
                return .Debug
            case .Warning:
                 return .Warning
            case .Error:
                return .Error
        }
    }
}

extension LithimLogger : Logger {

    public func log(type: LoggerMessageType, msg: String, functionName: String, lineNum: Int, fileName: String) {

        let currentLevel = messageTypeToLevel(type)

        if(logLevel.rawValue <= currentLevel.rawValue) {
            heliumLogger.log(type, msg: msg, functionName: functionName, lineNum: lineNum, fileName: fileName)
            fflush(stdout)
        }
    }
}
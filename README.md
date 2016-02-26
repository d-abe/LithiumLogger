# LithiumLogger
IBM's lightweight logging framework ['HeliumLogger'](https://github.com/IBM-Swift/HeliumLogger.git) with setting log level

## Usage:

```swift
import LithiumLogger

Log.logger = LithiumLogger(logLevel: .Warning)

Log.error("This is a error log message.")
```
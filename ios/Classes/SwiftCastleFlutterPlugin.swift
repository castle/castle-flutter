import Flutter
import UIKit
import Castle
import Castle.CastleConfiguration

public class SwiftCastleFlutterPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "castle", binaryMessenger: registrar.messenger())
        let instance = SwiftCastleFlutterPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "configure":
            configure(call, result: result)
        case "screen":
            screen(call, result: result)
        case "custom":
            custom(call, result: result)
        case "flush":
            flush(call, result: result)
        case "flushIfNeeded":
            flushIfNeeded(call, result: result)
        case "reset":
            reset(call, result: result)
        case "createRequestToken":
            createRequestToken(call, result: result)
        case "requestTokenHeaderName":
            requestTokenHeaderName(call, result: result)
        case "userJwt":
            userJwt(call, result: result)
        case "userAgent":
            userAgent(call, result: result)
        case "queueSize":
            queueSize(call, result: result)
        default:
            result(FlutterMethodNotImplemented)
        }
    }

    private func configure(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if let args = call.arguments as? Dictionary<String, Any> {
            let configuration = CastleConfiguration(publishableKey: (args["publishableKey"] as? String)!)

            if let debugLoggingEnabled = args["debugLoggingEnabled"] as? Bool {
                configuration.isDebugLoggingEnabled = debugLoggingEnabled
            }

            if let flushLimit = args["flushLimit"] as? UInt {
                configuration.flushLimit = flushLimit
            }

            if let maxQueueLimit = args["maxQueueLimit"] as? UInt {
                configuration.maxQueueLimit = maxQueueLimit
            }

            if let baseURLAllowList = args["baseURLAllowList"] as? Array<URL> {
                configuration.baseURLAllowList = baseURLAllowList
            }

            Castle.configure(configuration)

            result(true)
        } else {
            result(FlutterError.init(code: "bad args", message: nil, details: nil))
        }
    }

    private func userJwt(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if let args = call.arguments as? Dictionary<String, Any> {
            Castle.userJwt((args["userJwt"] as? String)!)

            result(true)
        } else {
            result(FlutterError.init(code: "bad args", message: nil, details: nil))
        }
    }

    private func custom(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if let args = call.arguments as? Dictionary<String, Any> {
            let name = (args["name"] as? String)!
            let properties = (args["properties"] as? Dictionary<String, Any>) ?? [:]
            Castle.custom(name: name, properties: properties)

            result(true)
        } else {
            result(FlutterError.init(code: "bad args", message: nil, details: nil))
        }
    }

    private func screen(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if let args = call.arguments as? Dictionary<String, Any> {
            Castle.screen(name: (args["name"] as? String)!)

            result(true)
        } else {
            result(FlutterError.init(code: "bad args", message: nil, details: nil))
        }
    }

    private func flush(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        Castle.flush()

        result(true)
    }

    private func flushIfNeeded(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if let args = call.arguments as? Dictionary<String, Any> {
            Castle.flushIfNeeded(URL(string: (args["url"] as? String)!)!)

            result(true)
        } else {
            result(FlutterError.init(code: "bad args", message: nil, details: nil))
        }
    }

    private func reset(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        Castle.reset()

        result(true)
    }

    private func createRequestToken(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        result(Castle.createRequestToken())
    }

    private func requestTokenHeaderName(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        result(CastleRequestTokenHeaderName)
    }

    private func userAgent(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        result(Castle.userAgent())
    }

    private func queueSize(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        result(Castle.queueSize())
    }
}

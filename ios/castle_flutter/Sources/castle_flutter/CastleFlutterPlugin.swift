import Flutter
import UIKit
import CastleSDK

@objc(CastleFlutterPlugin)
public class CastleFlutterPlugin: NSObject, FlutterPlugin {
    var idfa: String? = nil

    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "castle", binaryMessenger: registrar.messenger())
        let instance = CastleFlutterPlugin()
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
        case "reset":
            reset(call, result: result)
        case "createRequestToken":
            createRequestToken(call, result: result)
        case "requestTokenHeaderName":
            requestTokenHeaderName(call, result: result)
        case "userJwt":
            userJwt(call, result: result)
        case "advertisingIdentifier":
            setAdvertisingIdentifier(call, result: result)
        default:
            result(FlutterMethodNotImplemented)
        }
    }

    // Castle.configure(_:) must be called on the main thread, otherwise it throws
    // CastleConfigurationError.mustConfigureOnMainThread. Method channel handlers
    // are already invoked on the platform (main) thread, so no dispatch is needed.
    private func configure(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        guard let args = call.arguments as? Dictionary<String, Any>,
              let publishableKey = args["publishableKey"] as? String else {
            result(FlutterError.init(code: "bad args", message: nil, details: nil))
            return
        }

        let configuration = CastleConfiguration(publishableKey: publishableKey)
        configuration.adSupportBlock = { () -> String in
            return self.idfa ?? ""
        }

        if let debugLoggingEnabled = args["debugLoggingEnabled"] as? Bool {
            configuration.isDebugLoggingEnabled = debugLoggingEnabled
        }

        if let lifeCycleEventsEnabled = args["lifeCycleEventsEnabled"] as? Bool {
            configuration.isApplicationLifecycleTrackingEnabled = lifeCycleEventsEnabled
        }

        if let flushLimit = args["flushLimit"] as? Int {
            configuration.flushLimit = flushLimit
        }

        if let maxQueueLimit = args["maxQueueLimit"] as? Int {
            configuration.maxQueueLimit = maxQueueLimit
        }

        if let baseURLAllowList = args["baseURLAllowList"] as? Array<String> {
            configuration.baseURLAllowList = baseURLAllowList.compactMap { URL(string: $0) }
        }

        do {
            try Castle.configure(configuration)
            result(true)
        } catch {
            result(FlutterError.init(code: "CastleException", message: error.localizedDescription, details: nil))
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

    private func reset(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        Castle.reset()

        result(true)
    }

    private func createRequestToken(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        result(Castle.createRequestToken())
    }

    private func requestTokenHeaderName(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        result(Castle.requestTokenHeaderName)
    }

    private func setAdvertisingIdentifier(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if let args = call.arguments as? Dictionary<String, Any> {
            self.idfa = ((args["identifier"] as? String)!)

            result(true)
        } else {
            result(FlutterError.init(code: "bad args", message: nil, details: nil))
        }
    }
}

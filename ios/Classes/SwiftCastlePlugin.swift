import Flutter
import UIKit

public class SwiftCastlePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "castle", binaryMessenger: registrar.messenger())
    let instance = SwiftCastlePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
        case "configure":
            configure(call, result)
        case "configureWithPublishableKey":
            configureWithPublishableKey(call, result)
        case "identify":
            identify(call, result)
        case "secure":
            secure(call, result)
        case "screen":
            screen(call, result)
        case "flush":
            flush(call, result)
        case "flushIfNeeded":
            flushIfNeeded(call, result)
        case "reset":
            reset(call, result)
        case "baseUrl":
            baseUrl(call, result)
        case "clientId":
            clientId(call, result)
        case "clientIdHeaderName":
            clientIdHeaderName(call, result)
        case "userId":
            userId(call, result)
        case "userSignature":
            userSignature(call, result)
        case "userAgent":
            userAgent(call, result)
        case "queueSize":
            queueSize(call, result)
        default:
            result(FlutterMethodNotImplemented)
    }
  }
    
    private func configure(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        
    }
    
    private func configureWithPublishableKey(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if let args = call.arguments as? Dictionary<String, Any> {
            let configuration = CastleConfiguration(publishableKey: args["publishableKey"] as? String)
            configuration.isDebugLoggingEnabled = args["debugLoggingEnabled"] as? Bool
            configuration.flushLimit = args["flushLimit"] as? Int
            configuration.maxQueueLimit(args["maxQueueLimit"] as? Int)

            Castle.setup(with: configuration)
            
            result(true)
        } else {
            result(FlutterError.init(code: "bad args", message: nil, details: nil))
        }
    }
    
    private func identify(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if let args = call.arguments as? Dictionary<String, Any> {
            Castle.identify(userId: args["userId"] as? String)
            
            result(true)
        } else {
            result(FlutterError.init(code: "bad args", message: nil, details: nil))
        }
    }
    
    private func secure(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if let args = call.arguments as? Dictionary<String, Any> {
            Castle.secure(signature: args["signature"] as? String)
            
            result(true)
        } else {
            result(FlutterError.init(code: "bad args", message: nil, details: nil))
        }
    }
    
    private func screen(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if let args = call.arguments as? Dictionary<String, Any> {
            Castle.screen(signature: args["name"] as? String)
            
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
            Castle.flushIfNeeded(url: args["url"] as? String)
            
            result(true)
        } else {
            result(FlutterError.init(code: "bad args", message: nil, details: nil))
        }
    }
    
    private func reset(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        Castle.reset()
        
        result(true)
    }
    
    private func baseUrl(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        result(Castle.baseUrl())
    }
    
    private func clientId(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        result(Castle.clientId())
    }
    
    private func clientIdHeaderName(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        result(Castle.clientIdHeaderName())
    }
    
    private func userId(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        result(Castle.userId())
    }
    
    private func userSignature(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        result(Castle.userSignature())
    }
    
    private func userAgent(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        result(Castle.userAgent())
    }
    
    private func queueSize(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        result(Castle.queueSize())
    }
}

package io.castle.flutter.castle_flutter

import android.app.Application
import android.content.Context
import androidx.annotation.NonNull
import io.castle.android.Castle
import io.castle.android.CastleConfiguration
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** CastleFlutterPlugin */
class CastleFlutterPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel

  private lateinit var application: Application

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "castle")
    channel.setMethodCallHandler(this)
    application = flutterPluginBinding.applicationContext as Application
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    when {
        call.method.equals("configure") -> {
          this.configure(call, result);
        }
        call.method.equals("configureWithPublishableKey") -> {
            this.configureWithPublishableKey(call, result);
        }
        call.method.equals("identify") -> {
          this.identify(call, result);
        }
        call.method.equals("secure") -> {
          this.secure(call, result);
        }
        call.method.equals("screen") -> {
          this.screen(call, result);
        }
        call.method.equals("flush") -> {
          this.flush(call, result);
        }
        call.method.equals("flushIfNeeded") -> {
          this.flushIfNeeded(call, result);
        }
        call.method.equals("reset") -> {
          this.reset(result);
        }
        call.method.equals("baseUrl") -> {
          this.baseUrl(call, result);
        }
        call.method.equals("clientId") -> {
          this.clientId(call, result);
        }
        call.method.equals("clientIdHeaderName") -> {
          this.clientIdHeaderName(call, result);
        }
        call.method.equals("userId") -> {
          this.userId(call, result);
        }
        call.method.equals("userSignature") -> {
          this.userSignature(call, result);
        }
        call.method.equals("userAgent") -> {
          this.userAgent(call, result);
        }
        call.method.equals("queueSize") -> {
          this.queueSize(call, result);
        }
        else -> {
          result.notImplemented()
        }
    }
  }

  private fun configure(call: MethodCall, result: Result) {
      try {
          val publishableKey = call.argument<String>("publishableKey")
          val debugLoggingEnabled = call.argument<Boolean>("debugLoggingEnabled")
          val maxQueueLimit = call.argument<Int>("maxQueueLimit")
          val flushLimit = call.argument<Int>("flushLimit")
          val useCloudflareApp = call.argument<Boolean>("useCloudflareApp")

          val configuration: CastleConfiguration = CastleConfiguration.Builder()
                  .publishableKey(publishableKey)
                  .debugLoggingEnabled(debugLoggingEnabled == true) // Default false
                  .flushLimit(flushLimit!!)
                  .maxQueueLimit(maxQueueLimit!!)
                  .useCloudflareApp(useCloudflareApp!!)
                  .build()

          Castle.configure(application, configuration)

          //Castle.configure(applicationContext, publishableKey)
          result.success(true)
      } catch (e: Exception) {
          result.error("CastleException", e.localizedMessage, null)
      }
  }

  private fun configureWithPublishableKey(call: MethodCall, result: Result) {
      try {
          val publishableKey = call.argument<String>("publishableKey")
          Castle.configure(application, publishableKey)
          result.success(true)
      } catch (e: Exception) {
          result.error("CastleException", e.localizedMessage, null)
      }
  }

  private fun identify(call: MethodCall, result: Result) {
      try {
          val userId = call.argument<String>("userId");
          Castle.identify(userId)
          result.success(true)
      } catch (e: Exception) {
          result.error("CastleException", e.localizedMessage, null)
      }
  }

  private fun secure(call: MethodCall, result: Result) {
      try {
          val signature = call.argument<String>("signature");
          Castle.secure(signature)
          result.success(true)
      } catch (e: Exception) {
          result.error("CastleException", e.localizedMessage, null)
      }
  }

  private fun screen(call: MethodCall, result: Result) {
      try {
          val name = call.argument<String>("name");
          Castle.screen(name)
          result.success(true)
      } catch (e: Exception) {
          result.error("CastleException", e.localizedMessage, null)
      }
  }

  private fun flush(call: MethodCall, result: Result) {
    try {
      Castle.flush()
      result.success(true)
    } catch (e: Exception) {
      result.error("CastleException", e.localizedMessage, null)
    }
  }

  private fun flushIfNeeded(call: MethodCall, result: Result) {
      try {
          val url = call.argument<String>("url");
          Castle.flushIfNeeded(url)
          result.success(true)
      } catch (e: Exception) {
          result.error("CastleException", e.localizedMessage, null)
      }
  }

  private fun reset(result: Result) {
    try {
      Castle.reset()
      result.success(true)
    } catch (e: Exception) {
      result.error("CastleException", e.localizedMessage, null)
    }
  }

  private fun baseUrl(call: MethodCall, result: Result) {
    try {
      val baseUrl: String = Castle.baseUrl()
      result.success(baseUrl)
    } catch (e: Exception) {
      result.error("CastleException", e.localizedMessage, null)
    }
  }

  private fun clientId(call: MethodCall, result: Result) {
    try {
      val clientId: String = Castle.clientId()
      result.success(clientId)
    } catch (e: Exception) {
      result.error("CastleException", e.localizedMessage, null)
    }
  }

  private fun clientIdHeaderName(call: MethodCall, result: Result) {
    try {
      val clientIdHeaderName: String = Castle.clientIdHeaderName
      result.success(clientIdHeaderName)
    } catch (e: Exception) {
      result.error("CastleException", e.localizedMessage, null)
    }
  }

  private fun userId(call: MethodCall, result: Result) {
    try {
      val userId: String = Castle.userId()
      result.success(userId)
    } catch (e: Exception) {
      result.error("CastleException", e.localizedMessage, null)
    }
  }

  private fun userSignature(call: MethodCall, result: Result) {
    try {
      val userSignature: String = Castle.userSignature()
      result.success(userSignature)
    } catch (e: Exception) {
      result.error("CastleException", e.localizedMessage, null)
    }
  }

  private fun userAgent(call: MethodCall, result: Result) {
    try {
      val userAgent: String = Castle.userAgent()
      result.success(userAgent)
    } catch (e: Exception) {
      result.error("CastleException", e.localizedMessage, null)
    }
  }

  private fun queueSize(call: MethodCall, result: Result) {
    try {
      val queueSize: Int = Castle.queueSize()
      result.success(queueSize)
    } catch (e: Exception) {
      result.error("CastleException", e.localizedMessage, null)
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}

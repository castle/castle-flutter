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
          this.configure(call, result)
        }
        call.method.equals("custom") -> {
          this.custom(call, result)
        }
        call.method.equals("screen") -> {
          this.screen(call, result)
        }
        call.method.equals("flush") -> {
          this.flush(call, result)
        }
        call.method.equals("flushIfNeeded") -> {
          this.flushIfNeeded(call, result)
        }
        call.method.equals("reset") -> {
          this.reset(result)
        }
        call.method.equals("baseUrl") -> {
          this.baseUrl(call, result)
        }
        call.method.equals("createRequestToken") -> {
            this.createRequestToken(call, result)
        }
        call.method.equals("requestTokenHeaderName") -> {
            this.requestTokenHeaderName(call, result)
        }
        call.method.equals("userJwt") -> {
          this.userJwt(call, result)
        }
        call.method.equals("userAgent") -> {
          this.userAgent(call, result)
        }
        call.method.equals("queueSize") -> {
          this.queueSize(call, result)
        }
        else -> {
          result.notImplemented()
        }
    }
  }

  private fun configure(call: MethodCall, result: Result) {
      try {
          val builder = CastleConfiguration.Builder()

          call.argument<String>("publishableKey")?.let {
              builder.publishableKey(it)
          }
          call.argument<Boolean>("debugLoggingEnabled")?.let {
              builder.debugLoggingEnabled(it)
          }
          call.argument<Int>("maxQueueLimit")?.let {
              builder.maxQueueLimit(it)
          }
          call.argument<Int>("flushLimit")?.let {
              builder.flushLimit(it)
          }
          call.argument<List<String>>("baseURLAllowList")?.let {
              builder.baseURLAllowList(it)
          }
          val configuration = builder.build()
          Castle.configure(application, configuration)

          result.success(true)
      } catch (e: Exception) {
          result.error("CastleException", e.localizedMessage, null)
      }
  }

  private fun screen(call: MethodCall, result: Result) {
      try {
          val name = call.argument<String>("name")
          Castle.screen(name)
          result.success(true)
      } catch (e: Exception) {
          result.error("CastleException", e.localizedMessage, null)
      }
  }

  private fun custom(call: MethodCall, result: Result) {
      try {
          val name = call.argument<String>("name")
          val properties = call.argument<Map<String, Any>>("properties")
          Castle.custom(name, properties)
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
          val url = call.argument<String>("url")
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

  private fun createRequestToken(call: MethodCall, result: Result) {
      try {
          val token: String = Castle.createRequestToken()
          result.success(token)
      } catch (e: Exception) {
          result.error("CastleException", e.localizedMessage, null)
      }
  }

  private fun requestTokenHeaderName(call: MethodCall, result: Result) {
    try {
      val requestTokenHeaderName: String = Castle.requestTokenHeaderName
      result.success(requestTokenHeaderName)
    } catch (e: Exception) {
      result.error("CastleException", e.localizedMessage, null)
    }
  }

  private fun userJwt(call: MethodCall, result: Result) {
    try {
        val userJwt = call.argument<String>("userJwt")
        Castle.userJwt(userJwt)
      result.success(true)
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

package com.example.blankdemo.flutter_blank_demo

import android.content.Context
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.embedding.engine.FlutterEngineGroup
import io.flutter.embedding.engine.dart.DartExecutor

object MyApplication {
    lateinit var context: Context
    val engines by lazy {
        FlutterEngineGroup(
            context
        )
    }

    var hasInit = false
    fun init(context: Context) {
        if (hasInit) {
            return
        }
        hasInit = true
        this.context = context.applicationContext
    }

    fun getEngine() : FlutterEngine {
        return engines.createAndRunEngine(context, DartExecutor.DartEntrypoint.createDefault())
    }

    fun releaseEngine(engine: FlutterEngine?) {
        if(engine == null) {
            return
        }
        engine.destroy()
    }
}
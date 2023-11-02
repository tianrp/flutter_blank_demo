package com.example.blankdemo.flutter_blank_demo
import android.content.Context
import android.content.Intent
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MyFlutterActivity : FlutterActivity() {
    companion object {
        private const val KEY_PAGE = "page_name"
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        flutterEngine?.let {
            val channel = MethodChannel(it.dartExecutor, "com.example.myapp/open_page")
            channel.setMethodCallHandler { call, result ->
                if(call.method == "open_page") {
                    val pageName = call.arguments as String
                    val intent = Intent(this@MyFlutterActivity, MyFlutterActivity::class.java)
                    intent.putExtra(KEY_PAGE, pageName)
                    startActivity(intent)
                }
            }
            initPage(channel)
        }
    }


    private fun initPage(channel: MethodChannel) {
        var pageName = intent.getStringExtra(KEY_PAGE)
        if (pageName.isNullOrEmpty()) {
            pageName = "page1"
        }
        channel.invokeMethod("open_page", pageName)
    }

    override fun getCachedEngineId(): String? {
        return null
    }

    override fun provideFlutterEngine(context: Context): FlutterEngine {
        return MyApplication.getEngine()
    }

    override fun onDestroy() {
        val engine = flutterEngine
        super.onDestroy()
        MyApplication.releaseEngine(engine)
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        flutterEngine.platformViewsController.registry.registerViewFactory("com.example.myapp/text_view", TextViewFactory("engine:${this.flutterEngine?.hashCode()?.toString()}  activity:${this.hashCode().toString()}"))
    }

}
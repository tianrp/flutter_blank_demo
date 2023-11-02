package com.example.blankdemo.flutter_blank_demo

import android.content.Context
import android.graphics.Color
import android.view.View
import android.webkit.WebView
import android.widget.TextView
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

class WebViewFactory(val hash : String?) : PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    override fun create(context: Context, id: Int, args: Any?): PlatformView {
        val textView = WebView(context)
        textView.loadUrl(args as String)
        return object : PlatformView {
            override fun getView(): View {
                return textView
            }

            override fun dispose() {}
        }
    }
}
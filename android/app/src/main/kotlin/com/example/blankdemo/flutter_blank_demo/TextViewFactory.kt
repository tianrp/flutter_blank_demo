package com.example.blankdemo.flutter_blank_demo

import android.content.Context
import android.graphics.Color
import android.view.View
import android.widget.TextView
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

class TextViewFactory(val hash : String?) : PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    override fun create(context: Context, id: Int, args: Any?): PlatformView {
        val textView = TextView(context)
        textView.text = "${args as String}  engine hash:${hash}"
        textView.setTextColor(Color.RED)
        textView.textSize = 20f
        return object : PlatformView {
            override fun getView(): View {
                return textView
            }

            override fun dispose() {}
        }
    }
}
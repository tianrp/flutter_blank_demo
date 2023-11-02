package com.example.blankdemo.flutter_blank_demo

import android.app.Activity
import android.content.Intent
import android.os.Bundle
import android.os.Handler

class MainActivity : Activity() {
    companion object {
        private const val KEY_PAGE = "page_name"
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        Handler().postDelayed({
            MyApplication.init(this)
            val intent = Intent(this,MyFlutterActivity::class.java)
            startActivity(intent)
            finish()
        },1000)
    }
}
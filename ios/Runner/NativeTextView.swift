//
//  NativeTextView.swift
//  Runner
//
//  Created by renpengtian on 2023/10/20.
//

import Foundation
import SwiftUI
struct NativeTextView: UIViewRepresentable {
    var text: String

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.delegate = context.coordinator
        return textView
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
        uiView.textColor = .red
        uiView.textAlignment = .center
        uiView.font = UIFont.systemFont(ofSize: CGFloat(40))
//        uiView.backgroundColor = UIColor.blue
    }

    class Coordinator: NSObject, UITextViewDelegate {
        var parent: NativeTextView

        init(_ parent: NativeTextView) {
            self.parent = parent
        }

        func textViewDidChange(_ textView: UITextView) {
            self.parent.text = textView.text
        }
    }
}


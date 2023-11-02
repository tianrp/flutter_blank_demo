//
//  NativeLabelPlatformView.swift
//  Runner
//
//  Created by renpengtian on 2023/10/20.
//

import Foundation
import Flutter
import SwiftUI

class NativeLabelPlatformView: NSObject, FlutterPlatformView {
    private var labelView: UIView

    init(frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?, binaryMessenger messenger: FlutterBinaryMessenger) {
        let labelViewHostingController = UIHostingController(rootView: NativeTextView(text: args as? String ?? "PlatformView"))
        labelView = labelViewHostingController.view
        labelView.frame = frame
    }

    func view() -> UIView {
        return labelView
    }
}

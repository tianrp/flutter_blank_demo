//
//  NativeLabelPlatformViewFactory.swift
//  Runner
//
//  Created by renpengtian on 2023/10/20.
//

import Foundation
import Flutter

class NativeLabelPlatformViewFactory: NSObject, FlutterPlatformViewFactory {
    private var messenger: FlutterBinaryMessenger

    init(messenger: FlutterBinaryMessenger) {
        self.messenger = messenger
    }

    func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {
        return NativeLabelPlatformView(frame: frame, viewIdentifier: viewId, arguments: args, binaryMessenger: messenger)
    }
}

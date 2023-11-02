//
//  EngineGroupManager.swift
//  Runner
//
//  Created by renpengtian on 2023/10/20.
//

import Foundation
class EngineGroupManager {
    static let shared = EngineGroupManager()

    private let engineGroup: FlutterEngineGroup
    private var cacheEngine: FlutterEngine?

    private init() {
        engineGroup = FlutterEngineGroup(name: "my_engine_group", project: nil)
    }
    
    func createEngine() -> FlutterEngine {
        return engineGroup.makeEngine(withEntrypoint: nil, libraryURI: nil)
    }
}

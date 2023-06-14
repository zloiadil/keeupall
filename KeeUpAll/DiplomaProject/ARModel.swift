//
//  ARModel.swift
//  DiplomaProject
//
//  Created by РАЙЫМБЕК on 28.05.2023.
//

import Foundation
import RealityKit
import ARKit
import Combine

struct ARModel {
    private(set) var arView : ARView
    
    init() {
        arView = ARView(frame: .zero, cameraMode: .ar, automaticallyConfigureSession: true)
        
        guard ARBodyTrackingConfiguration.isSupported else {
            fatalError("This feature is only supported on devices with an A12 chip")
        }
        
        let configuration = ARBodyTrackingConfiguration()
        arView.session.run(configuration)
    }
    
}

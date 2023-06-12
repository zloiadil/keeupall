//
//  ARClothView.swift
//  DiplomaProject
//
//  Created by РАЙЫМБЕК on 28.05.2023.
//

import SwiftUI
import RealityKit
import ARKit
import Combine

struct ARViewContainer: UIViewRepresentable {
    typealias UIViewType = ARView
    
    @Binding var product: ActivityResourcesItem?
    
    let characterAnchor = AnchorEntity()
    
    func makeUIView(context: Context) -> ARView {
        //        arViewModel.startSessionDelegate(clothPath: product!.resourseModel)
        //        return arViewModel.arView
        
        let arView = ARView(frame: .zero, cameraMode: .ar, automaticallyConfigureSession: true)
        arView.session.delegate = context.coordinator
        context.coordinator.loadBodyModelAsync()
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        let configuration = ARWorldTrackingConfiguration()
        uiView.session.run(configuration)
        uiView.scene.addAnchor(characterAnchor)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self, anchor: characterAnchor)
    }
    
    class Coordinator: NSObject, ARSessionDelegate {
        var body: BodyTrackedEntity?
        var cloth: BodyTrackedEntity?
        var characterAnchor: AnchorEntity
        
        init(_ control: ARViewContainer, anchor: AnchorEntity) {
            self.characterAnchor = anchor
            super.init()
        }
        
        func session(_ session: ARSession, didUpdate anchors: [ARAnchor]) {
            for anchor in anchors {
                guard let bodyAnchor = anchor as? ARBodyAnchor else { continue }
                
                let bodyPosition = simd_make_float3(bodyAnchor.transform.columns.3)
                characterAnchor.position = bodyPosition
                characterAnchor.orientation = Transform(matrix: bodyAnchor.transform).rotation
                
                if let body = body, body.parent == nil {
                    characterAnchor.addChild(body)
                }
            }
        }
        
        func loadBodyModelAsync() {
            var cancellable: AnyCancellable? = nil
            cancellable = Entity.loadBodyTrackedAsync(named: "character/body_startup").sink(
                receiveCompletion: { completion in
                    if case let .failure(error) = completion {
                        print("Error: Unable to load model: \(error.localizedDescription)")
                    }
                    cancellable?.cancel()
                }, receiveValue: { (character: Entity) in
                    if let character = character as? BodyTrackedEntity {
                        character.scale = [0.21, 0.21, 0.21]
                        
//                        var characterComponent: ModelComponent = character.components[ModelComponent]!.self
//                        characterComponent.materials = [OcclusionMaterial()]
//                        character.components.set(characterComponent)
                        
                        self.body = character
                        cancellable?.cancel()
                        print("model loaded")
                        self.characterAnchor.addChild(character)
                    } else {
                        print("Error: Unable to load model as BodyTrackedEntity")
                    }
                })
        }
    }
}

//
//  ARViewModel.swift
//  DiplomaProject
//
//  Created by РАЙЫМБЕК on 28.05.2023.
//

import Foundation
import RealityKit
import ARKit
import Combine

class ARViewModel: UIViewController, ObservableObject,  ARSessionDelegate {
    @Published private var model : ARModel = ARModel()
    let modelScale: SIMD3<Float> = [0.21, 0.21, 0.21]

    var body: BodyTrackedEntity?
    var cloth: BodyTrackedEntity?
    let characterAnchor = AnchorEntity()
    
    var arView : ARView {
        model.arView
    }
    
    func startSessionDelegate(clothPath: String) {
        model.arView.session.delegate = self
                
        body = try! Entity.loadBodyTracked(named: "character/body_norm")
        cloth = try! Entity.loadBodyTracked(named: clothPath)
        
        
        if let body = body as? BodyTrackedEntity {
            body.scale = modelScale
            var bodyComponent: ModelComponent = body.components[ModelComponent]!.self
            bodyComponent.materials = [OcclusionMaterial()]
            body.components.set(bodyComponent)
            characterAnchor.addChild(body)
        }

        if let cloth = cloth as? BodyTrackedEntity {
            cloth.scale = modelScale
            characterAnchor.addChild(cloth)
        }

        if let cloth = cloth, cloth.parent == nil {
            characterAnchor.addChild(cloth)
        }

        if let body = body, body.parent == nil {
            characterAnchor.addChild(body)
        }
        
//        self.loadBodyModelAsync()
//        self.loadClothModelAsync(clothPath: clothPath)
        
        model.arView.scene.addAnchor(characterAnchor)
    }
    
    func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
        for anchor in anchors {
            guard let bodyAnchor = anchor as? ARBodyAnchor else { continue }

            // Update the position of the character anchor's position.
            let bodyPosition = simd_make_float3(bodyAnchor.transform.columns.3)
            characterAnchor.position = bodyPosition
            // Also copy over the rotation of the body anchor, because the skeleton's pose
            // in the world is relative to the body anchor's rotation.
            characterAnchor.orientation = Transform(matrix: bodyAnchor.transform).rotation

            if let body = body {
                characterAnchor.addChild(body)
            }
            
            if let cloth = cloth {
                characterAnchor.addChild(cloth)
            }
        }
    }
    
    func loadBodyModelAsync() {
        var cancellable: AnyCancellable? = nil
        cancellable = Entity.loadBodyTrackedAsync(named: "character/body_norm").sink(
            receiveCompletion: { completion in
                if case let .failure(error) = completion {
                    print("Error: Unable to load model: \(error.localizedDescription)")
                }
                cancellable?.cancel()
        }, receiveValue: { (character: Entity) in
            if let character = character as? BodyTrackedEntity {
                // Scale the character to human size
                character.scale = [0.21, 0.21, 0.21]

                var characterComponent: ModelComponent = character.components[ModelComponent]!.self
                characterComponent.materials = [OcclusionMaterial()]
                character.components.set(characterComponent)
                self.body = character
                                cancellable?.cancel()
                            } else {
                                print("Error: Unable to load model as BodyTrackedEntity")
                            }
                        })
                    }
                    
                    func loadClothModelAsync(clothPath: String) {
                        var cancellable: AnyCancellable? = nil
                        cancellable = Entity.loadBodyTrackedAsync(named: clothPath).sink(
                            receiveCompletion: { completion in
                                if case let .failure(error) = completion {
                                    print("Error: Unable to load model: \(error.localizedDescription)")
                                }
                                cancellable?.cancel()
                        }, receiveValue: { (character: Entity) in
                            if let character = character as? BodyTrackedEntity {
                                character.scale = [0.21, 0.21, 0.21]
                                self.cloth = character
                                cancellable?.cancel()
                            } else {
                                print("Error: Unable to load model as BodyTrackedEntity")
                            }
                        })
                    }
                }

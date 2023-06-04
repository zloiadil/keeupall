//
//  ARClothView.swift
//  DiplomaProject
//
//  Created by РАЙЫМБЕК on 28.05.2023.
//

import SwiftUI
import RealityKit

struct ARViewContainer: UIViewRepresentable {
    var arViewModel: ARViewModel
    @Binding var product: ActivityResourcesItem?
    
    func makeUIView(context: Context) -> ARView {
        arViewModel.startSessionDelegate(clothPath: product!.resourseModel)
        return arViewModel.arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
}

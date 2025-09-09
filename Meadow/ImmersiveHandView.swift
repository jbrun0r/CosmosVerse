//
//  ImmersiveHandView.swift
//  Custom Meadow Immersive Environment
//
//  Created by Joao Roberto Fernandes Magalhaes on 06/06/25.
//  Copyright © 2025 Apple. All rights reserved.
//

//import SwiftUI
//import RealityKit
//import RealityKitContent
//import ARKit
//
//struct ImmersiveHandView: View {
//    var body: some View {
//        RealityView { content in
//            // Mãos com tracking
//            let leftHandAnchor = AnchorEntity()
//            leftHandAnchor.components.set(HandTrackingProviderComponent(handedness: .left))
//            let rightHandAnchor = AnchorEntity()
//            rightHandAnchor.components.set(HandTrackingProviderComponent(handedness: .right))
//
//            Task {
//                do {
//                    let handModel = try await Entity(named: "AstronautHand", in: realityKitContentBundle)
//
//                    let leftHand = handModel.clone(recursive: true)
//                    leftHand.scale = [0.001, 0.001, 0.001]
//                    leftHand.transform.rotation = simd_quatf(angle: .pi, axis: [0, 1, 0])
//
//                    let rightHand = handModel.clone(recursive: true)
//                    rightHand.scale = [0.001, 0.001, 0.001]
//
//                    leftHandAnchor.addChild(leftHand)
//                    rightHandAnchor.addChild(rightHand)
//
//                    content.add(leftHandAnchor)
//                    content.add(rightHandAnchor)
//
//                } catch {
//                    print("Erro ao carregar modelo: \(error)")
//                }
//            }
//
//            let testAnchor = AnchorEntity(world: [0, 1, -0.5])
//            Task {
//                do {
//                    let testModel = try await Entity(named: "AstronautHand", in: realityKitContentBundle)
//                    testModel.scale = [0.001, 0.001, 0.001]
//                    testAnchor.addChild(testModel)
//                    content.add(testAnchor)
//                } catch {
//                    print("Erro ao carregar modelo de teste: \(error)")
//                }
//            }
//        }
//    }
//}

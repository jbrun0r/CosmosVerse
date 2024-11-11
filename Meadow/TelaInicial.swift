//
//  TelaInicial.swift
//  Custom Meadow Immersive Environment
//
//  Created by Joao Roberto Fernandes Magalhaes on 08/11/24.
//  Copyright © 2024 Apple. All rights reserved.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct TelaInicial: View {

    var loader: EnvironmentLoader

    let root = Entity()
    let portalPlane = ModelEntity(
        mesh: .generatePlane(width: 1.0, depth: 1.0),
        materials: [PortalMaterial()]
    )

    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissWindow) var dismissWindow

    var body: some View {
        ZStack {
            GeometryReader3D { geometry in
                RealityView { content in
                    // Loading the environment and putting it in a portal
                    let world = Entity()
                    world.components.set(WorldComponent())
                    world.addChild(try! await loader.getEntity())
                    let scale: Float = 0.2
                    world.scale *= scale
                    world.position.y -= scale * 1.5
                    root.addChild(world)
                    content.add(root)
                    portalPlane.components.set(PortalComponent(target: world))
                    root.addChild(portalPlane)
                } update: { content in
                    // Updating the size of the portal when the window is resized
                    let size = content.convert(geometry.size, from: .local, to: .scene)
                    portalPlane.model?.mesh = .generatePlane(
                        width: size.x,
                        height: size.y,
                        cornerRadius: 0.1
                    )
                }.frame(depth: 0.4)
            }.frame(depth: 0.4)
            VStack {
                Text("CosmoVerse")
                    .bold()
                    .font(.extraLargeTitle)
                Text("Aprenda sobre sua galaxia de uma maneira imersiva")
                    .font(.system(size: 24))
                Button("Start") {
                    Task {
                        await openImmersiveSpace(id: "ImmersiveSpace")
                        dismissWindow()
                    }
                }.glassBackgroundEffect()
            }
        }
    }
}

#Preview {
    TelaInicial(loader: .init())
}

//
//  SwiftUIView.swift
//  
//
//  Created by Nathan Lawrence on 9/13/20.
//

import SwiftUI
import Nuke

struct NukedImage: View {
    internal init(url: URL, placeholder: PlatformImage? = nil) {
        self.url = url
        self.placeholder = placeholder ?? .init()
    }

    @Environment(\.nukedImageProvider) private var provider

    public let url: URL
    public let placeholder: PlatformImage

    @State private var loadedImage: PlatformImage? = nil

    var useImage: PlatformImage {
        loadedImage ?? placeholder
    }

    var body: some View {
        SwiftUI.Image(platformImage: useImage)
            .resizable()
            .onReceive(provider.imagePublisher(for: url)
                        .replaceError(with: PlatformImage())) { value in
                self.loadedImage = value
            }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        NukedImage(url: URL(string: "https://picsum.photos/400")!)
    }
}

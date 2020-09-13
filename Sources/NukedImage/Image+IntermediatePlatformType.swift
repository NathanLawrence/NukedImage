//
//  File.swift
//  
//
//  Created by Nathan Lawrence on 9/13/20.
//

import Foundation
import SwiftUI
import Nuke
#if !os(macOS)
import UIKit
#else
import AppKit
#endif

internal extension SwiftUI.Image {
    #if !os(macOS)
    init(platformImage: PlatformImage) {
        self.init(uiImage: platformImage)
    }
    #else
    init(platformImage: PlatformImage) {
        self.init(nsImage: platformImage)
    }
    #endif
}

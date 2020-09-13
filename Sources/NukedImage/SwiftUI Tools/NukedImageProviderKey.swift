//
//  NukedImageProviderKey.swift
//  
//
//  Created by Nathan Lawrence on 9/13/20.
//

import Foundation
import SwiftUI

struct NukedImageProviderEnvironmentKey: EnvironmentKey {
    typealias value = NukedImageProvider
    static var defaultValue = NukedImageProvider()
}

extension EnvironmentValues {
    var nukedImageProvider: NukedImageProvider {
        get {
            self[NukedImageProviderEnvironmentKey.self]
        }
        set {
            self[NukedImageProviderEnvironmentKey.self] = newValue
        }
    }
}

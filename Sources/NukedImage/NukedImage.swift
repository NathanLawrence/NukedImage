//
//  SwiftUIView.swift
//  
//
//  Created by Nathan Lawrence on 9/13/20.
//

import SwiftUI

struct NukedImage: View {
    public let url: URL

    var body: some View {
        Text("Hello, World!")
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        NukedImage(url: URL(string: "https://picsum.photos/400")!)
    }
}

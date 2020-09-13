//
//  File.swift
//  
//
//  Created by Nathan Lawrence on 9/13/20.
//

import Foundation
import Combine
import Nuke

class NukedImageProvider {
    private let pipeline: ImagePipeline
    private var subjects = [URL: PassthroughSubject<PlatformImage, ImagePipeline.Error>]()

    init(pipeline: ImagePipeline? = nil) {
        self.pipeline = pipeline ?? ImagePipeline.shared
    }

    func imagePublisher(for url: URL) {
        pipeline.loadImage(with: url) { _,_,_ in
            // Progress handler code
        } completion: { result in
            switch result {
            case .success(let imageResponse):
                guard let url = imageResponse.urlResponse?.url,
                      let subject = self.subjects[url]
                      else { return }
                subject.send(imageResponse.image)
                subject.send(completion: .finished)
                return
            default:
                return
            }
        }
    }
}

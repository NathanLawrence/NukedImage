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

    func imagePublisher(for url: URL) -> PassthroughSubject<PlatformImage, ImagePipeline.Error>{
        if let subject = subjects[url] {
            return subject
        }

        let subject = PassthroughSubject<PlatformImage, ImagePipeline.Error>()
        subjects[url] = subject

        pipeline.loadImage(with: url) { _,_,_ in
            // Progress handler code
        } completion: { [subject] result in
            switch result {
            case .success(let imageResponse):
                subject.send(imageResponse.image)
                subject.send(completion: .finished)
                self.subjects.removeValue(forKey: url)
                return
            default:
                return
            }
        }

        return subject
    }
}

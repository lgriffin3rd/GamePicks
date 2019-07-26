//
//  ImageCollection.swift
//  GamePicks
//
//  Created by Lewis Griffin on 7/23/19.
//  Copyright © 2019 Lewis Griffin. All rights reserved.
//

import SwiftUI
import Combine

class ImagePicks: BindableObject {
    let didChange = PassthroughSubject<Void, Never>()
    
    var name = "Name" {
        didSet {
            didChange.send()
        }
    }
    
    var collectedImages: PickedImages = PickedImages(id: nil, pictureName: nil, image: nil) {
        didSet {
            didChange.send()
        }
    }
    
    var presented = false {
        didSet {
            didChange.send()
        }
    }
    
    var hasImages = false {
        didSet {
            didChange.send()
        }
    }
}

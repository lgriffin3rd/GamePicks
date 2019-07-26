//
//  PreviewView.swift
//  GamePicks
//
//  Created by Lewis Griffin on 7/24/19.
//  Copyright © 2019 Lewis Griffin. All rights reserved.
//

import SwiftUI

struct PreviewView : View {
    @ObjectBinding var imagePicks = ImagePicks()
    
    var body: some View {
        VStack {
            if imagePicks.hasImages {
                Text("SwiftUI View Below - Showing Preview").color(.blue).animation(.basic(duration: 1.5, curve: .easeIn))
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    if imagePicks.hasImages {
                        ForEach(imagePicks.collectedImages.image!.identified(by: \.self)) { image in
                            ImageCardView(image: Image(uiImage: image)).padding(.leading, 10)
                        }
                    }
                }
            }
        }
    }
}

#if DEBUG
struct PreviewView_Previews : PreviewProvider {
    static var previews: some View {
        PreviewView()
        .environment(\.colorScheme, .dark)
    }
}
#endif

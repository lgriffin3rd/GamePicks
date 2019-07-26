//
//  ImagePickerview.swift
//  GamePicks
//
//  Created by Lewis Griffin on 7/24/19.
//  Copyright © 2019 Lewis Griffin. All rights reserved.
//

import SwiftUI

struct ImagePickerview : View {
    @State var shouldPresent = false
    @State var image: Image
    
    var body: some View {
        VStack {
            ZStack {
                Button(action: {
                    self.shouldPresent.toggle()
                }) {
                    Text("Show Image Picker")
                }
                
                image.resizable().frame(width: 200, height: 200, alignment: .center)
                if shouldPresent {
                    ImagePicker(isPresented: $shouldPresent, selectedImage: $image)
                }
            }
        }
    }
}

#if DEBUG
struct ImagePickerview_Previews : PreviewProvider {
    static var previews: some View {
        ImagePickerview(image: Image("Apple"))
    }
}
#endif

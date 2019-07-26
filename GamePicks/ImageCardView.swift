//
//  ImageCardView.swift
//  GamePicks
//
//  Created by Lewis Griffin on 7/23/19.
//  Copyright © 2019 Lewis Griffin. All rights reserved.
//

import SwiftUI

struct ImageCardView : View {
    var image: Image
    var body: some View {
        VStack {
            image.resizable().clipShape(Circle()).overlay(Circle().stroke(Color.black, lineWidth: 5).shadow(radius: 5)).frame(width: 200, height: 200, alignment: .center)
        }
    }
}

#if DEBUG
struct ImageCardView_Previews : PreviewProvider {
    static var previews: some View {
        ImageCardView(image: Image("Apple"))
    }
}
#endif

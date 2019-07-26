//
//  ContentView.swift
//  GamePicks
//
//  Created by Lewis Griffin on 7/23/19.
//  Copyright © 2019 Lewis Griffin. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    @State private var presentImagePicker = false
    @ObjectBinding var imagePicks = ImagePicks()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Combing ViewController and SwifUI views").padding(.top, 20)
                NavigationLink(destination: ViewControllerWrapper(controller: PickImageViewController(collection: imagePicks))) {
                    Text("Pick Image").color(Color.black)
                }.padding().background(Color.orange).border(Color.orange, width: 1).cornerRadius(5).padding(.top, 20)
                
                if imagePicks.hasImages {
                    Text("Selected Images").padding(.top, 20)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            
                            ForEach(imagePicks.collectedImages.image!.identified(by: \.self)) { image in
                                ImageCardView(image: Image(uiImage: image))
                            }
                            
                        }
                    }.padding(.top, 20)
                }
                
                Spacer()
            }
            
            .navigationBarTitle(Text("Image Collector"), displayMode: .automatic)
        }
    }
    
    func unwrapImages(image: UIImage?) -> UIImage {
        guard let img = image else { return UIImage()  }
        return img
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
        .environment(\.colorScheme, .light)
    }
}
#endif

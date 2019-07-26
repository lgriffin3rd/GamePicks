//
//  ImagePicker.swift
//  builderexamples
//
//  Created by Lewis Griffin on 7/17/19.
//  Copyright © 2019 Lewis Griffin. All rights reserved.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var isPresented: Bool
    @Binding var selectedImage: Image
    
    func makeCoordinator() -> ImagePicker.Coordinator {
        return Coordinator($isPresented, selectedImage: $selectedImage)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.allowsEditing = false
        picker.delegate = context.coordinator
        
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
        print("Does this get called")
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        @Binding var isPresented: Bool
        @Binding var selectedImage: Image
        
        init(_ isPresented: Binding<Bool>, selectedImage: Binding<Image>) {
            $isPresented = isPresented
            $selectedImage = selectedImage
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            $isPresented.value = false
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
            
            
            DispatchQueue.main.async {
                self.selectedImage = Image(uiImage: image)
                self.isPresented.toggle()
            }
        }
    }
}

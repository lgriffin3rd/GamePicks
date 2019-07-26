//
//  CameraControler.swift
//  placematch
//
//  Created by Lewis Griffin on 5/30/19.
//  Copyright © 2019 Lewis Griffin. All rights reserved.
//

import UIKit

class CameraController: NSObject {
    static let shared = CameraController()
    fileprivate var currentVC: UIViewController?
    
    var imagePickedBlock: ((UIImage) -> Void)?
    var captureMode: UIImagePickerController.CameraCaptureMode?
    var flash: UIImagePickerController.CameraFlashMode?
    var cameraSource: UIImagePickerController.CameraDevice?
    var imagePicker: UIImagePickerController? = nil
    
    convenience init(displayingVC: UIViewController, captureMode: UIImagePickerController.CameraCaptureMode = .photo, flashMode: UIImagePickerController.CameraFlashMode = .off, cameraLense: UIImagePickerController.CameraDevice = .rear) {
        self.init()
        self.currentVC = displayingVC
        self.captureMode = captureMode
        self.flash = flashMode
        self.cameraSource = cameraLense
    }
    
    func showImageSourceSelectoion(onVC: UIViewController) {
        self.currentVC = onVC
        guard let vc = self.currentVC else { return }
        let controller = UIAlertController(title: "Photo", message: "Select where you wamt to grab phoo from.", preferredStyle: .actionSheet)
        controller.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action) in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                self.imagePicker = UIImagePickerController()
                guard let picker = self.imagePicker, let source = self.cameraSource, let flash = self.flash, let mode = self.captureMode  else {
                    return
                }
                picker.cameraDevice = source
                picker.cameraFlashMode = flash
                picker.cameraCaptureMode = mode
                picker.allowsEditing = false
                
                picker.sourceType = .camera
                picker.delegate = self
                vc.present(picker, animated: true, completion: nil)
            }
        }))
        
        controller.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action) in
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                self.imagePicker = UIImagePickerController()
                guard let picker = self.imagePicker else { return }
                picker.allowsEditing = false
                picker.delegate = self
//                picker.delegate = self.currentVC as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
                
                vc.present(picker, animated: true, completion: nil)
            }
        }))
        
        controller.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
        
        vc.present(controller, animated: true, completion: nil)
    }
    
}

extension CameraController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        currentVC?.dismiss(animated: true, completion: nil)
        
        self.imagePicker = nil
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            self.currentVC?.dismiss(animated: true, completion: nil)
            return
        }
        
            self.imagePickedBlock?(image)
            self.currentVC?.dismiss(animated: true, completion: {
        })
        
        self.imagePicker = nil
    }
}

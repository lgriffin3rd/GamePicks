//
//  ViewControllerWrapper.swift
//  GamePicks
//
//  Created by Lewis Griffin on 7/23/19.
//  Copyright © 2019 Lewis Griffin. All rights reserved.
//

import SwiftUI


struct ViewControllerWrapper: UIViewControllerRepresentable {
    let controller: UIViewController?
    
    func makeUIViewController(context: Context) -> UIViewController {
        guard let controller = controller else { return UIViewController() }
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<ViewControllerWrapper>) {
        
    }
}

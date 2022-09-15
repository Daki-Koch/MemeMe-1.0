//
//  Activity.swift
//  MemeMe 1.0
//
//  Created by David Koch on 06.09.22.
//

import SwiftUI

struct Activity: UIViewControllerRepresentable{
    @Environment(\.presentationMode) private var presentationMode
    var memedImage: UIImage
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let activityViewController = UIActivityViewController(activityItems: [memedImage], applicationActivities: nil)
        
        return activityViewController
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
        
    }
    
    
}

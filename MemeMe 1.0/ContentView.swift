//
//  ContentView.swift
//  MemeMe 1.0
//
//  Created by David Koch on 05.09.22.
//

import Foundation
import SwiftUI

struct ContentView: View {
    
    @State var imageSelected = false
    @State private var showActivitySheet = false
    @State private var showLibrarySheet = false
    @State private var showCameraSheet = false
    
    @State var meme = Meme(topText: "TOP", botText: "BOTTOM", originalImage: UIImage(), memedImage: UIImage())
    
    var body: some View {
        NavigationView{
            MemeView(meme: $meme).toolbar {
                ToolbarItem(placement: .navigationBarTrailing, content: {
                    Button("Cancel", action:{
                        imageSelected = false
                        meme.originalImage = UIImage()
                        meme.topText = "TOP"
                        meme.botText = "BOTTOM"
                    })
                })
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        save()
                    } label: {
                        Image(systemName: "square.and.arrow.up")
                    }.sheet(isPresented: $showActivitySheet) {
                        Activity(memedImage: meme.memedImage)
                        
                        
                    }.disabled(!imageSelected)
                }
                ToolbarItemGroup(placement: .bottomBar) {
                    Spacer()
                    Button {
                        showCameraSheet = true
                    } label: {
                        Image(systemName: "camera.fill")
                    }.sheet(isPresented: $showCameraSheet) {
                        ImagePicker(sourceType: .camera, selectedImage: $meme.originalImage)
                    }.disabled(!UIImagePickerController.isSourceTypeAvailable(.camera))
                    Spacer()
                    Button("Album", action:{
                        showLibrarySheet = true
                    }).sheet(isPresented: $showLibrarySheet, onDismiss: {
                        if meme.originalImage.size.width != 0 {
                            imageSelected = true
                        }
                    }, content: {
                        ImagePicker(sourceType: .photoLibrary, selectedImage: $meme.originalImage)
                    })
                    Spacer()
                    
                    
                }
            }
        }
        
        
    }
    
    
    func save() {
        
        let image = ContentView().generateMemedImage()
        //meme.memedImage = ContentView().drawingGroup().generateMemedImage()
        //meme.memedImage = MemeView(meme: $meme).body.generateMemedImage()
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        //showActivitySheet = true
        
    }
    
    
}



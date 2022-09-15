//
//  MemeModel.swift
//  MemeMe 1.0
//

//  Created by David Koch on 05.09.22.
//

import Foundation
import SwiftUI

struct MemeView: View{
    

    @Binding var meme: Meme
    @State var textPlaceholder = ""
    var body: some View{
        ZStack{
            Image(uiImage: meme.originalImage).resizable().scaledToFit()
            
            VStack{
                TextField(self.$textPlaceholder.wrappedValue, text: $meme.topText, onEditingChanged: { editing in
                    if editing {
                        meme.topText = ""
                    }
                }, onCommit: {
                    if meme.topText == ""{
                        meme.topText = "TOP"
                    }
                    
                }).multilineTextAlignment(.center).textInputAutocapitalization(.characters).foregroundColor(.white).font(.custom("HelveticaNeue-CondensedBlack", size:  40)).shadow(color: .black, radius: 1).offset(y: CGFloat(SafeAreaRegions.keyboard.rawValue)).padding()
                
                Spacer()
                TextField(self.$textPlaceholder.wrappedValue, text: $meme.botText, onEditingChanged: { editing in
                    if editing {
                        meme.botText = ""
                    }
                }, onCommit: {
                    if meme.botText == ""{
                        meme.botText = "BOTTOM"
                    }
                    
                }).multilineTextAlignment(.center).textInputAutocapitalization(.characters).foregroundColor(.white).font(.custom("HelveticaNeue-CondensedBlack", size:  40)).shadow(color: .black, radius: 1).offset(y: CGFloat(SafeAreaRegions.keyboard.rawValue)).padding()
                
            }
            
        }
    }

    
}

struct Meme {
    var topText: String
    var botText: String
    var originalImage: UIImage
    var memedImage: UIImage
}

extension View{
    func generateMemedImage() -> UIImage{
        
        
        
        let controller = UIHostingController(rootView: self.ignoresSafeArea(.container))
        
        let view = controller.view
        let targetSize = controller.view.intrinsicContentSize
        
        view?.bounds = CGRect(origin: .zero, size: targetSize)
        view?.backgroundColor = .clear
        print(targetSize)
        let renderer = UIGraphicsImageRenderer(size: targetSize)
        
        
        return renderer.image{ _ in
            
            view?.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
        }
        
    }
}

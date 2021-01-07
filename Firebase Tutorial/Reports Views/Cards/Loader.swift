//
//  Loader.swift
//  Firebase Tutorial
//
//  Created by Kavsoft on 05/01/20.
//  Copyright © 2020 Kavsoft. All rights reserved.
//

import SwiftUI

struct Loader : UIViewRepresentable {
    
    func makeUIView(context: UIViewRepresentableContext<Loader>) -> UIActivityIndicatorView {
        
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.startAnimating()
        return indicator
        
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<Loader>) {
        
        
    }
}

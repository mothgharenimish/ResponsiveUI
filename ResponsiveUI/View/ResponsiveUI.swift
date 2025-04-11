//
//  ResponsiveUI.swift
//  ResponsiveUI
//
//  Created by Nimish Mothghare on 10/04/25.
//

import SwiftUI

struct ResponsiveUI<Content : View>: View {
    
    var content: (Properties) -> Content
    var body: some View {
        
        GeometryReader { proxy in
            
            let size = proxy.size
            let isLandscape = (size.width > size.height)
            let isiPad = UIDevice.current.userInterfaceIdiom == .pad
            
            
            content(Properties(isLandscape: isLandscape, isiPad: isiPad, size: size))
                .frame(width: size.width,height: size.height,alignment: .center)
                .onAppear() {
                    
                    updateFraction(fraction: isLandscape ? 3.0 : 0.5)
                }
                .onChange(of: isLandscape) { newValue in 
                    
                    updateFraction(fraction: newValue ? 3.0 : 0.5)
                }
            
            
        }
    }
    
    func updateFraction(fraction : Double) {
        
        NotificationCenter.default.post(name: NSNotification.Name("UPDATEFRACTION"), object: nil, userInfo: [
            
            "fraction" : fraction
        ])
    }
}


struct Properties {
    
    var isLandscape : Bool
    var isiPad : Bool
    var size : CGSize
}

//
//  SideBar.swift
//  ResponsiveUI
//
//  Created by Nimish Mothghare on 10/04/25.
//

import SwiftUI

struct SideBar: View {
    @Binding var currentMenu : String
    var prop : Properties
    var body: some View {
        
        ScrollView(.vertical,showsIndicators: false) {
            
            VStack(alignment: .leading,spacing: 20) {
                
                Image("icons8-48-80")
                
                SideBarButton(icon: "tray.and.arrow.up.fill", title: "Inbox")
                    .padding(.top,40)
                SideBarButton(icon: "figure.baseball", title: "Sent")
                SideBarButton(icon: "eraser.fill", title: "Draft")
                SideBarButton(icon: "delete.backward.fill", title: "Deleted")
                SideBarButton(icon: "person.crop.circle.fill.badge.checkmark", title: "Account")
            }
            .padding()
            .padding(.top)
        }
//        .frame(width: prop.size.width / 2.3 > 300 ? 300 : prop.size.width / 2.5)
        .padding(.leading,10)
        .frame(width: (prop.isLandscape ? prop.size.width : prop.size.height) / 4 > 300
               ? 300 : (prop.isLandscape ? prop.size.width : prop.size.height) / 4)
        .background(.mint)
        .ignoresSafeArea()
    }
    
    @ViewBuilder
    func SideBarButton(icon : String,title : String) -> some View {
        
        Button {
            
            currentMenu =
            title
            
        } label: {
            VStack {
                
                HStack(spacing: 10) {
                    
                    Image(systemName: "chevron.right")
                        .font(.caption)
                        .foregroundColor(.black)
                        .opacity(currentMenu == title ? 1 : 0)
                    
                    
                    Image(systemName: icon)
                        .font(.callout)
                        .foregroundColor(currentMenu == title ? .blue : .gray)
                    
                    Text(title)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .foregroundColor(currentMenu == title ? .white : .gray)
                    
                }
                
                .frame(maxWidth: .infinity,alignment: .leading)
                
                Divider()
            }
        }
        
    }
}

#Preview {
    ContentView()
}



struct PaddingModifier : ViewModifier {
    
    @Binding var padding : CGFloat
    var prop : Properties
    
    func body(content: Content) -> some View {
        
        content
            .overlay {
                
                GeometryReader { proxy in
                    
                    Color.clear
                        .preference(key: PaddingKey.self, value: proxy.frame(in: .global))
                        .onPreferenceChange(PaddingKey.self) { value in
                            self.padding = -(value.minX / 3.3)
                            
                            
                        }
                    
                    
                }
            }
    }
        
}



struct PaddingKey : PreferenceKey {
    
    static var defaultValue : CGRect = .zero
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        
        value = nextValue()
    }
}

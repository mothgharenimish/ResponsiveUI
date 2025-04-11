//
//  Home.swift
//  ResponsiveUI
//
//  Created by Nimish Mothghare on 10/04/25.
//

import SwiftUI

struct Home: View {
    @State var curentMenu: String = "Inbox"
    @State var showMenu : Bool = false
    @State var excessPadding : CGFloat = 0
    var body: some View {
        ResponsiveUI { prop in
            HStack(spacing: 0) {
                
                if prop.isLandscape {
                    SideBar(currentMenu: $curentMenu, prop: prop)

                    
                }
                
                NavigationView {
                    MainView(prop: prop)
                        .navigationBarHidden(true)
                        .padding(.leading,excessPadding)
                }
                
                .modifier(PaddingModifier(padding: $excessPadding, prop: prop))
                
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .overlay {
                
                ZStack(alignment: .leading) {
                    
                    if !prop.isLandscape {
                        
                        Color.black
                            .opacity(showMenu ? 0.25 : 0)
                            .ignoresSafeArea()
                            .onTapGesture {
                                withAnimation{showMenu.toggle()}
                            }
                        
                        
                        SideBar(currentMenu: $curentMenu, prop: prop)
                            .offset(x: showMenu ? 0 : -300)

                    }
                    
                }
            }
            
            
        }
        
        .ignoresSafeArea(.container,edges: .leading)
    }
    
    
    //MARK: - MainView
    
    @ViewBuilder
    func MainView(prop: Properties) -> some View {
        
        VStack(spacing: 0){
            
            HStack(spacing: 12) {
                
                if !prop.isLandscape {
                    Button {
                        
                        withAnimation{showMenu.toggle()}
                        
                    }
                    
                    label: {
                        
                        Image(systemName: "line.3.horizontal")
                            .font(.title3)
                            .foregroundColor(.black)
                    }
                }
                
                TextField("Search", text: .constant(""))
                
                Image(systemName: "magnifyingglass")
            }
            .padding(.horizontal)
            .padding(.vertical,12)
            
            .background(
                RoundedRectangle(cornerRadius: 6, style: .continuous)
                    .fill(.white)
                    
            )
            
            ScrollView(.vertical,showsIndicators: false) {
                
                VStack(spacing: 15) {
                    
                    ForEach(users) { user in
                        
                        NavigationLink {
                            
                            DetailsView(user: user, prop: prop)
                            
                        } label: {
                            
                            UsersCardView(user: user, prop: prop)
                        }
                        
                    }
                }
                .padding(.top,50)
            }
        }
        .padding()
        .frame(maxHeight: .infinity,alignment: .top)
        .background(
            
            Color(.red)
                .ignoresSafeArea()
        )
    }
    
    
    //MARK: -CardView
    @ViewBuilder
    func UsersCardView(user: Users,prop: Properties) -> some View {
        
        VStack(alignment: .leading, spacing: 12) {
             
            HStack(spacing: 10) {

                Image(user.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 40,height: 40)
                
                VStack(alignment: .leading,spacing: 8) {
                    
                    
                    Text(user.name)
                        .fontWeight(.bold)
                    
                    Text(user.title)
                        .font(.caption)
                    }
                .frame(maxWidth: .infinity,alignment: .leading)
                
                Text("Now")
                    .font(.caption)
                    .foregroundColor(.gray)
                
                
                
                
            }
        }
    }
}

#Preview {
    Home()
}

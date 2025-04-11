//
//  DetailsView.swift
//  ResponsiveUI
//
//  Created by Nimish Mothghare on 11/04/25.
//

import SwiftUI

struct DetailsView: View {
    var user : Users
    var prop : Properties
    @Environment(\.dismiss) var dismiss
    var body: some View {
        
        
        ScrollView(.vertical,showsIndicators: false) {
            
            VStack(spacing: 12) {
                
                HStack {
                    
                    Button {
                        dismiss()
                        
                    } label: {
                        Image(systemName: "arrow.left")
                            .font(.title3)
                            .foregroundColor(.black)
                    }
                    .opacity(prop.isiPad ? 0 : 1)
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "trash")
                            .font(.title3)
                            .foregroundColor(.red)
                    }
                    
                }
                
                Divider()
                
                HStack(spacing: 15) {
                    
                    Image(user.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 55,height: 55)
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading, spacing: 8) {
                        
                        HStack(spacing: 6) {
                            
                            Text(user.name)
                                .fontWeight(.semibold)
                            if prop.isiPad {
                                Text("nimishm90@gmail.com")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                
                            }
                        }
                        
                        if !prop.isLandscape {
                            
                            Text("nimishm90@gmail.com")
                                .font(.caption)
                                .foregroundColor(.gray)
                            
                            
                        }
                        
                        Text(user.title)
                            .font(.title3.bold())
                    }
                    .frame(maxWidth: .infinity,alignment: .leading)
                    
                    
                    Text("Now")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                }
                
                
                Text("""
Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of de Finibus Bonorum et Malorum(The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, Lorem ipsum dolor sit amet comes from a line in section 1.10.32.
""")
                
                .multilineTextAlignment(.leading)
                .padding(.top,20)
                
                
            }
            .padding()
            
        }
        
        .navigationBarHidden(true)
    }
}

#Preview {
    ContentView()
}

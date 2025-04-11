//
//  Users.swift
//  ResponsiveUI
//
//  Created by Nimish Mothghare on 10/04/25.
//

import Foundation
import SwiftUI


struct Users : Identifiable {
    
    
    let id = UUID().uuidString
    let name : String
    let image : String
    let title : String
    
}

var users : [Users]  =  [
    
    Users(name: "Priya Shinde", image: "images (1)", title: "The Crime patrol Heroine"),
    Users(name: "Swati Shinde", image: "images (2)", title: "The Crime patrol Heroine"),
    Users(name: "Sonica Sharma", image: "images (3)", title: "The Instagram Reels Profie"),
    Users(name: "Heema Shinde", image: "2478-ameesha-patels-hacked-instagram-recovered-by-maharashtra-cyber", title: "The Crime patrol Heroine"),

    
]

//
//  Extension.swift
//  ResponsiveUI
//
//  Created by Nimish Mothghare on 11/04/25.
//

import Foundation
import SwiftUI


extension UISplitViewController {
    
    open override func viewDidLoad() {
        self.preferredDisplayMode = .twoOverSecondary
        self.preferredSplitBehavior = .displace
        
        
        self.preferredPrimaryColumnWidthFraction = 0.3
        
        NotificationCenter.default.addObserver(self, selector: #selector(UpadteView(notification:)), name: Notification.Name("UPDATEFRACTION"), object: nil)
    }
    
    @objc
    func UpadteView(notification : Notification) {
        
        if let info = notification.userInfo, let fraction = info["fraction"] as? Double {
            
            print(fraction)
            
            self.preferredPrimaryColumnWidthFraction = fraction
        }
        
    }
}

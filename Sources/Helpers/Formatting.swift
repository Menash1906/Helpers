//
//  Formatting.swift
//  AntiMess
//
//  Created by Michael Menashe on 08/03/2023.
//

import Foundation

public extension Double {
    
    //Expected: 1 Hour/ 2 Hours/ 1 Minute/ 2 Minutes
    
    func formatEstimatedTimeToString() -> String {
        if self >= 60 {
            if (Int(self) % 60) != 0 {
                return "\(Int(self / 60))H \(Int(self) % 60)M"
            } else {
                return "\(Int(self) / 60) Hour\(self == 60 ? "" : "s")"
            }
        } else {
            let string = "\(Int(self)) Minute\(self == 60 ? "" : "s")"
            return string
        }
    }
}

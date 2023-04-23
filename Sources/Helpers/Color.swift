//
//  Color.swift
//  AntiMess
//
//  Created by Michael Menashe on 03/04/2023.
//

import SwiftUI

public extension Color {
#if os(iOS)
    typealias color = UIColor
#else
    typealias color = NSColor
#endif
    init(hex: String) {
        let scanner = Scanner(string: hex)
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
    
    var hex: String {
        guard let components = color(self).cgColor.components, components.count >= 3 else {
            return ""
        }
        
        let r = Float(components[0])
        let g = Float(components[1])
        let b = Float(components[2])
        
        let hexString = String(format: "%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255))
        return hexString
    }
}

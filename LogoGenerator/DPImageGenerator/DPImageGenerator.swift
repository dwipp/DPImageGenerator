//
//  DPImageGenerator.swift
//  LogoGenerator
//
//  Created by Dwi Putra on 11/10/15.
//  Copyright © 2015 dwipp. All rights reserved.
//

import UIKit

// Enum for selecting max character allowed inside of image
enum maxCharacter {
    case one
    case two
}

class DPImageGenerator: NSObject {
    var image_frame:CGRect?
    var text_color:UIColor?
    var text_font:UIFont?
    var max_char:maxCharacter = .two
    var dynamic_gradient:Bool = true
    
    private func viewBuilder(text:String, isDynamic:Bool) -> UIView {
        let color1:[String] = ["EF4DB6", "52EDC7", "55EFCB", "0D77EF", "5AD427", "87FC70", "FF9500", "C86EDF", "55EFCB"]
        let color2:[String] = ["C643FC", "5AC8FB", "5BCAFF", "81F3FD", "A4E786", "0BD318", "FF5E3A", "E4B7F0", "5BCAFF"]
        
        let x:Int?
        if isDynamic {
            x = Int(arc4random_uniform(UInt32(color1.count)))
        }else {
            srandom(UInt32(text.characters.count))
            x = Int(random()%color1.count)
        }
        
        let defaultView = UIView(frame: image_frame!)
        let gradient: GradientView = GradientView()
        
        let colors:[UIColor] = [self.colorWithHexString(color1[x!]), self.colorWithHexString(color2[x!])]
        
        gradient.frame = defaultView.bounds
        gradient.colors = colors
        gradient.locations = [0.0 , 1.0]
        defaultView.addSubview(gradient)
        
        let width_value = ((image_frame?.width)! - 20)
        let height_value = ((image_frame?.height)! / 2)
        let x_value = ((image_frame?.width)! - width_value)/2
        let y_value = ((image_frame?.height)! - height_value)/2
        
        let initialName:UILabel = UILabel(frame: CGRectMake(x_value, y_value, width_value, height_value))
        var first_letter:String?
        let first_character:NSMutableString = NSMutableString()
        let words:[NSString] = text.componentsSeparatedByCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        
        var count=0
        for word in words {
            if word.length > 0 && count < self.getMaxChar(max_char) {
                first_letter = word.substringToIndex(1)
                first_character.appendString((first_letter?.uppercaseString)!)
                count++
            }
        }
        initialName.text = first_character as String
        initialName.textColor = self.getTextColor(self.text_color)
        initialName.textAlignment = NSTextAlignment.Center
        initialName.font = self.getTextFont(self.text_font)
        defaultView.addSubview(initialName)
        return defaultView
    }
    
    private func getMaxChar(max:maxCharacter) -> Int {
        switch max{
        case .one :
            return 1
        case .two :
            return 2
        }
    }
    
    private func getTextColor(color:UIColor?) -> UIColor {
        if color != nil {
            return color!
        }else {
            return UIColor.whiteColor()
        }
    }
    
    private func getTextFont(font:UIFont?) -> UIFont {
        if font != nil {
            return font!
        }else {
            return UIFont.systemFontOfSize(70)
        }
    }
    
    
    private func colorWithHexString (hex:String) -> UIColor {
        var cString:String = hex.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).uppercaseString
        
        if (cString.hasPrefix("#")) {
            cString = (cString as NSString).substringFromIndex(1)
        }
        
        if (cString.characters.count != 6) {
            return UIColor.grayColor()
        }
        
        let rString = (cString as NSString).substringToIndex(2)
        let gString = ((cString as NSString).substringFromIndex(2) as NSString).substringToIndex(2)
        let bString = ((cString as NSString).substringFromIndex(4) as NSString).substringToIndex(2)
        
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
        NSScanner(string: rString).scanHexInt(&r)
        NSScanner(string: gString).scanHexInt(&g)
        NSScanner(string: bString).scanHexInt(&b)
        
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(1))
    }
    
    
    func imageGenerator(text:String) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.viewBuilder(text, isDynamic: dynamic_gradient).frame.size, false, UIScreen.mainScreen().scale)
        self.viewBuilder(text, isDynamic: dynamic_gradient).layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let screenshot:UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return screenshot
    }
}

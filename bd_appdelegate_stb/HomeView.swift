//
//  HomeView.swift
//  bd_appdelegate_stb
//
//  Created by Clay Suttner on 11/24/19.
//  Copyright © 2019 skite. All rights reserved.
//
import UIKit
import Foundation

class HomeView: UIView {
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        if let image = UIImage(named: "HomeBG.png") {

            let myColor = UIColor(patternImage: image)
            
            myColor.set()
            
            let myContext = UIGraphicsGetCurrentContext()!
            
            myContext.setPatternPhase(CGSize(width: 0, height: 100))
            
            self.backgroundColor = myColor
            
        } else {
            print("Background image not found")
        }
    }
}

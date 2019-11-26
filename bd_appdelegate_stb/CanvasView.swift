//
//  CanvasView.swift
//  bd_appdelegate_stb
//
//  Created by Clay Suttner on 11/25/19.
//  Copyright © 2019 skite. All rights reserved.
//

import UIKit
import PencilKit

let π = CGFloat(Double.pi)

class CanvasView: UIImageView {

    private let defaultLineWidth: CGFloat = 6
    private var drawColor: UIColor = UIColor.black
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, 0.0)
        let context = UIGraphicsGetCurrentContext()
        
        image?.draw(in: bounds)
        
        drawStroke(context: context, touch: touch)
        
        image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    private func drawStroke(context: CGContext?, touch: UITouch) {
        let previousLocation = touch.previousLocation(in: self)
        let location = touch.location(in: self)
        
        let lineWidth = lineWidthForDrawing(context: context, touch: touch)
        
        drawColor.setStroke()
        
        context?.setLineWidth(lineWidth)
        context?.setLineCap(.round)
        
        context?.move(to: previousLocation)
        context?.addLine(to: location)
        
        context?.strokePath()
        
    }
    
    private func lineWidthForDrawing(context: CGContext?, touch: UITouch) -> CGFloat {
        let lineWidth = defaultLineWidth
        return lineWidth
    }
    
    func clearCanvas(animated: Bool) {
        if animated {
            UIView.animate(withDuration: 0.5, animations: {
                self.alpha = 0
            }, completion: { finished in
                self.alpha = 1
                self.image = nil
            })
        } else {
            image = nil
        }
    }
}

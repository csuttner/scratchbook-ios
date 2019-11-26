//
//  SBFilesViewController.swift
//  bd_appdelegate_stb
//
//  Created by Clay Suttner on 11/24/19.
//  Copyright © 2019 skite. All rights reserved.
//

import UIKit

class Canvas: UIView {
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.translateBy(x: CGFloat(0), y: CGFloat(-bounds.size.height - 130))
        context.setStrokeColor(UIColor.black.cgColor)
        context.setLineWidth(3)
        lines.forEach { (line) in
            for (i, p) in line.enumerated() {
                if i == 0 {
                    context.move(to: p)
                } else {
                    context.addLine(to: p)
                }
            }
        }
        context.strokePath()
    }
    
    var lines = [[CGPoint]]()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lines.append([CGPoint]())
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: nil) else { return }
        guard var lastLine = lines.popLast() else { return }
        lastLine.append(point)
        lines.append(lastLine)
        setNeedsDisplay()
    }
    
}

class SBFilesViewController: UIViewController {

    @IBOutlet weak var fileTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = fileList[fileIndex]![0]
        fileTextView.text = fileList[fileIndex]![1]
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        fileList[fileIndex]![1] = fileTextView.text
    }
    
}

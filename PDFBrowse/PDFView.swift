//
//  PDFView.swift
//  PDFBrowse
//
//  Created by franze on 2017/6/6.
//  Copyright © 2017年 franze. All rights reserved.
//

import UIKit

class PDFView: UIView {
    var PDF:CGPDFDocument!
    var zoomScale:CGFloat!
    
    override class var layerClass: AnyClass{
        get{
            return CATiledLayer.self
        }
    }
    
    init(frame: CGRect,scale: CGFloat) {
        super.init(frame: frame)
        let tiledlayer = CATiledLayer(layer: self)
//        tiledlayer.levelsOfDetail = 1
//        tiledlayer.levelsOfDetailBias = 1
        tiledlayer.tileSize = CGSize(width: 512, height: 512)
        
        layer.borderWidth = 6
        layer.borderColor = UIColor.lightGray.cgColor
        zoomScale = scale
    }
    
    override func draw(_ layer: CALayer, in ctx: CGContext) {
        ctx.setFillColor(UIColor.white.cgColor)
        ctx.fill(bounds)
        for num in 1...PDF.numberOfPages{
            let page = PDF.page(at: num)
            let pdfRect = page?.getBoxRect(.cropBox)
            ctx.saveGState()
            ctx.translateBy(x: 0, y: pdfRect!.height*zoomScale*CGFloat(num)+CGFloat(num-1)*10*zoomScale)
            ctx.scaleBy(x: 1, y: -1)
            ctx.scaleBy(x: zoomScale, y: zoomScale)
            ctx.drawPDFPage(page!)
            ctx.addRect(CGRect(x: 0, y: pdfRect!.height, width: pdfRect!.width, height: 10))
            ctx.setFillColor(UIColor.lightGray.cgColor)
            ctx.fillPath()
            ctx.restoreGState()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}

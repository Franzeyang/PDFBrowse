//
//  ViewController.swift
//  PDFBrowse
//
//  Created by franze on 2017/6/6.
//  Copyright © 2017年 franze. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pdfPath = Bundle.main.path(forResource: "1", ofType: "pdf")
        let pdfUrl = URL(fileURLWithPath: pdfPath!)
        let scrollView = PDFScrollView(frame: view.frame)
        scrollView.PDF = CGPDFDocument.init(pdfUrl as CFURL)
        scrollView.initialize()
        view.addSubview(scrollView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


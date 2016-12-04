//
//  ViewController.swift
//  ScanQR
//
//  Created by targetcloud on 2016/12/3.
//  Copyright © 2016年 targetcloud. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var scanline: UIImageView!
    @IBOutlet weak var scanBackView: UIView!
    @IBOutlet weak var scanlineBottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scanBackView.backgroundColor = UIColor.clear
        scanBackView.clipsToBounds = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startScanAnimation()
        QRTool.shareInstance.setRectInterest(scanBackView.frame)
        QRTool.shareInstance.scanQRCode(view) { (resultStrs) in
            print(resultStrs)
        }
    }

    func startScanAnimation() {
        scanlineBottomConstraint.constant = -scanBackView.frame.size.height
        view.layoutIfNeeded()
        
        scanlineBottomConstraint.constant = scanBackView.frame.size.height
        UIView.animate(withDuration: 1, animations: {
            UIView.setAnimationRepeatCount(MAXFLOAT)
            self.view.layoutIfNeeded()
        })
    }
    
    func removeScanAnimation() {
        scanline.layer.removeAllAnimations()
    }
}

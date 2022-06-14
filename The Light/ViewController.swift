//
//  ViewController.swift
//  The Light
//
//  Created by Антон Шаповалов on 09.06.2022.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    var colorNumber = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    
    fileprivate func updateUI() {
        if colorNumber == 1 {
            view.backgroundColor = .green
        }
        if colorNumber == 2 {
            view.backgroundColor = .yellow
        }
        if colorNumber == 3 {
            view.backgroundColor = .red
        }
    }
    
        
        static func toggleFlashLight() {
            guard let device = AVCaptureDevice.default(for: AVMediaType.video),
                  device.hasTorch else { return }
            do {
                try device.lockForConfiguration()
                try device.setTorchModeOn(level: 1.0)
                device.torchMode = device.isTorchActive ? .off : .on
                device.unlockForConfiguration()
            } catch {
                assert(false, "error: device flash light, \(error)")
            }
        }

    @IBAction func flashON(_ sender: Any) {
        ViewController.toggleFlashLight()
    }
    
    
    @IBAction func buttonAction(_ sender: UIButton) {
        colorNumber += 1
        if colorNumber == 4 {
            colorNumber = 1
        }
        updateUI()
    }
}


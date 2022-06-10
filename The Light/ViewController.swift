//
//  ViewController.swift
//  The Light
//
//  Created by Антон Шаповалов on 09.06.2022.
//

import UIKit

class ViewController: UIViewController {
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    var isLightOn = false
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    fileprivate func updateUI() {
        view.backgroundColor = isLightOn ? .red : .green
    }
    
    @IBAction func buttonAction(_ sender: UIButton) {
        isLightOn.toggle()
        updateUI()
        
    }


}


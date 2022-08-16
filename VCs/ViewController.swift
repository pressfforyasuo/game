//
//  ViewController.swift
//  game
//
//  Created by work on 15.08.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var BackgroundSpace: UIImageView!
    
    @IBOutlet weak var ship: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func handlePan(recognizer:UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: self.view)
      if let view = recognizer.view {
        view.center = CGPoint(x:view.center.x + translation.x,
                                y:view.center.y + translation.y)
      }
        print(translation)
        recognizer.setTranslation( CGPoint(x: 0, y: 0), in: self.view)
    }


}


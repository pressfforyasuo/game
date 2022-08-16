//
//  ViewController.swift
//  game
//
//  Created by work on 15.08.2022.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet weak var asteroidsLeft: UIImageView!
    @IBOutlet weak var ship: UIImageView!
    @IBOutlet weak var asteroidsRight: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    //MARK: - IBAction
    @IBAction func handlePan(recognizer:UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: self.view)
        if let view = recognizer.view {
            view.center = CGPoint(x:view.center.x + translation.x,
                                  y:view.center.y + translation.y)
        }
        
        recognizer.setTranslation( CGPoint(x: 0, y: 0), in: self.view)
        destroyShip()
    }
    
    @IBAction func backButtonTouch() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    //MARK: - flow funcs
    private func destroyShip() {
        if ship.frame.origin.x <=  asteroidsLeft.frame.size.width || ship.frame.size.width + ship.frame.origin.x >= asteroidsRight.frame.origin.x {
            let endGameView = UIView()
            
            endGameView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
            endGameView.backgroundColor = UIColor(red: 0.35, green: 0.20, blue: 0.31, alpha: 1.00)
            
            self.view.addSubview(endGameView)
            
            let backButton = UIButton()
            
            backButton.frame = CGRect(x: self.view.frame.size.width/2 - 100, y: self.view.frame.size.height/2 - 30, width: 200, height: 60)
            backButton.setTitle("Back", for: .normal)
            backButton.layer.cornerRadius = 30
            backButton.backgroundColor = .blue
            
            self.view.addSubview(backButton)
            
            let recognizer = UITapGestureRecognizer(target: self, action: #selector(backButtonTouch))
            
            backButton.addGestureRecognizer(recognizer)
            
        } else {
            print("ok")
        }
    }
}


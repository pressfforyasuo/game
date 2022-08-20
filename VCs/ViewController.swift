//
//  ViewController.swift
//  game
//
//  Created by work on 15.08.2022.
//

import UIKit

class ViewController: UIViewController {
    private var timer = Timer()
    //MARK: - IBOutlets
    @IBOutlet weak var ship: UIImageView!
    //MARK: - lifecicle funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        coordinatesShip()
        rocketCreate()
        loadShip()
    }
    //MARK: - IBAction
    @IBAction func handlePan(recognizer:UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: self.view)
        if let view = recognizer.view {
            view.center = CGPoint(x:view.center.x + translation.x,
                                  y:view.center.y + translation.y)
        }
        recognizer.setTranslation( CGPoint(x: 0, y: 0), in: self.view)
    }
    
    @IBAction func backButtonTouch() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    //MARK: - flow funcs
    private func destroyShipRocket() {
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
        
        self.timer.invalidate()
    }
    
    private func rocketCreate() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.5, repeats: true) { _ in
            let rocketImage = UIImageView()
            
            rocketImage.frame = CGRect(x: self.randomCoordinates(), y: 0, width: 30, height: 70)
            
            rocketImage.image = UIImage(named: "Rocket")
            rocketImage.contentMode = .scaleToFill
            
            self.view.addSubview(rocketImage)
            
            _ = Timer.scheduledTimer(withTimeInterval: 0.03, repeats: true) { _ in
                rocketImage.frame.origin.y += 8
                if self.ship.frame.origin.x + self.ship.frame.size.width >= rocketImage.frame.origin.x && self.ship.frame.origin.x <= rocketImage.frame.origin.x + rocketImage.frame.size.width && self.ship.frame.origin.y <= rocketImage.frame.origin.y + rocketImage.frame.size.height && self.ship.frame.origin.y + self.ship.frame.size.height >= rocketImage.frame.origin.y {
                    self.destroyShipRocket()
                }
            }
        }
    }
    
    private func randomCoordinates() -> (CGFloat) {
        let x = CGFloat.random(in: 0..<self.view.frame.size.width - 30)
        
        return x
    }
    
    private func coordinatesShip() {
        self.ship.frame.origin.x = self.view.frame.size.width/2 - 44
        self.ship.frame.origin.y = self.view.frame.size.width 
    }
    
    private func loadShip() {
        guard let imageName = UserDefaults.standard.value(forKey: "currentShip") as? String else { return }
        if let image = Function.loadImage(fileName: imageName) {
            ship.image = image
        }
    }
}

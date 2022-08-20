//
//  MenuVC.swift
//  game
//
//  Created by work on 15.08.2022.
//

import UIKit

class MenuVC: UIViewController {
    //MARK: - lifecicle funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        savePathImage()
    }
    //MARK: - IBAction
    @IBAction func startButtonTouch(_ sender: UIButton) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func settingButtonTouch(_ sender: UIButton) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "SettingVC") as! SettingVC
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
    //MARK: - flow funcs
    private func savePathImage() {
        if UserDefaults.standard.value(forKey: "BlackShip") as? String == nil && UserDefaults.standard.value(forKey: "GrayShip") as? String == nil {
            if let image = UIImage(named: "SpaceShip") {
                let imageName = Function.saveImage(image: image)
                UserDefaults.standard.set(imageName, forKey: "GrayShip")
            }
            if let image = UIImage(named: "BlackSpaceShip") {
                let imageName = Function.saveImage(image: image)
                UserDefaults.standard.set(imageName, forKey: "BlackShip")
            }
        }
    }
}

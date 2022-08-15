//
//  MenuVC.swift
//  game
//
//  Created by work on 15.08.2022.
//

import UIKit

class MenuVC: UIViewController {
    
    var difficultLevel = "Easy"

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction override func printContent(_ sender: Any?) {
        print(difficultLevel)
    }
    
    
    @IBAction func startButtonTouch(_ sender: UIButton) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func infoButtonTouch(_ sender: UIButton) {
    }
    
    @IBAction func difficultLevelButtonTouch(_ sender: UIButton) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "DifficultiesVC") as! DifficultiesVC
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

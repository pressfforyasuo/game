//
//  MenuVC.swift
//  game
//
//  Created by work on 15.08.2022.
//

import UIKit

class MenuVC: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    @IBAction func startButtonTouch(_ sender: UIButton) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
}

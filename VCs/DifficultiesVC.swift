//
//  DifficultiesVC.swift
//  game
//
//  Created by work on 15.08.2022.
//

import UIKit

class DifficultiesVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func selectDifficults(sender: UIButton) {

        
        let difficultLevel = MenuVC(nibName:"MenuVC", bundle: nil)
        
        difficultLevel.difficultLevel = sender.title(for: .normal)!
    }
    
    @IBAction func backButtonTouch(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}

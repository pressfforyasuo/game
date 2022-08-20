//
//  GameScorsVC.swift
//  game
//
//  Created by work on 20.08.2022.
//

import UIKit

class GameScorsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func backButtonTouch() {
        self.navigationController?.popToRootViewController(animated: true)
    }

}

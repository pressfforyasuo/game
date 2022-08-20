//
//  SettingVC.swift
//  game
//
//  Created by work on 20.08.2022.
//

import UIKit

class SettingVC: UIViewController {
    //MARK: - IBOutlet
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var bacgroundViewShip: UIView!
    @IBOutlet weak var LabelDiffucult: UILabel!
    @IBOutlet weak var ship: UIImageView!
    //MARK: - let/var
    private let key = "difficult"
    private let Difficult = ["easy", "medium", "hard"]
    private var nameShip: String = ""
    //MARK: - lifecicle funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDifficult()
        loadCurrentShip()
    }
    //MARK: -IBActions
    @IBAction func changeShipLeft() {
        UIView.animate(withDuration: 1) {
            self.ship.frame.origin.y -= 500
            self.changeShip()
        }
        ship.frame.origin.y += 500
    }
    
    @IBAction func changeShipRight() {
        UIView.animate(withDuration: 1) {
            self.ship.frame.origin.y -= 500
            self.changeShip()
        }
        ship.frame.origin.y += 500
    }
    
    @IBAction func ChangeDifficultLeft() {
        UIView.animate(withDuration: 1) {
            self.LabelDiffucult.frame.origin.x -= 300
            switch self.getIndex(difficult: self.LabelDiffucult.text) {
            case 0: self.LabelDiffucult.text = "hard"
            case 1: self.LabelDiffucult.text = "easy"
            case 2: self.LabelDiffucult.text = "medium"
            default: break
            }
        }
        LabelDiffucult.frame.origin.x += 300
    }
    

@IBAction func changeDifficultRight() {
    UIView.animate(withDuration: 1) {
        self.LabelDiffucult.frame.origin.x += 300
        switch self.getIndex(difficult: self.LabelDiffucult.text) {
        case 0: self.LabelDiffucult.text = "medium"
        case 1: self.LabelDiffucult.text = "hard"
        case 2: self.LabelDiffucult.text = "easy"
        default: break
        }
    }
    LabelDiffucult.frame.origin.x -= 300
}

@IBAction func backButtonTouch() {
    self.navigationController?.popToRootViewController(animated: true)
    
    saveDifficult(difficult: LabelDiffucult.text)
    
    UserDefaults.standard.set(nameShip, forKey: "currentShip")
}
//MARK: - flow funcs
private func loadCurrentShip() {
    guard let imageName = UserDefaults.standard.value(forKey: "currentShip") as? String else { return }
    if let image = Function.loadImage(fileName: imageName) {
        ship.image = image
        nameShip = imageName
    }
}

private func changeShip() {
    switch nameShip {
    case UserDefaults.standard.value(forKey: "GrayShip") as! String :
        guard let imageName = UserDefaults.standard.value(forKey: "BlackShip") as? String else { return }
        if let image = Function.loadImage(fileName: imageName) {
            ship.image = image
            nameShip = imageName
        }
    case UserDefaults.standard.value(forKey: "BlackShip") as! String :
        guard let imageName = UserDefaults.standard.value(forKey: "GrayShip") as? String else { return }
        if let image = Function.loadImage(fileName: imageName) {
            ship.image = image
            nameShip = imageName
        }
    default: break
    }
}

private func getIndex(difficult: String?) -> Int {
    var index = 0
    switch difficult! {
    case "easy": index = 0
    case "medium": index = 1
    case "hard": index = 2
    default: break
    }
    return index
}

private func loadDifficult() {
    if let data = UserDefaults.standard.string(forKey: key) {
        LabelDiffucult.text = data
    } else {
        UserDefaults.standard.set("easy", forKey: key)
        LabelDiffucult.text = UserDefaults.standard.string(forKey: key)
    }
}

private func saveDifficult(difficult: String?) {
    if let difficult = difficult {
        UserDefaults.standard.set(difficult, forKey: key)
    } else {
        loadDifficult()
    }
}
}

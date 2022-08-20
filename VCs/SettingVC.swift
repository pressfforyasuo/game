//
//  SettingVC.swift
//  game
//
//  Created by work on 20.08.2022.
//

import UIKit

class SettingVC: UIViewController {
    
    private let key = "difficult"
    private let Difficult = ["easy", "medium", "hard"]
    
    @IBOutlet weak var LabelDiffucult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDifficult()
    }
    
    @IBAction func ChangeDifficultLeft() {
        switch getIndex(difficult: LabelDiffucult.text) {
        case 0: LabelDiffucult.text = "hard"
        case 1: LabelDiffucult.text = "easy"
        case 2: LabelDiffucult.text = "medium"
        default: break
        }
    }
    
    @IBAction func changeDifficultRight() {
        switch getIndex(difficult: LabelDiffucult.text) {
        case 0: LabelDiffucult.text = "medium"
        case 1: LabelDiffucult.text = "hard"
        case 2: LabelDiffucult.text = "easy"
        default: break
        }
    }
    
    @IBAction func backButtonTouch() {
        self.navigationController?.popToRootViewController(animated: true)
        saveDifficult(difficult: LabelDiffucult.text)
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

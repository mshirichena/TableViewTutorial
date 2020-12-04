//
//  SwitchViewController.swift
//  TableViewTutorial
//
//  Created by Field Employee on 12/3/20.
//

import UIKit

protocol SwitchViewControllerDelegate {
    func switchUpdate(with newSwitch: String)
}

class SwitchViewController: UIViewController {
    
    var editLabel: String?
    var switchDelegate: SwitchViewControllerDelegate?
    
    @IBOutlet weak var NumberSwitch: UITextField!
    @IBOutlet weak var SwitchButton: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.NumberSwitch?.text = self.editLabel
        // Do any additional setup after loading the view.
    }
    
    @IBAction func SwitcherButton(_ sender: Any) {
        if SwitchButton.isOn == true {
            NumberSwitch.text = "On"
        }
        else {
            NumberSwitch.text = "Off"
        }
    }
    
    @IBAction func SaverTheSwitch(_ sender: Any) {
        self.switchDelegate?.switchUpdate(with: self.NumberSwitch.text ?? "default")
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
}

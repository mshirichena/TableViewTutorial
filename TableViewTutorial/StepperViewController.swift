//
//  StepperViewController.swift
//  TableViewTutorial
//
//  Created by Field Employee on 12/3/20.
//

import UIKit

protocol StepperViewControllerDelegate: class {
    func stepperUpdate(with newStep: String)
}
class StepperViewController: UIViewController {
    weak var stepDelegate: StepperViewControllerDelegate?
    var editLabel: String?
    
    
    @IBOutlet weak var StepNumber: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    @IBAction func StepItUp(_ sender: UIStepper) {
        self.StepNumber.text = String(Int(sender.value))
        
    }
    
    
    @IBAction func SaveTheStepper(_ sender: Any) {
        self.stepDelegate?.stepperUpdate(with: self.StepNumber.text ?? "default")
        self.navigationController?.popViewController(animated: true)    }
}

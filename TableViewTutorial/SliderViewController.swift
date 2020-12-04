//
//  SliderViewController.swift
//  TableViewTutorial
//
//  Created by Field Employee on 12/3/20.
//

import UIKit

protocol SliderViewControllerDelegate: class {
    func updateSlider(with labelText: String)
}
class SliderViewController: UIViewController {
        
    @IBOutlet weak var SliderNumber: UILabel!
    var editLabel: String?
    var initialSlider: Float?
    weak var delegate: SliderViewControllerDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.SliderNumber?.text = self.editLabel

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func sliderButton(_ sender: UISlider) {
        SliderNumber.text = String(Int(sender.value))
    }
    
    @IBAction func SaveSlider(_ sender: Any) {
        self.delegate?.updateSlider(with: self.SliderNumber.text ?? "default")
               self.navigationController?.popViewController(animated: true)    }
    
    func setLabel(labelValue: String) {
    }

}


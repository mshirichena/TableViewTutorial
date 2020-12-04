//
//  AddTodoViewController.swift
//  TableViewTutorial
//
//  Created by Field Employee on 12/2/20.
//

import UIKit

protocol EditTextViewControllerDelegate: class {
    func updateText(with newText: String)
}

class AddTodoViewController: UIViewController {
    
    
    @IBOutlet weak var controltexField: UITextField!
    
    var editText: String?
    
    weak var delegate: EditTextViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.controltexField?.text = self.editText
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func Save(_ sender: UIButton) {
        self.delegate?.updateText(with: self.controltexField.text ?? "default")
        print(controltexField.text)
        self.navigationController?.popViewController(animated: true)
    }
    
    
}

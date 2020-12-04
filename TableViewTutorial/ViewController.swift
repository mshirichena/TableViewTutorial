//
//  ViewController.swift
//  TableViewTutorial
//
//  Created by Field Employee on 12/2/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var toDoListTableView: UITableView!
    
    var controls = ["TextField", "Slider", "Stepper", "Segment", "Switch"]
    var values: [Any] = ["Enter Text", "0", "0", "Coffee", "true"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.toDoListTableView.dataSource = self
        self.toDoListTableView.delegate = self
    }
    
    @IBAction func addNewTodo(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let addTodoVC = storyboard.instantiateViewController(withIdentifier: "AddTodoViewController")
        self.navigationController?.pushViewController(addTodoVC, animated: true)
        
    }
}

extension ViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.controls.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        //        cell.textLabel?.text = "Some Cool TODO thing"
        //        return cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let todo = self.controls[indexPath.row]
        let value = self.values[indexPath.row]
        cell.todoLabel.text = "\(todo): \(value)"
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        switch indexPath.row {
        case 0:
            let textVC = storyboard.instantiateViewController(identifier: "AddTodoViewController") as! AddTodoViewController
            let textToEdit = self.values[indexPath.row]
            textVC.editText = textToEdit as? String
            textVC.delegate = self
            self.navigationController?.pushViewController(textVC, animated: true)
            
        case 1:
            let sliderVC = storyboard.instantiateViewController(identifier: "SliderViewController") as! SliderViewController
            let fieldToEdit = self.values[indexPath.row]
            sliderVC.editLabel = fieldToEdit as? String
            sliderVC.delegate = self
            self.navigationController?.pushViewController(sliderVC, animated: true)
            
        case 2:
            let stepperVC = storyboard.instantiateViewController(identifier: "StepperViewController") as! StepperViewController
            let fieldToEdit = self.values[indexPath.row]
            stepperVC.editLabel = fieldToEdit as? String
            stepperVC.stepDelegate = self
            self.navigationController?.pushViewController(stepperVC, animated: true)
            
        case 3:
            let segmentVC = storyboard.instantiateViewController(identifier: "SegmentedControlsViewController") as! SegmentedControlsViewController
            let fieldToEdit = self.values[indexPath.row]
            segmentVC.editSegment = fieldToEdit as? String
            segmentVC.segDelegate = self
            self.navigationController?.pushViewController(segmentVC, animated: true)
            
        case 4:
            let switchVC = storyboard.instantiateViewController(identifier: "SwitchViewController") as! SwitchViewController
            let fieldToEdit = self.values[indexPath.row]
            switchVC.editLabel = fieldToEdit as? String
            switchVC.switchDelegate = self
            self.navigationController?.pushViewController(switchVC, animated: true)
            
        default: 
            print("")
        }
        toDoListTableView.reloadData()
    }
    
}

extension ViewController: EditTextViewControllerDelegate {
    func updateText(with newText: String) {
        self.values[0] = newText
        self.toDoListTableView.reloadData()
    }
    
    
}

extension ViewController: SliderViewControllerDelegate {
    func updateSlider(with labelText: String) {
        //                if let selectedIndex = self.toDoListTableView.indexPathForSelectedRow?.row {
        //                    self.values[selectedIndex] = labelText
        //                    self.toDoListTableView.reloadData()
        //            }
        self.values[1] = labelText
        self.toDoListTableView.reloadData()
    }
}


extension ViewController: StepperViewControllerDelegate {
    func stepperUpdate(with newStep: String) {
        self.values[2] = newStep
        self.toDoListTableView.reloadData()
    }
}

extension ViewController: SegmentedViewControllerDelegate {
    func updateSeg(with segNewText: String) {
        self.values[3] = segNewText
        self.toDoListTableView.reloadData()
    }
}


extension ViewController: SwitchViewControllerDelegate {
    func switchUpdate(with newSwitch: String) {
        self.values[4] = newSwitch
        self.toDoListTableView.reloadData()
    }
    
}

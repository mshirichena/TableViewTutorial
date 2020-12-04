//
//  SegmentedControlsViewController.swift
//  TableViewTutorial
//
//  Created by Field Employee on 12/3/20.
//

import UIKit

protocol SegmentedViewControllerDelegate: class {
    func updateSeg(with segNewText: String)
}

class SegmentedControlsViewController: UIViewController {
    
    
    
    
    @IBOutlet weak var segments: UISegmentedControl!
    @IBOutlet weak var segmentLabel: UILabel!
    
    
    var editSegment: String?
    weak var segDelegate: SegmentedViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.segmentLabel.text = self.editSegment
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func changeSegment(_ sender: Any) {
        if segments.selectedSegmentIndex == 0 {
            segmentLabel.text = "Coffee"
        }
        if segments.selectedSegmentIndex == 1 {
            segmentLabel.text = "Coffee Cream"
        }
    }
    
    
    @IBAction func SaveTheSegment(_ sender: Any) {
        self.segDelegate?.updateSeg(with: self.segmentLabel.text ?? "defaulf")
        self.navigationController?.popViewController(animated: true)    }
    
}

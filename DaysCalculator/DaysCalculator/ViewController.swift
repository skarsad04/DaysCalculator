//
//  ViewController.swift
//  DaysCalculator
//
//  Created by Alam, Sk on 22/02/2021.
//  Copyright © 2021 AlamShaikh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var fromDateView: DateView!
    
    @IBOutlet weak var toDateView: DateView!
    
    @IBOutlet weak var lblResult: UILabel!
    var viewModel: DateViewModel?
    override func viewDidLoad() {
        viewModel = DateViewModel(viewController: self)
        super.viewDidLoad()
        setUpInputFields()
        // Do any additional setup after loading the view.
    }
    func setUpInputFields()  {
        fromDateView.title = "From Date:"
        toDateView.title = "To Date:"
        lblResult.text = ""
    }
    
    
    @IBAction func btnCalculateClicked(_ sender: UIButton) {
        self.viewModel?.btnLoginClicked()
    }
    
}
// delegates methods
extension ViewController: DateViewModelDelegate {
    func getStartDate() -> String? {
        return self.fromDateView.text
    }
    
    func getEndDate() -> String? {
        return self.toDateView.text
    }
    func showTheResult(result: String) {
        self.lblResult.text = result
    }
    
    
}


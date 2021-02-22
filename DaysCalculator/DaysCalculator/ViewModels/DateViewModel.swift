//
//  DateViewModel.swift
//  DaysCalculator
//
//  Created by Alam, Sk on 22/02/2021.
//  Copyright © 2021 AlamShaikh. All rights reserved.
//

import Foundation
import UIKit
protocol DateViewModelDelegate {
    func getStartDate() -> String?
    func getEndDate() -> String?
    func showTheResult(result: String)
}

class DateViewModel: NSObject {
    let viewController: DateViewModelDelegate?
    
     init(viewController:DateViewModelDelegate) {
        self.viewController = viewController
    }
    
    // This method calls when user click on "calculate button from UI"
    func btnLoginClicked(){
        let fromDate = self.viewController?.getStartDate()
        let toDate = self.viewController?.getEndDate()
        if(!isValidDate(fromDate)){
            self.showErrorAlert(message: "Please enter valid 'From date'.")
        } else if(!isValidDate(toDate)){
            self.showErrorAlert(message: "Please enter valid 'To date'.")
        } else {
            // Lets calculate the dates
            self.calculateTheDate(fromDate: fromDate!, toDate: toDate!)
        }
        
        
    }
    
    // Vaildating the Date and returning the true/false
    func isValidDate(_ dateString: String?) -> Bool {
        if let date = dateString{
            return Utility.isValidDate(date)
        }
        return false
    }
    // This method will call when user entered both dates correctly and will calculates the days.
    func calculateTheDate(fromDate: String, toDate: String) {
       let result =  DateValidator.getDays(fromDate: fromDate, toDate: toDate)
        self.viewController?.showTheResult(result: "The days between above dates is \n\(result.0) years \n\(result.1) months \n\(result.2) days")
        
    }
    // Show the alert if there is any error needs to be shown
    func showErrorAlert(message: String) {
        if let vc =  self.viewController {
            Utility.showAlertView(title: "Sorry!", message: message, toView: vc as! UIViewController)
        }

    }
}

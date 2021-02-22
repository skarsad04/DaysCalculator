//
//  Utility.swift
//  DaysCalculator
//
//  Created by Alam, Sk on 22/02/2021.
//  Copyright © 2021 AlamShaikh. All rights reserved.
//

import Foundation
import UIKit
class Utility: NSObject {
    // This function is retrun true if user enters the correct format.
    static func isValidDate(_ dateString: String)->Bool{
        let regex = #"^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$"#
        
        let datePredicate = NSPredicate(format:"SELF MATCHES %@", regex)
        return datePredicate.evaluate(with: dateString)
    }
    
    static func showAlertView(title: String, message: String, toView: UIViewController) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Close", style: UIAlertAction.Style.default, handler: nil))
            toView.present(alert, animated: true, completion: nil)
        }

}

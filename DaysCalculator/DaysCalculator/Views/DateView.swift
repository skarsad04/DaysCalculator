//
//  DateView.swift
//  DaysCalculator
//
//  Created by Alam, Sk on 22/02/2021.
//  Copyright © 2021 AlamShaikh. All rights reserved.
//

import UIKit

protocol DateViewDelegate {
    
}

@IBDesignable
class DateView: UIView {
    var contentView : UIView?
    var delegate: DateViewDelegate?
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var txtFieldDate: UITextField!
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }

    func xibSetup() {
        contentView = loadViewFromNib()

        // use bounds not frame or it'll be offset
        contentView!.frame = bounds

        // Make the view stretch with containing view
        contentView!.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]

        // Adding custom subview on top of our view (over any custom drawing > see note below)
        addSubview(contentView!)
    }

    func loadViewFromNib() -> UIView! {

        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "DateView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView

        return view
    }

    var title:String {
        get {
            return self.lblTitle.text ?? ""
        }
        set {
            self.lblTitle.text = newValue
        }
    }
    
    var text: String? {
        get {
            return self.txtFieldDate.text
        }
        set {
            self.txtFieldDate.text = newValue
        }
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

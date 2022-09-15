//
//  EmailView.swift
//  TabBarSelection
//
//  Created by chaitanya on 02/09/22.
//

import UIKit

class EmailView: UIView {
    
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var email: UITextField!
    // MARK: - View
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        // Init variables
       
    }

    
    private func xibSetup(frame: CGRect) {
        let view = loadViewFromNib()
        // Adjust the view size for iPhone 6 and iPhone 6 plus
        view.frame = frame
        // Adding custom subview on top of our view (over any custom drawing > see note below)
        addSubview(view)
        // Setup view
    }
    
    private func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "EmailView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        return view
    }
        
}

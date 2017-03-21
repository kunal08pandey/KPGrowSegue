//
//  Radio.swift
//  RadioButton
//
//  Created by Kunal Pandey on 3/21/17.
//  Copyright © 2017 Kunal Pandey. All rights reserved.
//

import UIKit

class Radio: UIButton {
    @IBOutlet weak var radioGroup:RadioGroup!
    override func awakeFromNib() {
        super.awakeFromNib()
        if let title = self.titleLabel?.text {
            
            let attributedForNormalTitle =  NSMutableAttributedString(string: "a \(title)")
            if let radioFont = UIFont(name: "radio", size: (self.titleLabel?.font.pointSize)!) {
                attributedForNormalTitle.addAttributes([NSFontAttributeName : radioFont], range: NSMakeRange(0, 1))
                attributedForNormalTitle.addAttributes([NSFontAttributeName : self.titleLabel?.font], range: NSMakeRange(1, (self.titleLabel?.text?.characters.count)!))
                let attributedForSelectedTitle =  NSMutableAttributedString(string: "b \(title)")
                attributedForSelectedTitle.addAttributes([NSFontAttributeName : radioFont], range: NSMakeRange(0, 1))
                attributedForSelectedTitle.addAttributes([NSFontAttributeName : self.titleLabel?.font], range: NSMakeRange(1, (self.titleLabel?.text?.characters.count)!))
                self.setAttributedTitle(attributedForNormalTitle, for: .normal)
                self.setAttributedTitle(attributedForSelectedTitle, for: .selected)
            }
            
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

class RadioGroup : NSObject {
    @IBOutlet var radioButtons: [Radio]!
    @IBOutlet weak var selectedButton:Radio?
    override func awakeFromNib() {
        super.awakeFromNib()
//        for radio in self.radioButtons {
//            radio.addTarget(self, action: #selector(RadioGroup.makeSelection(sender:)), for: .touchUpInside)
//        }
//        self.selectedButton?.isSelected = true
    }
    
    func makeSelection(sender:UIButton) {
        for radio in self.radioButtons {
            radio.isSelected = false
        }
        selectedButton = sender as! Radio
    }
}

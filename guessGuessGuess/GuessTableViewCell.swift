//
//  GuessTableViewCell.swift
//  guessGuessGuess
//
//  Created by Rebecca Cullimore on 5/28/16.
//  Copyright © 2016 Cullimore Family. All rights reserved.
//

import UIKit

private var kAssociationKeyNextField: UInt8 = 0
//private var kFirstAlreadyInitialized: Bool = false

extension UITextField {
    var nextField: UITextField? {
        get {
            return objc_getAssociatedObject(self, &kAssociationKeyNextField) as? UITextField
        }
        set(newField) {
            objc_setAssociatedObject(self, &kAssociationKeyNextField, newField, .OBJC_ASSOCIATION_RETAIN)
        }
    }
}

class GuessTableViewCell: UITableViewCell, UITextFieldDelegate {
    let limitLength = 1
    
    @IBOutlet weak var correctNumbers: UILabel!
    @IBOutlet weak var correctPlaces: UILabel!
    @IBOutlet weak var rowLabel: UILabel!
    @IBOutlet weak var input1: UITextField!
    @IBOutlet weak var input2: UITextField!
    @IBOutlet weak var input3: UITextField!
    @IBOutlet weak var input4: UITextField!
    @IBOutlet weak var youWin: UILabel!
    @IBOutlet weak var goButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        
        super.setSelected(selected, animated: animated)
//        if kFirstAlreadyInitialized == true {
//            input1.becomeFirstResponder()
//        }
        
        input1.delegate = self
        input2.delegate = self
        input3.delegate = self
        input4.delegate = self
        
        self.input1.nextField = self.input2
        self.input2.nextField = self.input3
        self.input3.nextField = self.input4
        self.input4.nextField = self.input1
        
//self.input1.chan
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
//        kFirstAlreadyInitialized = true
        guard let text = textField.text else { return true }
        if text.characters.count == limitLength {
            textField.nextField?.becomeFirstResponder()
        }
        return text.characters.count < limitLength
//        let newLength = text.characters.count + string.characters.count - range.length
//        return newLength <= limitLength
    }
    
//    func textFieldShouldReturn(textField: UITextField) -> Bool {
//        // Hide the keyboard.
////        textField.resignFirstResponder()
////        textField.nextField?.becomeFirstResponder()
//        return false
//    }
    
//    func textFieldDidEndEditing(textField: UITextField) {
//        print(textField.text)
//    }
    

}

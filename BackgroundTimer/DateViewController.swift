//
//  DateViewController.swift
//  BackgroundTimer
//
//  Created by rafiul hasan on 23/11/22.
//

import UIKit

class DateViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var field: UITextField!
    @IBOutlet var picker: UIDatePicker!
    
    public var completionHandler: ((String, Date) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        field.becomeFirstResponder()
        picker.tintColor = .white
        field.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        if let text = field.text, !text.isEmpty {
            let pickedDatetime = picker.date
            completionHandler?(text, pickedDatetime)
            navigationController?.popViewController(animated: true)
        }
    }
}

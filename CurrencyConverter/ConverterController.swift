//
//  ConverterController.swift
//  CurrencyConverter
//
//  Created by Arseny Neustroev on 26/10/2019.
//  Copyright © 2019 Arseny Neustroev. All rights reserved.
//

import UIKit

class ConverterController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        textFrom.delegate = self
        // Do any additional setup after loading the view.
    }
    

    @IBOutlet weak var CoursesDateLabel: UILabel!
    @IBOutlet weak var ButtonTo: UIButton!
    @IBOutlet weak var ButtonFrom: UIButton!
    @IBOutlet weak var textFrom: UITextField!
    @IBOutlet weak var textTo: UITextField!

    
    @IBAction func pushFromAction(_ sender: Any) {
    }
    
    @IBAction func pushToAction(_ sender: Any) {
    }
    
    @IBAction func textFromChanged(_ sender: Any) {
        let amount = Double(textFrom.text!)
        textTo.text = Model.sharedInstance.Convert(amount: amount)
    }
    
    func refreshButtonsCaptions() {
        ButtonTo.setTitle(Model.sharedInstance.toCurrency.CharCode, for: UIControl.State.normal)
        ButtonFrom.setTitle(Model.sharedInstance.fromCurrency.CharCode, for: UIControl.State.normal)
    }
    

    
    override func viewWillAppear(_ animated: Bool) {
        refreshButtonsCaptions()
    }
    
    @objc func doneButtonWasPressed(){
        textFrom.resignFirstResponder()
        navigationItem.rightBarButtonItem = nil
    }
}

extension ConverterController : UITextFieldDelegate{
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool{
        print("Editing")
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(doneButtonWasPressed))
        navigationItem.rightBarButtonItem = doneButton
        return true
    }

}
    

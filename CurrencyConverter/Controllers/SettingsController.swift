//
//  SettingsController.swift
//  CurrencyConverter
//
//  Created by Arseny Neustroev on 26/10/2019.
//  Copyright © 2019 Arseny Neustroev. All rights reserved.
//

import UIKit

class SettingsController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func CancelPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func ShowCoursesPushed(_ sender: Any) {
        Model.sharedInstance.loadXML(date: datePicker.date)
        dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

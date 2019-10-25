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
    
    func refreshButtonsCaptions() {
        ButtonTo.setTitle(Model.sharedInstance.toCurrency.CharCode, for: UIControl.State.normal)
        ButtonFrom.setTitle(Model.sharedInstance.fromCurrency.CharCode, for: UIControl.State.normal)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        refreshButtonsCaptions()
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

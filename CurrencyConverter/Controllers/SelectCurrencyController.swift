//
//  SelectCurrencyController.swift
//  CurrencyConverter
//
//  Created by Arseny Neustroev on 26/10/2019.
//  Copyright © 2019 Arseny Neustroev. All rights reserved.
//

import UIKit

class SelectCurrencyController: UITableViewController {
    
    enum FlagCurrencySelected {
        case From
        case To
    }
    
    var flagCurrency : FlagCurrencySelected = .From

    @IBAction func CancelButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCurrency = Model.sharedInstance.currencies[indexPath.row]
        if flagCurrency == .From {
            Model.sharedInstance.fromCurrency = selectedCurrency
        }
        if flagCurrency == .To {
            Model.sharedInstance.toCurrency = selectedCurrency
        }
        dismiss(animated: true, completion: nil)
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return Model.sharedInstance.currencies.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CurrencyCell

        cell.initCell(currency: Model.sharedInstance.currencies[indexPath.row])

        return cell
    }

}

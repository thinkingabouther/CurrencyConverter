//
//  CurrencyCell.swift
//  CurrencyConverter
//
//  Created by Arseny Neustroev on 27/10/2019.
//  Copyright © 2019 Arseny Neustroev. All rights reserved.
//

import UIKit

class CurrencyCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func initCell(currency: Currency) {
        imageFlag.image = currency.Flag
        labelCurrencyName.text  = currency.Name
        if labelCurrencyValue != nil{
            labelCurrencyValue.text = currency.Value
        }
    }
    
    @IBOutlet weak var imageFlag: UIImageView!
    @IBOutlet weak var labelCurrencyName: UILabel!
    @IBOutlet weak var labelCurrencyValue: UILabel!
    
}

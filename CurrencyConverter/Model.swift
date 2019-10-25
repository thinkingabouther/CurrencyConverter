//
//  Model.swift
//  CurrencyConverter
//
//  Created by Arseny Neustroev on 25/10/2019.
//  Copyright © 2019 Arseny Neustroev. All rights reserved.
//

import UIKit


class Model: NSObject {
    static let sharedInstance = Model()
    
    var currencies : [Currency] = []
    
    var pathToXML: String {
        return ""
    }
    
    var urlToXML : URL?{
        return nil
    }
    
    
    // function to load XML data from cbr.ru and saving it
    func loadXML(date: Data) {
        
    }
    
    
    /*
    function to parse currencies out of XML file and load them to currencies : [Currency]
    and make notification to main view about it
    */
    func parseXML() {
        
    }
}

class Currency{
    var NumCode : String?
    var CharCode : String?
    var Name : String?
    
    var Value : String?
    var valueDouble : Double?
    
    var Nominal : String?
    var nominalDouble : Double?
    
    
}

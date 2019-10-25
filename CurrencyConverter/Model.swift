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
    var currentCurrency : Currency?
    var currentCharacters : String = ""
    // getting path to file from a bundle or from a file system on a device
    var pathToXML: String {
        let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.libraryDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0] + "/currencyData.xml"
        if FileManager.default.fileExists(atPath: path){
            return path
        }
        return Bundle.main.path(forResource: "currencyData", ofType: "xml")!
    }
    var urlToXML : URL{
        return URL(fileURLWithPath: pathToXML)
    }
    
    
    // function to load XML data from cbr.ru and saving it
    func loadXML(date: Data) {
        
    }
    
    /*
    function to parse currencies out of XML file and load them to currencies : [Currency]
    and make notification to main view about it
    */
    func parseXML() {
        let xmlParser = XMLParser(contentsOf: urlToXML)
        xmlParser?.delegate = self
        xmlParser?.parse()
        print(currencies)
        
    }
}


extension Model : XMLParserDelegate{
    /*
     --- CURRENCY PATTERN ---
     <Valute ID="R01010">
     <NumCode>036</NumCode>
     <CharCode>AUD</CharCode>
     <Nominal>1</Nominal>
     <Name>Австралийский доллар</Name>
     <Value>16,0102</Value>
     </Valute>
     */
    
    // called when parser faced an opening of an XML element
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]){
        
        if elementName == "Valute"{
            currentCurrency = Currency()
        }
        
        if elementName == "NumCode"{
            currentCurrency!.NumCode = currentCharacters
        }
        
        if elementName == "CharCode"{
            currentCurrency!.CharCode = currentCharacters
        }
        
        if elementName == "Nominal"{
            currentCurrency!.Nominal = currentCharacters
            currentCurrency!.nominalDouble = Double(currentCharacters.replacingOccurrences(of: ",", with: "."))
        }
        
        if elementName == "Name"{
            currentCurrency!.Name = currentCharacters
        }
        
        if elementName == "Value"{
            currentCurrency!.Value = currentCharacters
            currentCurrency!.valueDouble = Double(currentCharacters.replacingOccurrences(of: ",", with: "."))
        }
    }

    // called when any character is founded
    func parser(_ parser: XMLParser, foundCharacters string: String){
        currentCharacters = string
    }
    
    // called when parser faced a closure of an XML element
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?){
        if elementName == "Valute"{
            currencies.append(currentCurrency!)
        }
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

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
    var currentDate : String = ""
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
    
    // http://www.cbr.ru/scripts/XML_daily.asp?date_req=02/03/2002
    // function to load XML data from cbr.ru and saving it
    func loadXML(date: Date?) {
        var strURL = "http://www.cbr.ru/scripts/XML_daily.asp?date_req="
        
        if let date = date{
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy"
            strURL += dateFormatter.string(from: date)
        }
        
        let url = URL(string: strURL)
        var errorWhileLoading : String?
        let urlSession = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error == nil{
                let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.libraryDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0] + "/currencyData.xml"
                let urlForSave = URL(fileURLWithPath: path)
                do{
                    try data?.write(to: urlForSave)
                    print("Data was downloaded")
                    self.parseXML()
                    
                } catch{
                    print("error while saving data - \(error.localizedDescription)")
                    errorWhileLoading = error.localizedDescription
                }
            }
            else{
                print("Error while getting XML from server - \(error!.localizedDescription)")
                errorWhileLoading = error!.localizedDescription
            }
            
            if let errorWhileLoading = errorWhileLoading{
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "DataNotLoaded"), object: self, userInfo: ["ErrorName":errorWhileLoading])
            }
        }
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "DataStartedDownloading"), object: self)
        urlSession.resume()
    
    }
    
    /*
    function to parse currencies out of XML file and load them to currencies : [Currency]
    and make notification to main view about it
    */
    func parseXML() {
        currencies = [Currency.rouble()]
        let xmlParser = XMLParser(contentsOf: urlToXML)
        xmlParser?.delegate = self
        xmlParser?.parse()
        print("Data was updated")
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "DataUpdated"), object: self)
        for currency in currencies{
            if currency.CharCode == toCurrency.CharCode{
                toCurrency = currency
            }
            if currency.CharCode == fromCurrency.CharCode{
                fromCurrency = currency
            }
        }
    }
    
    // --------CONVERTER--------
    
    var fromCurrency : Currency = Currency.rouble()
    var toCurrency : Currency = Currency.rouble()
    
    func Convert(amount : Double?) -> String? {
        if amount == nil{
            return ""
        }
        let k = fromCurrency.nominalDouble! * fromCurrency.valueDouble! / (toCurrency.nominalDouble! * toCurrency.valueDouble!) * amount!
        return String(k)
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
        if elementName == "ValCurs"{
            if let currentDateString = attributeDict["Date"]{
                currentDate = currentDateString
            }
        }
        if elementName == "Valute"{
            currentCurrency = Currency()
        }
    }

    // called when any character is founded
    func parser(_ parser: XMLParser, foundCharacters string: String){
        currentCharacters = string
    }
    
    // called when parser faced a closure of an XML element
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?){
    
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
    
    var Flag : UIImage?{
        if let CharCode = CharCode {
            let image = UIImage(named: "flagsImages/" + CharCode + ".png")
            return image
        }
        return nil
    }
    
    class func rouble() -> Currency {
        let r = Currency()
        r.CharCode = "RUB"
        r.Name = "Российский рубль"
        r.Nominal = "1"
        r.nominalDouble = 1
        r.Value = "1"
        r.valueDouble = 1
        return r
    }
}

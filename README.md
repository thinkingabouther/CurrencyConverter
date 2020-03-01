# CurrencyConverter
![CurrencyConverter logo](/CurrencyConverter/resources/iconCurrencyConverter_rounded.png)

## Overview

This app allow you to find up-to-date exchange rates and quickly transfer between more than __35 currencies__!

Exchange rates are exported from the official [CBR site](https://www.cbr.ru/currency_base/daily/) as an XML file

### Implemented functions:
- Conversion between currencies with __up-to-date rate__
- Getting rates from __any date in the past__ and converting to any other currency from the list 

### In dev:
- Graphing the changing of rates over time 

### List of available currencies
- Russian ruble
- US dollar
- Euro
- GBP, etc.

### Content of the page

- Getting started
  - Requirements
  - Installation
- Usage
- Troubleshooting

## Getting started
### Requirements
 - macOS Catalina or newer
 - Xcode 11 or newer
 - iOS 13 or newer
### Installation
1. Install Xcode on your Mac from Mac AppStore or using a [link](https://developer.apple.com/xcode/resources/)
2. Download the source code of a project and unpack it
3. Open the *.xcodeproject* file to open the project using Xcode
4. Attach your iPhone to your Mac via cabel or using a hotspot
5. Build a project and run it on your iPhone 
## Usage
There are two main views of the app:
- Courses view
- Converter view

### Courses view
![Courses view screenshot](/CurrencyConverter/resources/CoursesViewShot.jpg)

Here you can view the exchange rates and customize the date for both the converter and the courses view.  
#### UI Elements description:
1. The button opens the date picker view for you to choose the date for the application to extract the exchange rates. The date chosen here will be applied for both the courses view and the converter;
2. The label shows the current date of the app;
3. The button sets the date of the app to the actual date and gets an XML file from [CBR site](https://www.cbr.ru/currency_base/daily/).

### Converter view
![Converter view screenshot](/CurrencyConverter/resources/ConverterViewShot.jpg)

Here you can transfer value given in one currency to another.  
#### UI Elements description:
1. Two buttons that are responsible for choosing a currency from the list;
2. The textbox allows you to enter a value in the original currency. Transfered value will be shown in the textbox on the right

## Troubleshooting
If you are getting into trouble installing or using the app or have found any bug please contact me at aineustroev_1@edu.hse.ru

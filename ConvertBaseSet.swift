//
//  BaseSet.swift
//  Currency Convertor
//
//  Created by Utsav Negi on 6/18/20.
//  Copyright © 2020 CS50. All rights reserved.
//

import UIKit

class ConvertBaseSet: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var PickerSet : [String] = [String]()
    
    @IBOutlet var pickerTo : UIPickerView!
    @IBOutlet var pickerFrom : UIPickerView!
    var selectedFrom : String!
    var selectedTo : String!
    
    
    override func viewDidLoad()
    {
        self.pickerTo.delegate = self
        self.pickerTo.dataSource = self
        
        self.pickerFrom.delegate = self
        self.pickerFrom.dataSource = self
        
        PickerSet = [
        "",
        "AED    United Arab Emirates Dirham",
        "AFN    Afghan Afghani",
        "ALL    Albanian Lek",
        "AMD    Armenian Dram",
        "ANG    Netherlands Antillean Guilder",
        "AOA    Angolan Kwanza",
        "ARS    Argentine Peso",
        "AUD    Australian Dollar",
        "AWG    Aruban Florin",
        "AZN    Azerbaijani Manat",
        "BAM    Bosnia-Herzegovina Convertible Mark",
        "BBD    Barbadian Dollar",
        "BCH    Bitcoin Cash",
        "BDT    Bangladeshi Taka",
        "BGN    Bulgarian Lev",
        "BHD    Bahraini Dinar",
        "BIF    Burundian Franc",
        "BMD    Bermudan Dollar",
        "BND    Brunei Dollar",
        "BOB    Bolivian Boliviano",
        "BRL    Brazilian Real",
        "BSD    Bahamian Dollar",
        "BTC    Bitcoin",
        "BTG    Bitcoin Gold",
        "BWP    Botswanan Pula",
        "BZD    Belize Dollar",
        "CAD    Canadian Dollar",
        "CDF    Congolese Franc",
        "CHF    Swiss Franc",
        "CLP    Chilean Peso",
        "CNH    Chinese Yuan (offshore)",
        "CNY    Chinese Yuan",
        "COP    Colombian Peso",
        "CRC    Costa Rican Colón",
        "CUC    Cuban Convertible Peso",
        "CUP    Cuban Peso",
        "CVE    Cape Verdean Escudo",
        "CZK    Czech Republic Koruna",
        "DASH    DASH",
        "DJF    Djiboutian Franc",
        "DKK    Danish Krone",
        "DOP    Dominican Peso",
        "DZD    Algerian Dinar",
        "EGP    Egyptian Pound",
        "EOS    EOS",
        "ETB    Ethiopian Birr",
        "ETH    Ethereum",
        "EUR    Euro",
        "FJD    Fijian Dollar",
        "GBP    British Pound Sterling",
        "GEL    Georgian Lari",
        "GHS    Ghanaian Cedi",
        "GIP    Gibraltar Pound",
        "GMD    Gambian Dalasi",
        "GNF    Guinean Franc",
        "GTQ    Guatemalan Quetzal",
        "GYD    Guyanaese Dollar",
        "HKD    Hong Kong Dollar",
        "HNL    Honduran Lempira",
        "HRK    Croatian Kuna",
        "HTG    Haitian Gourde",
        "HUF    Hungarian Forint",
        "IDR    Indonesian Rupiah",
        "ILS    Israeli New Sheqel",
        "INR    Indian Rupee",
        "IQD    Iraqi Dinar",
        "IRR    Iranian Rial",
        "ISK    Icelandic Króna",
        "JMD    Jamaican Dollar",
        "JOD    Jordanian Dinar",
        "JPY    Japanese Yen",
        "KES    Kenyan Shilling",
        "KGS    Kyrgystani Som",
        "KHR    Cambodian Riel",
        "KMF    Comorian Franc",
        "KRW    South Korean Won",
        "KWD    Kuwaiti Dinar",
        "KYD    Cayman Islands Dollar",
        "KZT    Kazakhstani Tenge",
        "LAK    Laotian Kip",
        "LBP    Lebanese Pound",
        "LKR    Sri Lankan Rupee",
        "LRD    Liberian Dollar",
        "LSL    Lesotho Loti",
        "LTC    Litecoin",
        "LYD    Libyan Dinar",
        "MAD    Moroccan Dirham",
        "MDL    Moldovan Leu",
        "MKD    Macedonian Denar",
        "MMK    Myanma Kyat",
        "MOP    Macanese Pataca",
        "MUR    Mauritian Rupee",
        "MVR    Maldivian Rufiyaa",
        "MWK    Malawian Kwacha",
        "MXN    Mexican Peso",
        "MYR    Malaysian Ringgit",
        "MZN    Mozambican Metical",
        "NAD    Namibian Dollar",
        "NGN    Nigerian Naira",
        "NIO    Nicaraguan Córdoba",
        "NOK    Norwegian Krone",
        "NPR    Nepalese Rupee",
        "NZD    New Zealand Dollar",
        "OMR    Omani Rial",
        "PAB    Panamanian Balboa",
        "PEN    Peruvian Nuevo Sol",
        "PGK    Papua New Guinean Kina",
        "PHP    Philippine Peso",
        "PKR    Pakistani Rupee",
        "PLN    Polish Zloty",
        "PYG    Paraguayan Guarani",
        "QAR    Qatari Rial",
        "RON    Romanian Leu",
        "RSD    Serbian Dinar",
        "RUB    Russian Ruble",
        "RWF    Rwandan Franc",
        "SAR    Saudi Riyal",
        "SBD    Solomon Islands Dollar",
        "SCR    Seychellois Rupee",
        "SDG    Sudanese Pound",
        "SEK    Swedish Krona",
        "SGD    Singapore Dollar",
        "SLL    Sierra Leonean Leone",
        "SOS    Somali Shilling",
        "SRD    Surinamese Dollar",
        "SVC    Salvadoran Colón",
        "SZL    Swazi Lilangeni",
        "THB    Thai Baht",
        "TJS    Tajikistani Somoni",
        "TMT    Turkmenistani Manat",
        "TND    Tunisian Dinar",
        "TOP    Tongan Paʻanga",
        "TRY    Turkish Lira",
        "TTD    Trinidad and Tobago Dollar",
        "TWD    New Taiwan Dollar",
        "TZS    Tanzanian Shilling",
        "UAH    Ukrainian Hryvnia",
        "UGX    Ugandan Shilling",
        "USD    United States Dollar",
        "UYU    Uruguayan Peso",
        "UZS    Uzbekistan Som",
        "VND    Vietnamese Dong",
        "XAF    CFA Franc BEAC",
        "XAG    Silver (troy ounce)",
        "XAU    Gold (troy ounce)",
        "XCD    East Caribbean Dollar",
        "XLM    Stellar Lumens",
        "XOF    CFA Franc BCEAO",
        "XRP    Ripple",
        "YER    Yemeni Rial",
        "ZAR    South African Rand",
        "ZMW    Zambian Kwacha"
        ]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
          return 1
      }
      
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(pickerView == pickerFrom) {
            return PickerSet.count
        } else {
            return PickerSet.count
        }
      }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(pickerView == pickerFrom) {
            return PickerSet[row]
        } else {
            return PickerSet[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(pickerView == pickerFrom){
            selectedFrom = PickerSet[row]
        }
        else if (pickerView == pickerTo){
            selectedTo = PickerSet[row]
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.destination is Convert) {
            let vc = segue.destination as? Convert
            vc?.currencyFrom = selectedFrom
            vc?.currencyTo = selectedTo
        }
    }

}

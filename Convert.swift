//
//  Convert.swift
//  Currency Convertor
//
//  Created by Utsav Negi on 6/18/20.
//  Copyright © 2020 CS50. All rights reserved.
//

import UIKit

class Convert: UIViewController {
    
    var currencyFrom : String!
    var currencyTo : String!
    var valueFrom : Float = 0.00
    var valueTo : Float!
    var intermediate : Float!
    
    
    @IBOutlet var currencyTitleFrom : UILabel!
    @IBOutlet var currencyTitleTo : UILabel!
    @IBOutlet var valueInput : UITextField!
    @IBOutlet var valueOutput : UITextField!
    
    let base : String = "USD"
    let website : String = "https://currencyapi.net/api/v1/rates?key="
    let key : String = "cwDKCJw4tNxDl3sLwzm1xXZyiVov9ROduwuH"
    
    var result: individualRate!
    var Array : [currencyRate] =
        [          currencyRate.init(currency: "AED    UAE Dirham", rate: 3.67),
                   currencyRate.init(currency: "AFN    Afghan Afghani", rate: 0.00),
                   currencyRate.init(currency: "ALL    Albanian Lek", rate: 0.00),
                   currencyRate.init(currency: "AMD    Armenian Dram", rate: 0.00),
                   currencyRate.init(currency: "ANG    Netherlands Antillean Guilder", rate: 0.00),
                   currencyRate.init(currency: "AOA    Angolan Kwanza", rate: 0.00),
                   currencyRate.init(currency: "ARS    Argentine Peso", rate: 0.00),
                   currencyRate.init(currency: "AUD    Australian Dollar", rate: 0.00),
                   currencyRate.init(currency: "AWG    Aruban Florin", rate: 0.00),
                   currencyRate.init(currency: "AZN    Azerbaijani Manat", rate: 0.00),
                   currencyRate.init(currency: "BAM    Bosnia-Herzegovina Conv.Mark", rate: 0.00),
                   currencyRate.init(currency: "BBD    Barbadian Dollar", rate: 0.00),
                   currencyRate.init(currency: "BCH    Bitcoin Cash", rate: 0.00),
                   currencyRate.init(currency: "BDT    Bangladeshi Taka", rate: 0.00),
                   currencyRate.init(currency: "BGN    Bulgarian Lev", rate: 0.00),
                   currencyRate.init(currency: "BHD    Bahraini Dinar", rate: 0.00),
                   currencyRate.init(currency: "BIF    Burundian Franc", rate: 0.00),
                   currencyRate.init(currency: "BMD    Bermudan Dollar", rate: 0.00),
                   currencyRate.init(currency: "BND    Brunei Dollar", rate: 0.00),
                   currencyRate.init(currency: "BOB    Bolivian Boliviano", rate: 0.00),
                   currencyRate.init(currency: "BRL    Brazilian Real", rate: 0.00),
                   currencyRate.init(currency: "BSD    Bahamian Dollar", rate: 0.00),
                   currencyRate.init(currency: "BTC    Bitcoin", rate: 0.00),
                   currencyRate.init(currency: "BTG    Bitcoin Gold", rate: 0.00),
                   currencyRate.init(currency: "BWP    Botswanan Pula", rate: 0.00),
                   currencyRate.init(currency: "BZD    Belize Dollar", rate: 0.00),
                   currencyRate.init(currency: "CAD    Canadian Dollar", rate: 0.00),
                   currencyRate.init(currency: "CDF    Congolese Franc", rate: 0.00),
                   currencyRate.init(currency: "CHF    Swiss Franc", rate: 0.00),
                   currencyRate.init(currency: "CLP    Chilean Peso", rate: 0.00),
                   currencyRate.init(currency: "CNH    Chinese Yuan (offshore)", rate: 0.00),
                   currencyRate.init(currency: "CNY    Chinese Yuan", rate: 0.00),
                   currencyRate.init(currency: "COP    Colombian Peso", rate: 0.00),
                   currencyRate.init(currency: "CRC    Costa Rican Colón", rate: 0.00),
                   currencyRate.init(currency: "CUC    Cuban Convertible Peso", rate: 0.00),
                   currencyRate.init(currency: "CUP    Cuban Peso", rate: 0.00),
                   currencyRate.init(currency: "CVE    Cape Verdean Escudo", rate: 0.00),
                   currencyRate.init(currency: "CZK    Czech Republic Koruna", rate: 0.00),
                   currencyRate.init(currency: "DASH    DASH", rate: 0.00),
                   currencyRate.init(currency: "DJF    Djiboutian Franc", rate: 0.00),
                   currencyRate.init(currency: "DKK    Danish Krone", rate: 0.00),
                   currencyRate.init(currency: "DOP    Dominican Peso", rate: 0.00),
                   currencyRate.init(currency: "DZD    Algerian Dinar", rate: 0.00),
                   currencyRate.init(currency: "EGP    Egyptian Pound", rate: 0.00),
                   currencyRate.init(currency: "EOS    EOS", rate: 0.00),
                   currencyRate.init(currency: "ETB    Ethiopian Birr", rate: 0.00),
                   currencyRate.init(currency: "ETH    Ethereum", rate: 0.00),
                   currencyRate.init(currency: "EUR    Euro", rate: 0.00),
                   currencyRate.init(currency: "FJD    Fijian Dollar", rate: 0.00),
                   currencyRate.init(currency: "GBP    British Pound Sterling", rate: 0.00),
                   currencyRate.init(currency: "GEL    Georgian Lari", rate: 0.00),
                   currencyRate.init(currency: "GHS    Ghanaian Cedi", rate: 0.00),
                   currencyRate.init(currency: "GIP    Gibraltar Pound", rate: 0.00),
                   currencyRate.init(currency: "GMD    Gambian Dalasi", rate: 0.00),
                   currencyRate.init(currency: "GNF    Guinean Franc", rate: 0.00),
                   currencyRate.init(currency: "GTQ    Guatemalan Quetzal", rate: 0.00),
                   currencyRate.init(currency: "GYD    Guyanaese Dollar", rate: 0.00),
                   currencyRate.init(currency: "HKD    Hong Kong Dollar", rate: 0.00),
                   currencyRate.init(currency: "HNL    Honduran Lempira", rate: 0.00),
                   currencyRate.init(currency: "HRK    Croatian Kuna", rate: 0.00),
                   currencyRate.init(currency: "HTG    Haitian Gourde", rate: 0.00),
                   currencyRate.init(currency: "HUF    Hungarian Forint", rate: 0.00),
                   currencyRate.init(currency: "IDR    Indonesian Rupiah", rate: 0.00),
                   currencyRate.init(currency: "ILS    Israeli New Sheqel", rate: 0.00),
                   currencyRate.init(currency: "INR    Indian Rupee", rate: 0.00),
                   currencyRate.init(currency: "IQD    Iraqi Dinar", rate: 0.00),
                   currencyRate.init(currency: "IRR    Iranian Rial", rate: 0.00),
                   currencyRate.init(currency: "ISK    Icelandic Króna", rate: 0.00),
                   currencyRate.init(currency: "JMD    Jamaican Dollar", rate: 0.00),
                   currencyRate.init(currency: "JOD    Jordanian Dinar", rate: 0.00),
                   currencyRate.init(currency: "JPY    Japanese Yen", rate: 0.00),
                   currencyRate.init(currency: "KES    Kenyan Shilling", rate: 0.00),
                   currencyRate.init(currency: "KGS    Kyrgystani Som", rate: 0.00),
                   currencyRate.init(currency: "KHR    Cambodian Riel", rate: 0.00),
                   currencyRate.init(currency: "KMF    Comorian Franc", rate: 0.00),
                   currencyRate.init(currency: "KRW    South Korean Won", rate: 0.00),
                   currencyRate.init(currency: "KWD    Kuwaiti Dinar", rate: 0.00),
                   currencyRate.init(currency: "KYD    Cayman Islands Dollar", rate: 0.00),
                   currencyRate.init(currency: "KZT    Kazakhstani Tenge", rate: 0.00),
                   currencyRate.init(currency: "LAK    Laotian Kip", rate: 0.00),
                   currencyRate.init(currency: "LBP    Lebanese Pound", rate: 0.00),
                   currencyRate.init(currency: "LKR    Sri Lankan Rupee", rate: 0.00),
                   currencyRate.init(currency: "LRD    Liberian Dollar", rate: 0.00),
                   currencyRate.init(currency: "LSL    Lesotho Loti", rate: 0.00),
                   currencyRate.init(currency: "LTC    Litecoin", rate: 0.00),
                   currencyRate.init(currency: "LYD    Libyan Dinar", rate: 0.00),
                   currencyRate.init(currency: "MAD    Moroccan Dirham", rate: 0.00),
                   currencyRate.init(currency: "MDL    Moldovan Leu", rate: 0.00),
                   currencyRate.init(currency: "MKD    Macedonian Denar", rate: 0.00),
                   currencyRate.init(currency: "MMK    Myanma Kyat", rate: 0.00),
                   currencyRate.init(currency: "MOP    Macanese Pataca", rate: 0.00),
                   currencyRate.init(currency: "MUR    Mauritian Rupee", rate: 0.00),
                   currencyRate.init(currency: "MVR    Maldivian Rufiyaa", rate: 0.00),
                   currencyRate.init(currency: "MWK    Malawian Kwacha", rate: 0.00),
                   currencyRate.init(currency: "MXN    Mexican Peso", rate: 0.00),
                   currencyRate.init(currency: "MYR    Malaysian Ringgit", rate: 0.00),
                   currencyRate.init(currency: "MZN    Mozambican Metical", rate: 0.00),
                   currencyRate.init(currency: "NAD    Namibian Dollar", rate: 0.00),
                   currencyRate.init(currency: "NGN    Nigerian Naira", rate: 0.00),
                   currencyRate.init(currency: "NIO    Nicaraguan Córdoba", rate: 0.00),
                   currencyRate.init(currency: "NOK    Norwegian Krone", rate: 0.00),
                   currencyRate.init(currency: "NPR    Nepalese Rupee", rate: 0.00),
                   currencyRate.init(currency: "NZD    New Zealand Dollar", rate: 0.00),
                   currencyRate.init(currency: "OMR    Omani Rial", rate: 0.00),
                   currencyRate.init(currency: "PAB    Panamanian Balboa", rate: 0.00),
                   currencyRate.init(currency: "PEN    Peruvian Nuevo Sol", rate: 0.00),
                   currencyRate.init(currency: "PGK    Papua New Guinean Kina", rate: 0.00),
                   currencyRate.init(currency: "PHP    Philippine Peso", rate: 0.00),
                   currencyRate.init(currency: "PKR    Pakistani Rupee", rate: 0.00),
                   currencyRate.init(currency: "PLN    Polish Zloty", rate: 0.00),
                   currencyRate.init(currency: "PYG    Paraguayan Guarani", rate: 0.00),
                   currencyRate.init(currency: "QAR    Qatari Rial", rate: 0.00),
                   currencyRate.init(currency: "RON    Romanian Leu", rate: 0.00),
                   currencyRate.init(currency: "RSD    Serbian Dinar", rate: 0.00),
                   currencyRate.init(currency: "RUB    Russian Ruble", rate: 0.00),
                   currencyRate.init(currency: "RWF    Rwandan Franc", rate: 0.00),
                   currencyRate.init(currency: "SAR    Saudi Riyal", rate: 0.00),
                   currencyRate.init(currency: "SBD    Solomon Islands Dollar", rate: 0.00),
                   currencyRate.init(currency: "SCR    Seychellois Rupee", rate: 0.00),
                   currencyRate.init(currency: "SDG    Sudanese Pound", rate: 0.00),
                   currencyRate.init(currency: "SEK    Swedish Krona", rate: 0.00),
                   currencyRate.init(currency: "SGD    Singapore Dollar", rate: 0.00),
                   currencyRate.init(currency: "SLL    Sierra Leonean Leone", rate: 0.00),
                   currencyRate.init(currency: "SOS    Somali Shilling", rate: 0.00),
                   currencyRate.init(currency: "SRD    Surinamese Dollar", rate: 0.00),
                   currencyRate.init(currency: "SVC    Salvadoran Colón", rate: 0.00),
                   currencyRate.init(currency: "SZL    Swazi Lilangeni", rate: 0.00),
                   currencyRate.init(currency: "THB    Thai Baht", rate: 0.00),
                   currencyRate.init(currency: "TJS    Tajikistani Somoni", rate: 0.00),
                   currencyRate.init(currency: "TMT    Turkmenistani Manat", rate: 0.00),
                   currencyRate.init(currency: "TND    Tunisian Dinar", rate: 0.00),
                   currencyRate.init(currency: "TOP    Tongan Paʻanga", rate: 0.00),
                   currencyRate.init(currency: "TRY    Turkish Lira", rate: 0.00),
                   currencyRate.init(currency: "TTD    Trinidad and Tobago Dollar", rate: 0.00),
                   currencyRate.init(currency: "TWD    New Taiwan Dollar", rate: 0.00),
                   currencyRate.init(currency: "TZS    Tanzanian Shilling", rate: 0.00),
                   currencyRate.init(currency: "UAH    Ukrainian Hryvnia", rate: 0.00),
                   currencyRate.init(currency: "UGX    Ugandan Shilling", rate: 0.00),
                   currencyRate.init(currency: "USD    United States Dollar", rate: 0.00),
                   currencyRate.init(currency: "UYU    Uruguayan Peso", rate: 0.00),
                   currencyRate.init(currency: "UZS    Uzbekistan Som", rate: 0.00),
                   currencyRate.init(currency: "VND    Vietnamese Dong", rate: 0.00),
                   currencyRate.init(currency: "XAF    CFA Franc BEAC", rate: 0.00),
                   currencyRate.init(currency: "XAG    Silver (troy ounce)", rate: 0.00),
                   currencyRate.init(currency: "XAU    Gold (troy ounce)", rate: 0.00),
                   currencyRate.init(currency: "XCD    East Caribbean Dollar", rate: 0.00),
                   currencyRate.init(currency: "XLM    Stellar Lumens", rate: 0.00),
                   currencyRate.init(currency: "XOF    CFA Franc BCEAO", rate: 0.00),
                   currencyRate.init(currency: "XRP    Ripple", rate: 0.00),
                   currencyRate.init(currency: "YER    Yemeni Rial", rate: 0.00),
                   currencyRate.init(currency: "ZAR    South African Rand", rate: 0.00),
                   currencyRate.init(currency: "ZMW    Zambian Kwacha", rate: 0.00)
    ]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        currencyTitleFrom.text = currencyFrom
        currencyTitleTo.text = currencyTo
        
        guard let url = URL(string: website + key) else {
            return
        }
        URLSession.shared.dataTask(with: url){ (data, response, error) in
            guard let data = data else {
                return
            }
            
            do {
                let entries = try JSONDecoder().decode(Rates.self, from: data)
                self.result = entries.rates
                self.Array[0].rate = self.result.AED
                self.Array[1].rate = self.result.AFN
                self.Array[2].rate = self.result.ALL
                self.Array[3].rate = self.result.AMD
                self.Array[4].rate = self.result.ANG
                self.Array[5].rate = self.result.AOA
                self.Array[6].rate = self.result.ARS
                self.Array[7].rate = self.result.AUD
                self.Array[8].rate = self.result.AWG
                self.Array[9].rate = self.result.AZN
                self.Array[10].rate = self.result.BAM
                self.Array[11].rate = self.result.BBD
                self.Array[12].rate = self.result.BCH
                self.Array[13].rate = self.result.BDT
                self.Array[14].rate = self.result.BGN
                self.Array[15].rate = self.result.BHD
                self.Array[16].rate = self.result.BIF
                self.Array[17].rate = self.result.BMD
                self.Array[18].rate = self.result.BND
                self.Array[19].rate = self.result.BOB
                self.Array[20].rate = self.result.BRL
                self.Array[21].rate = self.result.BSD
                self.Array[22].rate = self.result.BTC
                self.Array[23].rate = self.result.BTG
                self.Array[24].rate = self.result.BWP
                self.Array[25].rate = self.result.BZD
                self.Array[26].rate = self.result.CAD
                self.Array[27].rate = self.result.CDF
                self.Array[28].rate = self.result.CHF
                self.Array[29].rate = self.result.CLP
                self.Array[30].rate = self.result.CNH
                self.Array[31].rate = self.result.CNY
                self.Array[32].rate = self.result.COP
                self.Array[33].rate = self.result.CRC
                self.Array[34].rate = self.result.CUC
                self.Array[35].rate = self.result.CUP
                self.Array[36].rate = self.result.CVE
                self.Array[37].rate = self.result.CZK
                self.Array[38].rate = self.result.DASH
                self.Array[39].rate = self.result.DJF
                self.Array[40].rate = self.result.DKK
                self.Array[41].rate = self.result.DOP
                self.Array[42].rate = self.result.DZD
                self.Array[43].rate = self.result.EGP
                self.Array[44].rate = self.result.EOS
                self.Array[45].rate = self.result.ETB
                self.Array[46].rate = self.result.ETH
                self.Array[47].rate = self.result.EUR
                self.Array[48].rate = self.result.FJD
                self.Array[49].rate = self.result.GBP
                self.Array[50].rate = self.result.GEL
                self.Array[51].rate = self.result.GHS
                self.Array[52].rate = self.result.GIP
                self.Array[53].rate = self.result.GMD
                self.Array[54].rate = self.result.GNF
                self.Array[55].rate = self.result.GTQ
                self.Array[56].rate = self.result.GYD
                self.Array[57].rate = self.result.HKD
                self.Array[58].rate = self.result.HNL
                self.Array[59].rate = self.result.HRK
                self.Array[60].rate = self.result.HTG
                self.Array[61].rate = self.result.HUF
                self.Array[62].rate = self.result.IDR
                self.Array[63].rate = self.result.ILS
                self.Array[64].rate = self.result.INR
                self.Array[65].rate = self.result.IQD
                self.Array[66].rate = self.result.IRR
                self.Array[67].rate = self.result.ISK
                self.Array[68].rate = self.result.JMD
                self.Array[69].rate = self.result.JOD
                self.Array[70].rate = self.result.JPY
                self.Array[71].rate = self.result.KES
                self.Array[72].rate = self.result.KGS
                self.Array[73].rate = self.result.KHR
                self.Array[74].rate = self.result.KMF
                self.Array[75].rate = self.result.KRW
                self.Array[76].rate = self.result.KWD
                self.Array[77].rate = self.result.KYD
                self.Array[78].rate = self.result.KZT
                self.Array[79].rate = self.result.LAK
                self.Array[80].rate = self.result.LBP
                self.Array[81].rate = self.result.LKR
                self.Array[82].rate = self.result.LRD
                self.Array[83].rate = self.result.LSL
                self.Array[84].rate = self.result.LTC
                self.Array[85].rate = self.result.LYD
                self.Array[86].rate = self.result.MAD
                self.Array[87].rate = self.result.MDL
                self.Array[88].rate = self.result.MKD
                self.Array[89].rate = self.result.MMK
                self.Array[90].rate = self.result.MOP
                self.Array[91].rate = self.result.MUR
                self.Array[92].rate = self.result.MVR
                self.Array[93].rate = self.result.MWK
                self.Array[94].rate = self.result.MXN
                self.Array[95].rate = self.result.MYR
                self.Array[96].rate = self.result.MZN
                self.Array[97].rate = self.result.NAD
                self.Array[98].rate = self.result.NGN
                self.Array[99].rate = self.result.NIO
                self.Array[100].rate = self.result.NOK
                self.Array[101].rate = self.result.NPR
                self.Array[102].rate = self.result.NZD
                self.Array[103].rate = self.result.OMR
                self.Array[104].rate = self.result.PAB
                self.Array[105].rate = self.result.PEN
                self.Array[106].rate = self.result.PGK
                self.Array[107].rate = self.result.PHP
                self.Array[108].rate = self.result.PKR
                self.Array[109].rate = self.result.PLN
                self.Array[110].rate = self.result.PYG
                self.Array[111].rate = self.result.QAR
                self.Array[112].rate = self.result.RON
                self.Array[113].rate = self.result.RSD
                self.Array[114].rate = self.result.RUB
                self.Array[115].rate = self.result.RWF
                self.Array[116].rate = self.result.SAR
                self.Array[117].rate = self.result.SBD
                self.Array[118].rate = self.result.SCR
                self.Array[119].rate = self.result.SDG
                self.Array[120].rate = self.result.SEK
                self.Array[121].rate = self.result.SGD
                self.Array[122].rate = self.result.SLL
                self.Array[123].rate = self.result.SOS
                self.Array[124].rate = self.result.SRD
                self.Array[125].rate = self.result.SVC
                self.Array[126].rate = self.result.SZL
                self.Array[127].rate = self.result.THB
                self.Array[128].rate = self.result.TJS
                self.Array[129].rate = self.result.TMT
                self.Array[130].rate = self.result.TND
                self.Array[131].rate = self.result.TOP
                self.Array[132].rate = self.result.TRY
                self.Array[133].rate = self.result.TTD
                self.Array[134].rate = self.result.TWD
                self.Array[135].rate = self.result.TZS
                self.Array[136].rate = self.result.UAH
                self.Array[137].rate = self.result.UGX
                self.Array[138].rate = self.result.USD
                self.Array[139].rate = self.result.UYU
                self.Array[140].rate = self.result.UZS
                self.Array[141].rate = self.result.VND
                self.Array[142].rate = self.result.XAF
                self.Array[143].rate = self.result.XAG
                self.Array[144].rate = self.result.XAU
                self.Array[145].rate = self.result.XCD
                self.Array[146].rate = self.result.XLM
                self.Array[147].rate = self.result.XOF
                self.Array[148].rate = self.result.XRP
                self.Array[149].rate = self.result.YER
                self.Array[150].rate = self.result.ZAR
                self.Array[151].rate = self.result.ZMW
            }
            catch let error {
                print(error)
            }
            
        }.resume()
    }
    
    @IBAction func Convertor() {
        valueFrom = (valueInput.text! as NSString).floatValue
               
               for check in Array {
                   if check.currency == currencyFrom {
                    print(check.rate)
                       intermediate = valueFrom / check.rate
                   }
               }
               
               for check in Array {
                   if check.currency == currencyTo {
                       valueTo = intermediate * check.rate
                   }
               }
               
               valueOutput.text = String(valueTo)
    }
    
}


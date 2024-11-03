//
//  MarketDataModel.swift
//  SwiftfulCrypto
//
//  Created by Shreya Pallan on 30/10/24.
//

import Foundation


/*
 
 URL: https://api.coingecko.com/api/v3/global
 
 JSON Response:
 
 {
   "data": {
     "active_cryptocurrencies": 15066,
     "upcoming_icos": 0,
     "ongoing_icos": 49,
     "ended_icos": 3376,
     "markets": 1143,
     "total_market_cap": {
       "btc": 35207856.5549535,
       "eth": 954938402.798497,
       "ltc": 35217059648.6038,
       "bch": 6715008383.85928,
       "bnb": 4224344584.91812,
       "eos": 5450435779522.49,
       "xrp": 4867746707069.85,
       "xlm": 26536336422134.1,
       "link": 213629665925.616,
       "dot": 606518263145.555,
       "yfi": 509523829.813407,
       "usd": 2550953965310.39,
       "aed": 9369628405045.42,
       "ars": 2519762915476208,
       "aud": 3879128554980.97,
       "bdt": 304209706571843,
       "bhd": 961668829658.571,
       "bmd": 2550953965310.39,
       "brl": 14697576366532.4,
       "cad": 3547060673500.64,
       "chf": 2210786804990.22,
       "clp": 2.42947996599049e+15,
       "cny": 18171720571888.6,
       "czk": 59669874393368.5,
       "dkk": 17556685570852.2,
       "eur": 2353382580697.1,
       "gbp": 1959170909667.86,
       "gel": 6964104325297.36,
       "hkd": 19823080621332.2,
       "huf": 954235898258762,
       "idr": 40047654507198770,
       "ils": 9489431407072.24,
       "inr": 214493135191222,
       "jpy": 390603346645311,
       "krw": 3508424161980781,
       "kwd": 781943918986.594,
       "lkr": 747594749879049,
       "mmk": 5351901419221211,
       "mxn": 51125068892512.5,
       "myr": 11174453845042.2,
       "ngn": 4187569500834564,
       "nok": 27844098744491,
       "nzd": 4256401891680.53,
       "php": 148471913471702,
       "pkr": 706954754828176,
       "pln": 10200861856549.7,
       "rub": 247710147562747,
       "sar": 9580834638603.29,
       "sek": 27113962149585.9,
       "sgd": 3374993726632.54,
       "thb": 85935261706393.6,
       "try": 87477060833981.4,
       "twd": 81497111997546.6,
       "uah": 105275875302359,
       "vef": 255427020546.53,
       "vnd": 64589314785772750,
       "zar": 44762482063189.3,
       "xdr": 1913457814609.5,
       "xag": 74626933797.2521,
       "xau": 916659797.894635,
       "bits": 35207856554953.5,
       "sats": 3.52078565549535e+15
     },
     "total_volume": {
       "btc": 1842168.78775935,
       "eth": 49964919.5378428,
       "ltc": 1842650318.12025,
       "bch": 351347115.80582,
       "bnb": 221028955.026844,
       "eos": 285181310513.789,
       "xrp": 254693466967.697,
       "xlm": 1388451768486.3,
       "link": 11177672860.9814,
       "dot": 31734650242.8748,
       "yfi": 26659643.2656111,
       "usd": 133472702792.088,
       "aed": 490243902628.31,
       "ars": 131840704025781,
       "aud": 202966333282.411,
       "bdt": 15917061736075.4,
       "bhd": 50317073389.3723,
       "bmd": 133472702792.088,
       "brl": 769016324406.892,
       "cad": 185591657669.152,
       "chf": 115674251347.465,
       "clp": 127116859751141,
       "cny": 950792798339.435,
       "czk": 3122086685550.28,
       "dkk": 918612529696.264,
       "eur": 123135241960.84,
       "gbp": 102509037834.865,
       "gel": 364380478622.399,
       "hkd": 1037196352491.89,
       "huf": 49928162630067.4,
       "idr": 2095399901467510,
       "ils": 496512314642.237,
       "inr": 11222851871745.8,
       "jpy": 20437406987875.9,
       "krw": 183570092525626,
       "kwd": 40913387586.8586,
       "lkr": 39116147612405.1,
       "mmk": 280025730457800,
       "mxn": 2674999713170.06,
       "myr": 584677174580.74,
       "ngn": 219104784722406,
       "nok": 1456877374807.81,
       "nzd": 222706278661.845,
       "php": 7768445785092.69,
       "pkr": 36989754876722.4,
       "pln": 533736249778.516,
       "rub": 12960854391664.3,
       "sar": 501294775055.981,
       "sek": 1418674684341.96,
       "sgd": 176588656920.421,
       "thb": 4496361675308.44,
       "try": 4577032710348.69,
       "twd": 4264145866990.77,
       "uah": 5508314068575.87,
       "vef": 13364621730.5717,
       "vnd": 3379484903757200,
       "zar": 2342092231338.74,
       "xdr": 100117207000.831,
       "xag": 3904679853.28518,
       "xau": 47962081.0213087,
       "bits": 1842168787759.35,
       "sats": 184216878775935
     },
     "market_cap_percentage": {
       "btc": 56.1665259525737,
       "eth": 12.6084157201928,
       "usdt": 4.72277475356256,
       "bnb": 3.45353283395216,
       "sol": 3.29209646655829,
       "usdc": 1.36702757299635,
       "xrp": 1.16710008017246,
       "steth": 1.01985825273005,
       "doge": 0.997239168528894,
       "trx": 0.569080072156114
     },
     "market_cap_change_percentage_24h_usd": 0.320465699863567,
     "updated_at": 1730277485
   }
 }
 */


// MARK: - Welcome
struct GlobalData: Codable {
    let data: MarketDataModel?
}

// MARK: - DataClass
struct MarketDataModel: Codable {
   
    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
    let marketCapChangePercentage24HUsd: Double
    
    enum CodingKeys: String, CodingKey {
        case totalMarketCap = "total_market_cap"
        case totalVolume = "total_volume"
        case marketCapPercentage = "market_cap_percentage"
        case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
    }
    
    var marketCap: String {
        if let item = totalMarketCap.first(where: { $0.key == "usd" }) {
            return "$ \(item.value.formattedWithAbbreviations())"
        }
       return ""
    }
    
    var volume: String {
        if let item = totalMarketCap.first(where: { $0.key == "usd" }) {
            return "$ \(item.value.formattedWithAbbreviations())"
        }
       return ""
    }
    
    var btcDoinance: String {
        if let item = marketCapPercentage.first(where: { $0.key == "btc" }) {
            return item.value.asPercentString()
        }
       return ""
    }
    
}

//
//  Country.swift
//  Project13-15
//
//  Created by Eddie Jung on 8/20/21.
//

import Foundation

struct Country: Codable {
    let name: String
    let capital: String
    let region: String
    let population: Int
    let timezones: [String]
    let currencies: [Currency]
    let languages: [Language]
    let flag: String
    
    struct Currency: Codable {
        let code: String?
        let name: String?
        let symbol: String?
    }
    
    struct Language: Codable {
        let iso639_1: String?
        let iso639_2: String
        let name: String
        let nativeName: String
    }
}

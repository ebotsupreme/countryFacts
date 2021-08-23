//
//  DetailViewController.swift
//  Project13-15
//
//  Created by Eddie Jung on 8/23/21.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var flagImageView: UIImageView!
    @IBOutlet var capitalLabel: UILabel!
    @IBOutlet var regionLabel: UILabel!
    @IBOutlet var populationLabel: UILabel!
    @IBOutlet var timezoneLabel: UILabel!
    @IBOutlet var currencyLabel: UILabel!
    @IBOutlet var languageLabel: UILabel!
    
    var details: Country?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(details as Any)
        
        displayInfo()
        
    }
    
    func displayInfo() {
        if let country = details {
            nameLabel.text = country.name
            capitalLabel.text = country.capital
            regionLabel.text = country.region
            populationLabel.text = String(country.population)
            timezoneLabel.text = country.timezones[0]
            currencyLabel.text = country.currencies[0].name
            languageLabel.text = country.languages[0].name
        }
    }

}

//
//  ViewController.swift
//  Project13-15
//
//  Created by Eddie Jung on 8/20/21.
//

import UIKit

class ViewController: UITableViewController {
    var countries = [Country]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries.append(Country(name: "afganistan", capital: "kabul", region: "asia", population: 100000, flag: "https://restcountries.eu/data/afg.svg"))
        countries.append(Country(name: "usa", capital: "Washington DC", region: "america", population: 366000000, flag: "https://restcountries.eu/data/usa.svg"))
        
        let urlString = "https://restcountries.eu/rest/v2/all"
        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                parse(json: data)
            } else {
                print("Failed to load countries.")
            }
        } else {
            print("Failed to load url.")
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Country", for: indexPath)
        let country = countries[indexPath.row]
        cell.textLabel?.text = country.name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            let country = countries[indexPath.row]
            vc.details = country
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func parse(json: Data) {
        let decoder = JSONDecoder()
        if let jsonCountries = try? decoder.decode([Country].self, from: json) {
            countries = jsonCountries
        } else {
            print("Failed to load countries.")
        }
    }

}


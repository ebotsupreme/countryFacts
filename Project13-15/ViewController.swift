//
//  ViewController.swift
//  Project13-15
//
//  Created by Eddie Jung on 8/20/21.
//

import UIKit
import WebKit

class ViewController: UITableViewController {
    var countries = [Country]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Country Facts"
        
        fetchDataFromURL()
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
    
    func fetchDataFromURL() {
        DispatchQueue.global().async { [weak self] in
            let urlString = "https://restcountries.eu/rest/v2/all"
            
            if let url = URL(string: urlString) {
                if let data = try? Data(contentsOf: url) {
                    self?.parse(json: data)
                } else {
                    print("Failed to load countries.")
                }
            } else {
                print("Failed to load url.")
            }
        }
        
    }
    
    func parse(json: Data) {
        let decoder = JSONDecoder()
        do {
            let jsonCountries = try decoder.decode([Country].self, from: json)
            DispatchQueue.main.async { [weak self] in
                self?.countries = jsonCountries
                self?.tableView.reloadData()
            }
            
        } catch let error {
            print("Failed to decode countries \(error)")
        }
    }

}


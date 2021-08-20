//
//  DetailViewController.swift
//  Project13-15
//
//  Created by Eddie Jung on 8/20/21.
//

import UIKit

class DetailViewController: UITableViewController {

    var details: Country?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Details"

        print("DetailsView details: \(details)")
    }


}

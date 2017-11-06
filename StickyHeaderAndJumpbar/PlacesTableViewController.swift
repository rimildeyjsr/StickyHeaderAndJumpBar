//
//  PlacesTableViewController.swift
//  StickyHeaderAndJumpbar
//
//  Created by Rimil Dey on 06/11/17.
//  Copyright © 2017 Rimil Dey. All rights reserved.
//

import UIKit

class PlacesTableViewController: UITableViewController {

    // MARK: - view did load
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // MARK: - properties
    
    let alphabetArray = Array(model.places.keys).sorted{
        $1 > $0
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
         
        return model.places.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let letter = alphabetArray[section]
        return model.places[letter]!.count
        
        /*switch section {
        case 0...14: return model.places[letter]!.count
        default: return 1
        }*/
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "placesCell", for: indexPath)

        let letter = alphabetArray[indexPath.section]
        cell.textLabel?.text = model.places[letter]?[indexPath.row]
        
        /*switch indexPath.section {
        case 0...14: cell.textLabel?.text = model.places[letter]?[indexPath.row]
        default: break
        }*/

        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let letter = alphabetArray[section]
        return letter
        /*switch section {
        case 0...14: return letter
        default: return letter
        }*/
    }
    
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
         return alphabetArray
    }
}

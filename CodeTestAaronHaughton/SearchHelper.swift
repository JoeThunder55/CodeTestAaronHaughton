//
//  SearchHelper.swift
//  CodeTestAaronHaughton
//
//  Created by Aaron on 12/21/18.
//  Copyright © 2018 Service Fusion. All rights reserved.
//

import UIKit
import RealmSwift


//MARK: - Search Bar Methods
extension ViewController: UISearchBarDelegate {
    
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
       
         contactAttribs = contactAttribs.filter("firstName CONTAINS[cd] %@", searchBar.text!).sorted(byKeyPath: "firstName", ascending: true)
         self.tableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0 {
           readRealm()
            
        } else {
            contactAttribs = contactAttribs.filter("firstName BEGINSWITH[cd] %@ OR lastName BEGINSWITH[cd] %@ OR phoneNumber BEGINSWITH[cd] %@", searchBar.text!, searchBar.text!, searchBar.text!).sorted(byKeyPath: "firstName", ascending: true)
            self.tableView.reloadData()
        }
    }


}

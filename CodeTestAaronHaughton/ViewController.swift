//
//  ViewController.swift
//  CodeTestAaronHaughton
//
//  Created by Aaron on 12/19/18.
//  Copyright © 2018 Service Fusion. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    var notificationToken: NotificationToken?
    var contactAttribs: Results<ContactAttrib>!
    let realm = RealmService.shared.realm
    
//    var selectedCategory : ContactAttrib? {
//        didSet {
//            loadItems()
//        }
//    }
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    @IBOutlet weak var tableView: UITableView!
    

    @IBAction func addButton(_ sender: Any) {
        AlertService.addAlert(in: self) { (firstName, lastName, phoneNumber, dob, address, email) in
            
            let newContactAttrib = ContactAttrib(firstName: firstName, lastName: lastName, phoneNumber: phoneNumber, dob: dob, address: address, email: email)
            RealmService.shared.create(newContactAttrib)
        }
    }
    
    func readRealm() {
        
        contactAttribs = realm.objects(ContactAttrib.self)
        self.tableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       readRealm()
        
        notificationToken = realm.observe { (notification, realm) in
            self.tableView.reloadData()
        }
        RealmService.shared.observeRealmErrors(in: self) { (error) in
            //handle error
            print(error ?? "no error detected")
        }
        
        
        tableView.delegate = self
        tableView.dataSource = self
    }

        override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        notificationToken?.invalidate()
        RealmService.shared.stopObservingErrors(in: self)
    }

    
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactAttribs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ContactListCell") as? ContactListCell else { return UITableViewCell() }
        
        let contactAttrib = contactAttribs[indexPath.row]
        cell.configure(with: contactAttrib)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 63
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected")
        let contactAttrib = contactAttribs[indexPath.row]
        
        AlertService.updateAlert(in: self, contactAttrib: contactAttrib) { (firstName, lastName, phoneNumber, dob, address, email) in
            let dict: [String: Any?] = ["firstName":firstName, "lastName":lastName, "phoneNumber":phoneNumber, "dob":dob, "address":address, "email":email]
            
            RealmService.shared.update(contactAttrib, with: dict)
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        let contactAttrib = contactAttribs[indexPath.row]
        
        RealmService.shared.delete(contactAttrib)
    }
}


    
    



//
//  AlertService.swift
//  CodeTestAaronHaughton
//
//  Created by Aaron on 12/19/18.
//  Copyright © 2018 Service Fusion. All rights reserved.
//

import UIKit

class AlertService {
    
    private init() {}
    
    static func addAlert(in vc: UIViewController,
                         completion: @escaping (String, String, String, String?, String?, String?) -> Void) {
        
        let alert = UIAlertController(title: "Add Contact", message: nil, preferredStyle: .alert)
        alert.addTextField { (firstNameTF) in
            firstNameTF.placeholder = "First Name"
        }
        alert.addTextField { (lastNameTF) in
            lastNameTF.placeholder = "Last Name"
        }
        alert.addTextField { (phoneNumberTF) in
            phoneNumberTF.placeholder = "Phone Number"
        }
        alert.addTextField { (dobTF) in
            dobTF.placeholder = "Date of Birth (Optional)"
        }
        alert.addTextField { (addressTF) in
            addressTF.placeholder = "Address (Optional)"
        }
        alert.addTextField { (emailTF) in
            emailTF.placeholder = "Email (Optional)"
        }
        
        let action = UIAlertAction(title: "Add", style: .default) { (_) in
            guard let firstNameString = alert.textFields?.first?.text,
                let lastNameString = alert.textFields?[1].text,
                let phoneNumberString = alert.textFields?[2].text,
                let dobString = alert.textFields?[3].text,
                let addressString = alert.textFields?[4].text,
                let emailString = alert.textFields?.last?.text
                else { return }
            
            let firstName = firstNameString
            let lastName = lastNameString
            let phoneNumber = phoneNumberString
            let dob = dobString == "" ? nil : dobString
            let address = addressString == "" ? nil : addressString
            let email = emailString == "" ? nil : emailString
            
            completion(firstName, lastName, phoneNumber, dob, address, email)
            
            
        }
        
        alert.addAction(action)
        vc.present(alert, animated: true)
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
    }
    
    static func updateAlert(in vc: UIViewController,
                            contactAttrib: ContactAttrib,
                            completion: @escaping (String, String, String, String?, String?, String?) -> Void) {
        
        let alert = UIAlertController(title: "Update Line", message: nil, preferredStyle: .alert)
        alert.addTextField { (firstNameTF) in
            firstNameTF.placeholder = "Enter updated first name"
            firstNameTF.text = contactAttrib.firstName
        }
        alert.addTextField { (lastNameTF) in
            lastNameTF.placeholder = "Enter updated last name"
            lastNameTF.text = contactAttrib.lastName
        }
        alert.addTextField { (phoneNumberTF) in
            phoneNumberTF.placeholder = "Enter updated phone #"
            phoneNumberTF.text = contactAttrib.phoneNumber
        }
        alert.addTextField { (dobTF) in
            dobTF.placeholder = "Enter updated DOB"
            dobTF.text = contactAttrib.dob
        }
        alert.addTextField { (addressTF) in
            addressTF.placeholder = "Enter updated addres"
            addressTF.text = contactAttrib.address
        }
        alert.addTextField { (emailTF) in
            emailTF.placeholder = "Enter updated Email"
            emailTF.text = contactAttrib.email
        }
        
        let action = UIAlertAction(title: "Update", style: .default) { (_) in
            guard let firstNameString = alert.textFields?.first?.text,
                let lastNameString = alert.textFields?[1].text,
                let phoneNumberString = alert.textFields?[2].text,
                let dobString = alert.textFields?[3].text,
                let addressString = alert.textFields?[4].text,
                let emailString = alert.textFields?.last?.text
                else { return }
            
            let firstName = firstNameString
            let lastName = lastNameString
            let phoneNumber = phoneNumberString
            let dob = dobString == "" ? nil : dobString
            let address = addressString == "" ? nil : addressString
            let email = emailString == "" ? nil : emailString
            
            completion(firstName, lastName, phoneNumber, dob, address, email)
        }
        
        alert.addAction(action)
        vc.present(alert, animated: true)
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
    }
    
}

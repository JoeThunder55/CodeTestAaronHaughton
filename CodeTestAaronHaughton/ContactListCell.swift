//
//  ContactListCell.swift
//  CodeTestAaronHaughton
//
//  Created by Aaron on 12/19/18.
//  Copyright © 2018 Service Fusion. All rights reserved.
//

import UIKit

class ContactListCell: UITableViewCell {
    
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    func configure(with contactAttrib: ContactAttrib) {
        fullNameLabel.text = contactAttrib.firstName + " " +  contactAttrib.lastName
        phoneNumberLabel.text = contactAttrib.phoneNumber
    }
    
}

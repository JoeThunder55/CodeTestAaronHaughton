//
//  ContactList.swift
//  CodeTestAaronHaughton
//
//  Created by Aaron on 12/19/18.
//  Copyright © 2018 Service Fusion. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers class ContactAttrib: Object {
   
    dynamic var firstName: String = ""
    dynamic var lastName: String = ""
    dynamic var phoneNumber: String = ""
    dynamic var dob: String? = ""
    dynamic var address: String? = ""
    dynamic var email: String? = ""
    
    convenience init(firstName: String, lastName: String, phoneNumber: String, dob: String?, address: String?, email: String?) {
        self.init()
        self.firstName = firstName
        self.lastName = lastName
        self.phoneNumber = phoneNumber
        self.dob = dob
        self.address = address
        self.email = email
        
    }
    
    
    
}

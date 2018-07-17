//
//  Classification.swift
//  Field Survey
//
//  Created by Hayden on 7/15/18.
//  Copyright © 2018 Harrill, Hayden. All rights reserved.
//

import UIKit

enum Classification: String {
    case amphibian
    case bird
    case fish
    case insect
    case mammal
    case plant
    case reptile
    
    var image: UIImage? {
        return UIImage(named: self.rawValue + "Icon")
    }
}

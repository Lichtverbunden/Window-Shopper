//
//  Wage.swift
//  Window-Shopper
//
//  Created by Ken Krippeler on 15.08.17.
//  Copyright © 2017 Lichtverbunden. All rights reserved.
//

import Foundation

class Wage
{
    class func getHours(forWage wage: Double, andPrice price: Double) -> Int
    {
        return Int(ceil(price / wage))
    }
}

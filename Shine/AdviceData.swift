//
//  AdviceData.swift
//  Shine
//
//  Created by Kamil Caglar on 10/11/2022.
//

import Foundation

struct AdviceSlip: Codable {
    let slip: Slip
}

struct Slip: Codable {
    let advice: String
    let id: Int
}

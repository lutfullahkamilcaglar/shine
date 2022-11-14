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

struct SlipQuestion: Codable {
    let total_results: String
    let query: String
    let slips: [Slips]
}

struct Slips: Codable {
    let id: Int
    let advice: String
    let date: String
}



    

//
//  Postresponse.swift
//  TestAssignment
//
//  Created by Hitexa Kakadiya on 27/05/24.
//

import Foundation

struct PostResponse : Decodable {

    let userId: Int?
    let id: Int?
    let title: String?
    let body: String?
}

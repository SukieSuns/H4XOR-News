//
//  PostData.swift
//  H4XOR News
//
//  Created by Administrator on 12/24/22.
//

import Foundation


struct Results: Decodable {
    let hits:[Post]
}

struct Post: Decodable, Identifiable {
    var id: String{
        return objectID
    }
    let objectID: String
    let title: String
    let points: Int
    let url: String?
}

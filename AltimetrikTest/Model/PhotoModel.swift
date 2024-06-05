//
//  PhotoModel.swift
//  AltimetrikTest
//
//  Created by Abraham Escamilla Pinelo on 05/06/24.
//

import Foundation

struct PhotoModel: Codable {
    var albumId: Int
    var id: Int
    var title: String
    var url: String
    var thumbnailUrl: String
    
    init(albumId: Int, id: Int, title: String, url: String, thumbnailUrl: String) {
        self.albumId = albumId
        self.id = id
        self.title = title
        self.url = url
        self.thumbnailUrl = thumbnailUrl
    }
    
    init() {
        self.albumId = -1
        self.id = -1
        self.title = ""
        self.url = ""
        self.thumbnailUrl = ""
    }
    
}

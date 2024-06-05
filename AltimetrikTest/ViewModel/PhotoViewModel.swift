//
//  PhotoViewModel.swift
//  AltimetrikTest
//
//  Created by Abraham Escamilla Pinelo on 05/06/24.
//

import Foundation
import UIKit.UIImage
import Combine

class PhotoViewModel: ObservableObject {
    var model: PhotoModel = PhotoModel()
    @Published var title: String = ""
    var thumbnailUrlString: String = ""
    @Published var image: UIImage?
    @Published var errorMessage: String = ""
    private let network = Network()
    
    func getPhotosObjects(completion: (() -> Void)? = nil ) {
        guard let url = URL(string: self.network.mainUrlString) else {
            return
        }
        self.network.fetch(with: url) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let photos):
                    guard let randomPhoto = photos.randomElement() else {
                        return
                    }
                    self.model = randomPhoto
                    self.title = randomPhoto.title
                case .failure(let error):
                    self.errorMessage = error.description
                }
                completion?()
            }
            
        }
    }
    
    func getImage(completion: (() -> Void)? = nil ) {
        guard let url = URL(string: model.thumbnailUrl) else {
            return
        }
        network.fetchImage(with: url) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let newImage):
                    self.image = newImage
                case .failure(let error):
                    self.errorMessage = error.description
                }
                completion?()
            }
        }
    }
    
    
    init() {
        
    }
}

//
//  ContentView.swift
//  AltimetrikTest
//
//  Created by Abraham Escamilla Pinelo on 05/06/24.
//

import SwiftUI
import UIKit.UIImage

struct ContentView: View {
    let network = Network()
    @ObservedObject var viewModel: PhotoViewModel
    
    var body: some View {
        VStack {
            Button {
                //
                viewModel.getPhotosObjects {
                    viewModel.getImage()
                }
            } label: {
                Text("Get Image from API")
            }
            
            if let newImage = viewModel.image {
                Image(uiImage: newImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.top, 20)
            } else {
                Image(systemName: "nosign.app.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.top, 20)
            }
            
            Text(viewModel.title)
            Text(viewModel.errorMessage)
        }
        .padding()
    }
}

//#Preview {
//    ContentView()
//}

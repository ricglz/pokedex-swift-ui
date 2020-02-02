//
//  URLImage.swift
//  Pokedex
//
//  Created by Ricardo J. González on 02/02/20.
//  Copyright © 2020 Ricardo González Castillo. All rights reserved.
//

import SwiftUI

final class ImageLoader : ObservableObject {
    @Published var image: Image?

    init(url imageUrl: String) {
        self.image = nil
        print(imageUrl)

        guard let url = URL(string: imageUrl) else { return }
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            if let unwrappedData = data {
                DispatchQueue.main.async {
                    self.image = Image(uiImage: UIImage(data: unwrappedData) ?? UIImage(systemName: "photo")!)
                }
            } else {
                print(err?.localizedDescription as Any)
            }
        }.resume()
    }
}

struct URLImage: View {
    let placeholder: Image

    @ObservedObject private var loader: ImageLoader

    init(_ url: String, placeholder: Image = Image(systemName: "photo")) {
        self.loader = ImageLoader(url: url)
        self.placeholder = placeholder
    }

    var body: some View {
        loader.image != nil ? loader.image!.resizable() : placeholder.resizable()
    }
}

struct URLImage_Previews: PreviewProvider {
    static var previews: some View {
        URLImage("https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fi.ytimg.com%2Fvi%2F3a166EbHNJY%2Fmaxresdefault.jpg&f=1&nofb=1")
            .frame(width: 150, height: 150)
    }
}

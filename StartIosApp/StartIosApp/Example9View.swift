//
//  Example9View.swift
//  StartIosApp
//
//  Created by adsloader on 2020/04/04.
//  Copyright © 2020 adsloader. All rights reserved.
//

import SwiftUI

// original blog
// http://www.gfrigerio.com/remote-images-in-swiftui/
// 잔소리 : info.plist에서 http 보안설정 필수
class ImageLoader: ObservableObject {
    @Published var dataIsValid = false
    var data:Data?

    init(urlString:String) {
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.dataIsValid = true
                self.data = data
            }
        }
        task.resume()
    }
}

struct Example9View: View {
    
    @ObservedObject var imageLoader:ImageLoader
    
    init(url:String) {
        imageLoader = ImageLoader(urlString:url)
    }

    // ImageView
    func imageFromData(_ data:Data) -> UIImage {
        UIImage(data: data) ?? UIImage()
    }

    var body: some View {
        VStack {
            Image(uiImage: imageLoader.dataIsValid ? imageFromData(imageLoader.data!) : UIImage())
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:200, height:200)
        }
    }
}

struct Example9View_Previews: PreviewProvider {
    static var previews: some View {
        Example9View(url: "https://www.google.com/logos/doodles/2020/stay-home-save-lives-6753651837108752-law.gif")
    }
}

//
//  Example13View.swift
//  StartIosApp
//
//  Created by adsloader on 2020/04/20.
//  Copyright © 2020 adsloader. All rights reserved.
//

import SwiftUI

struct Example13View: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        Text("길게 누르세요")
        .contextMenu {
            Button(action: {
                if let url = URL(string: "http://vintageappmaker.com") {
                    // url 열기
                    UIApplication.shared.open(url)
                }
            }) {
                Text("웹사이트 이동")
                Image(systemName: "paperplane.fill")
            }

            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("뒤로가기")
                Image(systemName: "xmark.square.fill")
            }
        }
    }
}

struct Example13View_Previews: PreviewProvider {
    static var previews: some View {
        Example13View()
    }
}

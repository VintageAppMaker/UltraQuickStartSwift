//
//  Example10View.swift
//  StartIosApp
//
//  Created by adsloader on 2020/04/04.
//  Copyright © 2020 adsloader. All rights reserved.
//

import SwiftUI
import WebKit

// UIKit을 사용할 경우, UIViewRepresentable를 상속구현
struct WebView: UIViewRepresentable {
    @Binding var sUrl : String
    let webView = WKWebView()
    func makeUIView(context: Context) -> WKWebView {
        return webView
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        if let url = URL (string : sUrl){
            let req = URLRequest(url : url)
            webView.load(req)
        }
    }
}

struct Example10View: View {
    @State var sURL : String = ""
    var body: some View {
        VStack{
            Button(action: { self.sURL = "http://vintageappmaker.com"}){
                Text("click! Navigate Page")
            }
            WebView(sUrl: $sURL)
        }
    }
}

struct Example10View_Previews: PreviewProvider {
    static var previews: some View {
        Example10View()
    }
}

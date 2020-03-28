//
//  Example1.swift
//  StartIosApp
//
//  Created by adsloader on 2020/03/28.
//  Copyright © 2020 adsloader. All rights reserved.
//

import SwiftUI

struct Example1View: View {
    @State var text = "UITextView를 UIViewRepresentable로 wrapping해서 사용함"
    
    var body: some View {
        uiKitText(text: $text)
    }
}

struct Example1_Previews: PreviewProvider {
    static var previews: some View {
        Example1View()
    }
}

// UIKit에 있는 View를 사용하기
// makeUIView와 updateUIView를 구현해야 한다.
// 1. UIViewRepresentable을 상속
// 2. makeUIView, updateUIView 구현
struct uiKitText: UIViewRepresentable {
    @Binding var text: String

    func makeUIView(context: Context) -> UITextView {
        return UITextView()
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
        uiView.textColor = UIColor.gray
    }
}

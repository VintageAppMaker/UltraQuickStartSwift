//
//  Example1.swift
//  StartIosApp
//
//  Created by adsloader on 2020/03/28.
//  Copyright © 2020 adsloader. All rights reserved.
//

import SwiftUI

struct Example1View: View {
    @State var mytext = "UITextView를 UIViewRepresentable로 wrapping해서 사용함"
    
    struct item{
        var id = UUID()
        var title : String
    }
    
    let lst  : [item]   = [item( title : "A"), item( title : "B"), item( title : "C"), item( title : "C")]
    let lst2 : [String] = ["중복", "중복", "중복", "중복"]
    
    var body: some View {
        
        return VStack{
            
            // List 또는 ForEach에서는 2번째 파라메터로 Uniq한 값을 전달해주어야 한다.
            // id :.\self는 유니크값이 없어도 되는 경우이다. 모든 배열이 가능하다.
            // id :.\특정필드는 유니크값을 지정하는 경우이다. struct를 정의하고 id 값을 var id = UUID()로 정의해야한다.
            //     item을 구분하기 위한 특정필드를 약속하는 것이다. 값이 중복되도 에러는 안난다.
            List(lst, id: \.title){ nItem in
                Text("\(nItem.title)")
                .font(.title)
                .bold()
                .padding(.all, 4.0)
            }
            
            List(lst2, id: \.self){ str in
                Text("\(str)")
                .font(.title)
                .bold()
                .padding(.all, 4.0)
            }
            
            // UIKit와 양방향 binding 예제를 위한 뜬금포
            uiKitText(text : $mytext)
        }
        
        
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

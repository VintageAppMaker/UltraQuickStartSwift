//
//  Example14View.swift
//  StartIosApp
//
//  Created by adsloader on 2020/04/23.
//  Copyright © 2020 adsloader. All rights reserved.
//

import SwiftUI

struct Example14View: View {
    var body: some View {
        VStack{
            Text("First").modifier(roundText(c: Color.white))
            Text("Second").modifier(roundText(c: Color.red))
            
            CardBackgroud(hdr : "메뉴버튼"){
                Button(action : {}){
                    Text("A")
                }
                Button(action : {}){
                    Text("B")
                }
            }
            
        }
        
    }
    
    // 수정자 프로토콜 구현
    // 모든 수정자는 실행되는 순서가 중요하다.
    struct roundText : ViewModifier{
        var color = Color.red
        init (c : Color){
            self.color = c
        }
        func body (content : Content) -> some View {

            return VStack{content
                .padding()
                .foregroundColor(color)
                .background(Color.yellow)
                .cornerRadius(12)
                Spacer().frame(height: 10)
            }
        }
    }
    
    // 클로져를 받는 커스텀뷰
    struct CardBackgroud<Content : View> : View {
        let content : () -> Content
        var hdr : String = ""
        init(hdr : String, @ViewBuilder c : @escaping () -> Content){
            self.content = c
            self.hdr  = hdr
        }
        
        var body : some View {
            return VStack(alignment: .leading){
                Section(header: Text (hdr).font(.system(size: 15)) ){
                    content()
                }.frame(minWidth: 0, maxWidth: .infinity, maxHeight: 50)
                    .background(Color.white)
                    .padding(.leading,  1)
                    .padding(.trailing, 1)
                
                
            }.frame(width: 160, height: 200)
            .background(Color.pink)
            .cornerRadius(14)
            
        }
        
    }
}

struct Example14View_Previews: PreviewProvider {
    static var previews: some View {
        Example14View()
    }
}

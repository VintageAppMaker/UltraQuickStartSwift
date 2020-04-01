//
//  Example5View.swift
//  StartIosApp
//
//  Created by adsloader on 2020/04/01.
//  Copyright © 2020 adsloader. All rights reserved.
//

import SwiftUI

struct Example5View: View {
    var body: some View {
        
        // List 화면이 캡션영역까지 침범함
        // 임시방편으로 NavigationView로 감싸버렸음.
        // 나중에 Tabview의 size를 찾아보아야 함.
        NavigationView{
            TabView {
                FirstView()
                    .tabItem {
                     Image(systemName: "person.fill")
                     Text("1")
                   }
                
                SecondView()
                    .tabItem {
                      Image(systemName: "heart.fill")
                      Text("2")
                    }
                
                Text("Text()로 표시한 탭")
                    .tabItem {
                      Text("3")
                    }

            }
        }.navigationBarTitle("TabView")
    }
}

struct FirstView : View {
    var body : some View {
        ZStack{
            Text("단순문자 1").background(Color.yellow)
        }
    }
}

struct SecondView : View {
    var body : some View {
        ZStack{
            List {
                ForEach(0 ..< 123, id: \.self) { i in
                    Text("\(i)")
                }
            }
        }
    
    }
}
struct Example5View_Previews: PreviewProvider {
    static var previews: some View {
        Example5View()
    }
}

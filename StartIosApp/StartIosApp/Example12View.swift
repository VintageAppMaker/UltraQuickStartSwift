//
//  Example12View.swift
//  StartIosApp
//
//  Created by adsloader on 2020/04/06.
//  Copyright © 2020 adsloader. All rights reserved.
//

import SwiftUI

// 참고 blog: https://habr.com/en/post/476494/
struct Example12View: View {
    var items: [menuItem] = [
        menuItem(obj: AnyView(Example1View())),
        menuItem(obj: AnyView(Example8View())),
        menuItem(obj: AnyView(Example4View()))
    ]
    
    var body: some View {
        SwipeView(l: items)
    }
}

struct menuItem{
    var ID = UUID()
    var obj : AnyView
}

struct SwipeView: View {
    @State private var offset: CGFloat = 0
    @State private var index = 0
    
    var items: [menuItem]
    
    init ( l : [menuItem]){
        self.items = l
    }
    
    let spacing: CGFloat = 10

    var body: some View {
        GeometryReader { geometry in
            return ScrollView(.horizontal, showsIndicators: true) {
                HStack(spacing: self.spacing) {
                    ForEach(self.items, id:\.ID) { item in
                        item.obj
                            .frame(width: geometry.size.width - 8, height: geometry.size.height)
                            .padding(.all, 4.0)
                            .cornerRadius(20)
                    }
                }
            }
            .content.offset(x: self.offset)
            .frame(width: geometry.size.width, alignment: .leading)
            .gesture(
                DragGesture()
                    .onChanged({ value in
                        self.offset = value.translation.width - geometry.size.width * CGFloat(self.index)
                    })
                    .onEnded({ value in
                        if -value.predictedEndTranslation.width > geometry.size.width / 2, self.index < self.items.count - 1 {
                            self.index += 1
                        }
                        if value.predictedEndTranslation.width > geometry.size.width / 2, self.index > 0 {
                            self.index -= 1
                        }
                        withAnimation { self.offset = -(geometry.size.width + self.spacing) * CGFloat(self.index) }
                    })
            )
        }
    }
}

struct Example12View_Previews: PreviewProvider {
    static var previews: some View {
        Example12View()
    }
}

//
//  Example3View.swift
//  StartIosApp
//
//  Created by adsloader on 2020/03/31.
//  Copyright © 2020 adsloader. All rights reserved.
//

import SwiftUI

struct Example3View: View {
    var body: some View {
        
        // 함수로 정리하지 않으면 오른쪽으로 과몰입되는 코드가 생성된다.
        ScrollView(.vertical) {
            VStack(spacing: 10) {
                ForEach(0..<101) {
                    Text("\($0) / 101")
                        .frame(minWidth: 0, maxWidth: .infinity)
                    
                    self.makeItem()
                }
            }
        }
        
    }
    
    func makeItem () -> some View {
        return ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing : 10){
                ForEach(0..<11) {
                    Text("\($0)")
                        .frame(width: 100, height: 100)
                        .background(Color.yellow)
                }
            }.padding(.all, 13.0)
        }
    }
    
}

struct Example3View_Previews: PreviewProvider {
    static var previews: some View {
        Example3View()
    }
}

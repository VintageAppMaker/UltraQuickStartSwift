//
//  Example7View.swift
//  StartIosApp
//
//  Created by adsloader on 2020/04/02.
//  Copyright © 2020 adsloader. All rights reserved.
//

import SwiftUI

struct Example7View: View {
    @State var message : String = "Android의 Framelayout = ZStack"
    @State var count : Int = 0
    var body: some View {
        ZStack {
            
            Image("seagul")
            Text(message)
                .foregroundColor(.white)
    
            VStack {
                Spacer()
                Button(action: {
                    self.count   = self.count + 1
                    self.message = "count \(self.count)"
                }, label: {
                     Text("+")
                     .font(.system(.largeTitle))
                     .frame(width: 37, height: 30)
                     .foregroundColor(Color.white)
                     .padding(.bottom, 7)
                })
                .background(Color.red)
                .cornerRadius(18.5)
                .padding()
                .shadow(color: Color.black.opacity(0.5),
                         radius: 7,
                         x: 7,
                         y: 7)
                
            }
        }
    }
    
}



struct Example7View_Previews: PreviewProvider {
    static var previews: some View {
        Example7View()
    }
}

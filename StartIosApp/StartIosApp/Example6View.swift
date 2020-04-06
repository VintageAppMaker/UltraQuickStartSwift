//
//  Example6View.swift
//  StartIosApp
//
//  Created by adsloader on 2020/04/02.
//  Copyright © 2020 adsloader. All rights reserved.
//

import SwiftUI

struct Example6View: View {
    var body: some View {
        GeometryReader { geometry in
            
            VStack {
                // 2.
                Text("1/2 height, full width")
                    .frame(width: geometry.size.width, height: geometry.size.height/3)
                    .background(Color.green)
                   
                HStack {
                    // 3.
                    Text("space ")
                        .frame(width: geometry.size.width/2, height: geometry.size.height/2)
                        .background(Color.gray)
                    Text("space ")
                        .frame(width: geometry.size.width/2, height: geometry.size.height/2)
                        .background(Color.red)
                }
                
                HStack(spacing: 0) {
                    Button("space (X)", action: {} )
                        .frame(width: geometry.size.width * 0.3, height: 50)
                        .background(Color.yellow)
                        .cornerRadius(12)
                    Text("space (X)")
                        .frame(width: geometry.size.width * 0.7, height: 50)
                        .background(Color.yellow)
                    
                }
            }
            
        }
    }
}

struct Example6View_Previews: PreviewProvider {
    static var previews: some View {
        Example6View()
    }
}

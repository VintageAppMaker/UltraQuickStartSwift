//
//  Example8View.swift
//  StartIosApp
//
//  Created by adsloader on 2020/04/03.
//  Copyright © 2020 adsloader. All rights reserved.
//

import SwiftUI

struct Example8View: View {
    @State private var selectMeter = 0
    @State private var message     = ""
    
    @State private var backColor = Color.white
    
    var body: some View {
        
        // 프로퍼티를 이용한 Event Handler 로직구현
        let pickerEvent = Binding<Int>(get: {

            return self.selectMeter

        }, set: {
            // Event Handler
            switch $0{
                case 0:
                    self.backColor = Color.red
                    self.message   = "10km is dager"
                    break
                
                case 1:
                    self.backColor = Color.yellow
                    self.message   = "50km is Warning"
                    break
                
                case 2:
                    self.backColor = Color.green
                    self.message   = "100km is safe"
                    break
            
                    
                default:
                    break
                
            }

            self.selectMeter = $0
        })
        
        return VStack {
            Picker(selection: pickerEvent, label: Text("")) {
                Text("10km").tag(0)
                Text("50km").tag(1)
                Text("100km").tag(2)
            }.pickerStyle(SegmentedPickerStyle())

            Text("\(selectMeter) selected\n\(message)").foregroundColor(backColor)
        }
        
    }
}

struct Example8View_Previews: PreviewProvider {
    static var previews: some View {
        Example8View()
    }
}

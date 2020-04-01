//
//  Example4View.swift
//  StartIosApp
//
//  Created by adsloader on 2020/04/01.
//  Copyright © 2020 adsloader. All rights reserved.
//

import SwiftUI

struct Example4View: View {
    
    // 화면전환시에도 값이 계속 유지된다.
    @ObservedObject var model : Model = Model()
    @State var title : String = "List Edit Test"
    
    init(){
        
    }
    
    var body: some View {
        return NavigationView {
            List {
                
                ForEach(0 ..< model.lst.count) { i in
                    self.decorateText(n: i)
                }
                    
                .onDelete(perform: delete)
            }
            .navigationBarItems(trailing: EditButton())
        }
        .navigationBarTitle(title)
        .navigationBarItems(trailing: // Navigation Bar에 버튼추가
            HStack{
                Button("remove") {
                    self.clearData()
                }.foregroundColor(Color.green)
                

                Button("add") {
                    self.makeData()
                }.foregroundColor(Color.green)
                
            }
        )
        .onAppear(perform: {self.makeData()})      // 화면보일시
        .onDisappear(perform: {self.clearData()})  // 화면종료시
    
    }
    
    func clearData (){
        self.model.lst.removeAll()
    }
    
    func makeData(){
        model.lst.append("example1")
        for i in 0...10 {
            model.lst.append("\(i)")
        }
    }
    
    // 리스트 항목을 index에 따라 다르게 표시
    // onTapGesture를 적용하면 some View로 넘겨야 한다.
    // => 모든 Text에 onTapGesture를 적용해야 하는 것
    func decorateText (n : Int) -> some View{
        if self.model.lst.count <= n {
            return Text("지워졌음").onTapGesture {
            }
        }
        
        let title = self.model.lst[n]
        let t = Text(title)
            .foregroundColor(Color.red)
            .onTapGesture {
                self.model.lst[n] = ""
            }
        
        let t2 = Text(title)
            .bold()
            .onTapGesture {
                self.title = title
            }
        
        if title == "example1" {
            return t
        } else {
            return t2
        }
    }
    
    // 리스트 지우기
    func delete(at offsets: IndexSet) {
        model.lst.remove(atOffsets: offsets)
    }
    
    // MVVM 구조의 Model
    class Model : ObservableObject{
        @Published var lst = [String]()
    }

}

struct Example4View_Previews: PreviewProvider {
    static var previews: some View {
        Example4View()
    }
}

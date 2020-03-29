//
//  Example1.swift
//  StartIosApp
//
//  Created by adsloader on 2020/03/28.
//  Copyright © 2020 adsloader. All rights reserved.
//

import SwiftUI

struct Example1View: View {
    struct item{
        var id = UUID()
        var title : String
    }
    
    struct item2 : Identifiable{
        var id = UUID()
        var title : String
    }
    
    let lst  : [item]   = [item( title : "A"), item( title : "B"), item( title : "C")]
    let lst2 =  ["A", "B", "C"]
    let lst3 : [item2]  = [item2( title : "Identifiable2"), item2( title : "Identifiable3")]
    @State var users   = [String]()
    @State var message = ""
    
    var body: some View {
        
        return VStack{
            
            Text(message)
            
            // List 또는 ForEach에서는 2번째 파라메터로 Uniq한 값을 전달해주어야 한다.
            // 방법 1) id :.\self는 유니크값이 없어도 되는 경우이다. 모든 배열이 가능하다.
            // 방법 2) id :.\특정필드는 유니크값을 지정하는 경우이다. struct를 정의하고 id 값을 var id = UUID()로 정의해야한다.
            //     item을 구분하기 위한 특정필드를 약속하는 것이다. 값이 중복되도 에러는 안난다.
            // 방법 3) Identifiable을 상속받은 struct를 이용한다.
            List(lst, id: \.title){ nItem in
                Text("\(nItem.title)")
                .bold()
            }
            
            List(lst2, id: \.self){ str in
                Text("\(str)")
                .bold()
            }

            
            List(lst3){ nItem in
                Text("\(nItem.title)")
                .bold()
            }
            
            Button("Dynamic Add") {
                self.users.append("Dynamic Add - " + String (self.users.count))
            }
            
            Button("Dynamic remove 0") {
                if self.users.count > 0 {
                    self.users.remove(at: 0)
                }
            }
            
            List {
                ForEach(users, id: \.self) { user in
                    Text(user)
                }
            }
        }.onAppear(){
            // list를 동적처리할 경우, 에러가 발생함.
            // swift는 방법이 다른 언어와 다를것임
            self.message = "loading 완료"
        }
    }

}

struct Example1_Previews: PreviewProvider {
    static var previews: some View {
        Example1View()
    }
}

//
//  Example1.swift
//  StartIosApp
//
//  Created by adsloader on 2020/03/28.
//  Copyright © 2020 adsloader. All rights reserved.
//
import SwiftUI
import Combine

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
    let lst2 : [item2]  = [item2( title : "Identifiable2"), item2( title : "Identifiable3")]
    
    @State var users   = [String]()
    @State var message = ""
    
    @ObservedObject var model : Model = Model()
    
    // 초기화
    init(){
        for i in 0...13{
           self.model.lst.append(i)
        }
    }
    
    var body: some View {
        
        return VStack{
            
            Text(message)
            
            // List 또는 ForEach에서 배열값을 전달해야 할 경우...
            // 방법 1) 배열과 id 전달: id 값의 .\self는 unique id 값을 기본값으로 하는 경우이다.
            // 방법 2) 배열과 id 전달: id 값의 .\특정필드는 유니크값을 지정하는 경우이다. struct를 정의하고 id를 정의해야한다.
            //     item을 구분하기 위한 특정필드를 약속하는 것이다. 값이 중복되도 에러는 안난다.
            // 방법 3) Identifiable을 상속받은 struct를 이용한다.
            List(lst, id: \.title){ nItem in
                Text("\(nItem.title)")
                .bold()
            }
            
            List(model.lst, id: \.self){ n in
                
                // *** body를 구현하는 곳에서 조건문을 사용하고자 한다면 *** 
                // Group안에서 가능하다.
                Group{
                    if n  < 5 {
                        Text("\(n)위 = 합격")
                        .bold()
                    } else {
                        Text("불합격")
                            .foregroundColor(Color.red)
                    }
                }
                
            }

            Button("Clear All") {
                self.model.lst.removeAll()
            }

            Button("Add more") {
                for i in 0...10 {
                    self.model.lst.append (i)
                }
            }
        
            List(lst2){ nItem in
                Text("\(nItem.title)")
                .bold()
            }
            
            HStack{
                Button("Add") {
                    self.users.append("Dynamic Add - " + String (self.users.count))
                }.padding(.all, 4.0)
                .background(Color.green)
                
                Button("remove 0") {
                    if self.users.count > 0 {
                        self.users.remove(at: 0)
                    }
                }.padding(.all, 4.0)
                .background(Color.green)
            }
            
            List {
                ForEach(users, id: \.self) { user in
                    Text(user)
                }
            }
        }.onAppear(){
            
            // @State로 선언된 변수를 외부 모듈과 바인딩
            ChangeStateValue(name : self.$message).modifyed(s : "loading 완료")
            
            // List를 직접 동적처리할 경우, 에러 발생함.
            // 시뮬레이터 버그인지 코드가 잘못된 것인지 판단못함
            // self.model.lst2.append("A")
        }
    }
}

// State 변수를 외부모듈에서 바인딩
struct ChangeStateValue {
    @Binding var name : String
    
    func modifyed ( s : String){
        name = s
    }
}

// MVVM 구조의 Model
class Model : ObservableObject{
    @Published var lst = [Int]()
}

struct Example1_Previews: PreviewProvider {
    static var previews: some View {
        Example1View()
    }
}

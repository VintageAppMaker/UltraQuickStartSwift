//
//  ContentView.swift
//  StartIosApp
//
//  Created by adsloader on 2020/03/24.
//  Copyright © 2020 adsloader. All rights reserved.
//

import SwiftUI


/*
   #1 목적: 선학습없이 검색하며 찾아보는 SwiftUI
   
   1. XCode 11부터는 SwiftUI가 기본설정
   2. 처음접하는 개발자에게는 Web 개발환경 같음
   3. 러닝커브가 완곡하다고 함(OO보다 쉽다는 의미)
 
 */

// 0. ContentView는 화면에 그려질
struct ContentView: View {
    
    // 1.
    // swift 5.1부터 적용된 어노테이션 @State
    // View에서,
    // 값변경시 바로 화면에 적용해야 할 때 필수임.
    // 선언된 범위에서만 사용가능. 외부에서 사용못함(private과 유사)
    @State var title: String = "클릭 수: "
    @State var count : Int = 0
    @GestureState var isLongPressed = false
    
    // 알럿처리
    @State var isAlert = false
    
    // 2. some 키워드는 제너릭으로 이해하는 것이
    // 초기개발에 도움이 됨
    var body: some View {
        
        // 3. LongPressGesture
        // @State로 선언된 변수를 "외부에서 변경"하고자 한다면 
        // $로 넘겨지고
        // 받아처리하는 쪽에서는 연결되는
        // 변수를 @binding으로 선언한다.
        // 그러면 값이 변경되면 서로 영향을 주게 된다.
        let longPress = LongPressGesture()
            .updating($isLongPressed) { value, state, transcation in
                state = value
        }
        

        // 4. View를 넘김
        // 직접 코딩이 가능하다. 그러나
        // canvas의 미리보기에서 View를 선택 후,
        // command + click 하면 좀 더 직관적으로
        // 사용가능하다.
        
        // 또는 code에서 우클릭 후,
        // show code action을 통해서도
        // 편리한 기능을 사용할 수 있다.
        
        // (***) 메뉴처리
        // View를 함수나 배열에서 사용하려면
        // AnyView(뷰객체)로 사용해야 한다.
        struct menuItem {
            var ID    = UUID()
            var title : String
            var obj   : AnyView
        }
        
        let mn : [menuItem] = [
            menuItem ( title : "1. List 추가/삭제 데이터연결" , obj: AnyView(Example1View()) ),
            menuItem ( title : "2. 필수화면 기초" , obj: AnyView(Example2View()) ),
            menuItem ( title : "3. ScrollView" , obj: AnyView(Example3View()) ),
            menuItem ( title : "4. NavigationView & List Edit" , obj: AnyView(Example4View()) ),
            menuItem ( title : "5. tab" , obj: AnyView(Example5View()) ),
            menuItem ( title : "6. GeometryReader - 비율" , obj: AnyView(Example6View()) ),
            menuItem ( title : "7. ZStack - 레이어겹치기(FraemeLayout)" , obj: AnyView(Example7View()) ),
            menuItem ( title : "8. Segment Control" , obj: AnyView(Example8View()) ),
            menuItem ( title : "9. ImageURL(opensource 참고)" , obj: AnyView(Example9View(url: "http://vintageappmaker.com/wp-content/uploads/2015/03/cropped-logo.png")) ),
            menuItem ( title : "10. UIKit 사용(WebView)" , obj: AnyView(Example10View()) ),
            menuItem ( title : "11. SearchUI(stackoverflow)" , obj: AnyView(Example11View()) )
        ]
        
        return NavigationView{
            
            // VStack은 Android의 버티컬 속성을 가진 LinearLayout과 같은
            // 기능을 한다.
            // ** 매우중요**
            // ViewBuilder는 클로져의 복잡성 문제로 extra parameter call 에러가 발생한다.
            // 10개 이상의 View를 추가할 경우 발생한다.
            // 그럴 경우, View를 그룹단위(Group을 사용하거나 다른 View 안으로 그룹화)로 분리해야한다.
            VStack(alignment: .leading) {
            
                // Spacer()를 호출할 경우, 버그발생헀음.
                // VStack()으로 분리함.
                VStack(alignment: .leading) {
                    // 텍스트
                    Text("\(title)")
                        .font(.title)
                        .bold()
                        .padding(.all, 4.0)
                    
                    // 버튼 1.
                    // Button 생성시 이름없는 {}는 Text를 리턴하는 초기화 함수이다. 실제이름은 label이다.
                    // action은 눌렀을 경우, 실행되는 콜백함수이다.
                    Button(action: {self.onIncrease()} ) {
                        makeButtonText(s : "클릭하면 +1", c: Color.red)
                    }.padding(.all, 4.0)
                    .background(Color.yellow)
                    .cornerRadius(20)

                    // 길게 누르기 이벤트를 처리하는 텍스트
                    // scaleEffect에서는 isLongPressed에 바인딩하여 값이 변경될 시, 확대축소
                    // gesture에는 이벤트핸들러를 지정
                    Text("길게 눌러봐주세요 ... ")
                        .padding(.all, 4.0)
                        .font(.subheadline)
                        .scaleEffect(isLongPressed ? 2.1 : 1)
                        .gesture(longPress)
                    
                    // 버튼 2.
                    Button(action: {self.onShowpopup()} ) {
                        makeButtonText(s : "Click하면, UIAlertController()", c: Color.blue)
                    }.padding(.all, 4.0)
                    
                    // 버튼 3.
                    Button(action: { self.isAlert = true} ) {
                        makeButtonText(s : "Click하면, SwiftUI Alert", c: Color.gray)
                    }.alert(isPresented: $isAlert) {
                        Alert(title: Text("SwiftUI"), message: Text("변수를 바인딩해야함"), dismissButton: .default(Text("이해했습니다. 귀찮네요..")))
                    }.padding(.all, 4.0)
                    
                }
                
                // 위의 View를 VStack으로 분리해서 사용가능함
                Spacer().frame(height: 240)
                
                // 특정 SDK 버전에서 NavigationLink는 Simulator에서 버그가 있다.
                // 이동이 한 번만 되는 경우가 발생한다.
                List(mn, id : \.title){
                    n in
                    
                    NavigationLink(destination: n.obj) {
                        Text(n.title )
                    }.padding(.all, 4.0)
                    
                }
                
            
            }
            // 전체크기로 조정
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
            .background(Color.green)
            .navigationBarTitle("Quick start SwiftUI")
            
        }
    }
    
    
    // 버튼1 Handler
    func onIncrease (){
        count = count + 1
        self.title = "Swift Example \(self.count)"
    }
    
    // 버튼 2 Handler (swiftUI Alert 아님)
    // 아래부분은 swiftUI preview에서는 에러발생함(주석처리하면 미리볼수 있음). 
    func onShowpopup (){
//        NotificationCenter.default.post(name: Notification.Name("showAlert"), object: "button의 alert 메소드를 사용하는 것이 정석임\nUIKit과 호환을 위해 만든코드.\nSceneDelegate.swift에 기능추가함")
    }
}

// View를 아래와 같이 함수로 만들어 사용하는 것이
// 가독성 및 관리차원에서 좋다
func makeButtonText(s : String, c :Color) -> Text{
    return Text(s)
        .bold()
        .foregroundColor(c)
}


// 미리보기
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

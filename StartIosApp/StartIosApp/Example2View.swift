//
//  Example2View.swift
//  StartIosApp
//
//  Created by adsloader on 2020/03/30.
//  Copyright © 2020 adsloader. All rights reserved.
//

import SwiftUI
import Combine

struct Example2View: View {

    @State private var name    : String = ""
    var animals = ["Dog", "Cat", "Bird", "영식이"]
    @State private var selectedAnimal = 0
    
    // 초기화
    init(){
       
    }
    
    var body: some View {
        
        return VStack(alignment: .leading){
            
            // name과 바인딩되어 입력시마다 화면에 보여준다.
            TextField("이름을 입력하세요", text: $name)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            
            // onTapGesture 적용. 2번탭
            Text("안녕, \(name)!").onTapGesture(count: 2) {
                self.name = "2번 tap 헀습니다."
            }
            
            // VStack으로 감싸지않으면 코딩스타일 문제로
            // 호출에러가 발생하기도 한다.
            VStack {
                // Picker 지정
               Picker(selection: $selectedAnimal, label: Text("동물")) {
                  ForEach(0 ..< animals.count) {
                     Text(self.animals[$0])
                  }
               }
               Text("선택동물: \(animals[selectedAnimal])")
            }
            
            
            // 크기를 지정한 Spacer
            Spacer().frame(height: 20)
            
            // 글자색, 배경색
            // 글자크기 및 폰트
            Text("줄간격, 자간설정을 한\n문자열로 테스트 한 것 입니다.")
                .font(.custom("SF Mono", size: 13)) //폰트, 크기
                .kerning(15) // 자간
                .multilineTextAlignment(.trailing) // 멀티라인시 정렬
                .lineSpacing(23) // 줄간격
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            
            Text("배경과 글자색")
                .background(Color.red)
                .foregroundColor(Color(red : 255/255, green: 255/255, blue: 100/255))
            
            Spacer()
            
            // 이미지에 배경색 설정
            Image("cropped-logo")
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .background( Color.red)
            
            // 배경에 이미지 넣기
            Text("텍스트배경에 이미지")
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .font(.largeTitle)
                .foregroundColor(.white)
                .background( Image("seagul").resizable() )
            
            
        }.onAppear(){
            
            
        }.padding(.all, 16.0)
    }
    
}

struct Example2_Previews: PreviewProvider {
    static var previews: some View {
        Example2View()
    }
}

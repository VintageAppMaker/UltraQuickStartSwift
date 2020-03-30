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
    @State private var message : String = ""
    
    // 초기화
    init(){
       
    }
    
    var body: some View {
        
        return VStack(alignment: .leading){
            Text(message)
            // name과 바인딩되어 입력시마다 화면에 보여준다. 
            TextField("이름을 입력하세요", text: $name)
            Text("안녕, \(name)!")
            
            // 크기를 지정한 Spacer
            Spacer().frame(height: 200)
            
            // 글자색, 배경색
            // 글자크기 및 폰트
            Text("줄간격이\n있는 문자열\n입니다.")
                .font(.custom("SF Mono", size: 23)) //폰트, 크기
                .kerning(20) // 자간
                .multilineTextAlignment(.trailing) // 멀티라인시 정렬
                .lineSpacing(23) // 줄간격
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            
            Text("배경과 글자색")
                .background(Color.red)
                .foregroundColor(Color(red : 255/255, green: 255/255, blue: 100/255))
            
            Spacer()
            
            // 이미지 및 배경
            Text("크기지정")
            Image("cropped-logo")
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .font(.largeTitle)
                .foregroundColor(.white)
                .background( Color.red)
            
            // 배경에 이미지 넣기
            Text("텍스트배경에 이미지")
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .font(.largeTitle)
                .foregroundColor(.white)
                .background( Image("seagul").resizable() )
            
            
        }.onAppear(){
            
            // @State로 선언된 변수를 외부 모듈과 바인딩
            ChangeStateValue(name : self.$message).modifyed(s : "loading 완료")
            
        }.padding(.all, 16.0)
    }
    
}

struct Example2_Previews: PreviewProvider {
    static var previews: some View {
        Example2View()
    }
}

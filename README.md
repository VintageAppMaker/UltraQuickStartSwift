## Quick Start Swift 

> 흔한 생존형 개발자(=만들며 배우는 개발자)가 iOS를 모르는 상태에서 바로 프로젝트를 투입되어야 할 경우,  1시간 안에 서바이벌 swift 문법을 학습하고자함이 목적.

1. 최소한의 필수 swift 문법

2. 현업에서 사용하는 필수 코딩스타일 위주정리 

   


##### 1. 메인함수 

> (1)메인함수 정의없이 바로 코드가 실행된다.  (2) import 문은 외부라이브러리에나 사용한다. 즉, 같은 프로젝트의 파일에 대해서 사용할 필요가 없다. (3) iOS에서는 @UIApplicationMain로 메인함수를 정의가능하다.

~~~  swift
// 종결자(;)없이 사용가능함 
print ("메인함수없이 코드순서대로 실행됩니다")
~~~

##### 2. 변수선언

> 읽고쓰기가 가능한 변수와 읽기만 가능한 변수를 구분하여 선언 . 변수명은 유니코드까지 지원(emoji로 된 변수명도 가능하다)

- var : 읽기/쓰기 가능한 변수 
- let : 읽기만 가능한 변수(상수개념)

~~~swift
let fixed_value    = 1000
// fixed_value     = 1 // error

var editable_value = "read / write"
editable_value = "changed"

var 🐈 = "cat"
print (🐈)
~~~

##### 3. 타입정의

> 명시적 선언하는 방법과  선언과 동시에 값 대입하며 타입이 정해지는 방법이 있다.   

- 타입 명시적 정의 :   var(let) 변수명 : 타입 
- 타입추론(대입 후,  타입정의) : var(let) 변수명 = 값 

~~~swift
var stringValue = ""
// type(of : 변수)는 타입채크 함수임  
print (type(of : stringValue ) )
// 아래는 에러임 
stringValue = 100
~~~

##### 4. 기본타입

> 최근 함수형 프로그래밍 언어는 타입이 간소화되는 추세이다.    

- 숫자형: Int, Uint, Double, Float    
- boolean 형 : Bool
- 문자형 : String, Charater(char형) 

##### 5. 타입정의

> 명시적 선언하는 방법과  선언과 동시에 값 대입하며 타입이 정해지는 방법이 있다.   

- 타입 명시적 정의 :   var(let) 변수명 : 타입 
- 타입추론(대입 후,  타입정의) : var(let) 변수명 = 값 

~~~swift
var stringValue = ""
// type(of : 변수)는 타입채크 함수임  
print (type(of : stringValue ) )
// 아래는 에러임 
stringValue = 100
~~~

##### 6. 문자열처리 

> 문자열 처리는 kotlin과 매우 유사하다.   

- 문자열내의 "\\(변수명 )" :  문자열내에서 변수값을 대치
- """ """ :  줄넘김이 있는 긴 문자열을 변수에 대입

~~~swift
var stringValue = ""
// type(of : 변수)는 타입채크 함수임  
print (type(of : stringValue ) )
// 아래는 에러임 
stringValue = 100
~~~

##### 6. 숫자 <--> 문자형 변환  

> 숫자형을 문자형으로 문자형을 숫자형으로 변환   

- String() :  문자열로 변환
- Int():  숫자형으로 변환

~~~swift
var sNum = "100"
// Int(변수)는 결과값은 optional이다.
// optional은 코틀린의 nullable(?)과 같다.
// 그러므로 강제적으로 !(코틀린은 !!)를 지정하면 Int로 사용가능하다
var num = Int(sNum)! + 100
print ( String (num) )
~~~

##### 6. optional, nil   

>    함수형 언어에서는 기본적으로 null(mil)을 허용하지 않는다. 그러나 허용해야 할 경우, swift에서는 optional이라는 형태로 사용한다.

- ? 로 선언 :  변수 : 타입? 형태로 nil을 허용하겠다는 선언
- 형변환 함수의 결과는 optional형 
- optional로 선언된 변수는 바로 사용이 불가능
- 변수명 뒤에 !를 붙여 사용가능함(코틀린의 !!와 유사 -> 에러발생후 종료)
- optional binding:  if let 지역변수 = optional변수{  else } 형태로 값이 nil이면 else 구문의 값을 지역변수에 저장한다.  지역변수는 if{} else{} 구문 안에서만 사용가능함. !처럼 nil일 경우, 에러발생하며 종료하는 것이 싫다면 귀찮더라도 옵셔널 바인딩을 구현해야 한다. 
- optional은 개발자에게 null 처리에 민감하게 반응하라고 강요하는 기능임(코틀린에 비해 귀찮을 정도로 까다로운 방식을 요구함)  

~~~swift
var name : String? 
if let optName = name{
    print(optName)
} else { 
    print("nil 입니다")
}

~~~

##### 7. 배열(리스트)   

>    모든 원소는 같은 형이어야 한다(경쟁언어인 코틀린은 다양한 형을 지원함). 

- 좌측변수가 형정의 안되어있을 경우,  값이 없다면 [데이터형] ()로 대입
- 좌측변수가 형정의 되어있을 경우,  값이 없다면 []로 대입
- 배열에 값이 있다면 [값, 값, ...] 로 초기화 가능
- 위의 2경우를 Array<데이터형>(), Array() 으로 치환가능
- 숫자 범위는 Array(시작...끝)을 사용  

~~~swift
var arr  = [Int]()
var arr2 : [Int] = []
var arr3 = Array<Int>()
var arr4 : [Int] = Array()
var arr5 = [1, 2, 3, 4, 5]
var arr6 = Array(1...5)

print (arr5)
print (arr6)
~~~

##### 8. 사전   

>    키 : 값 형태의 데이터형. 배열과 비슷하나 [키:값]으로 사용함

- 좌측변수가 형정의 안되어있을 경우,  값이 없다면 [키:값] ()로 대입
- 좌측변수가 형정의 되어있을 경우,  값이 없다면 [:]로 대입
- 초기값이 있다면 [키:값, 키:값, ...] 로 초기화 가능
- 위의 2경우를 Dictionary< 키:값 >(), Dictionary() 으로 치환가능  

~~~swift
var d : [String : String] = [:]
var d2 = [String : Int]()
var d3 : Dictionary = [Int:String]()
var d4 : Dictionary<Int, String> = Dictionary<Int, String>()
var dic2 = [1:"one", 2:"two", 3:"three"]
print (dic2)
print (dic2[1]!)
~~~

##### 9. 조건문(if, switch)    

>    대부분의 언어와 유사한 구조이다. 그러나 조건영역인 ()를 삭제할 수 있다.

- if 이후 조건영역인 ()를 삭제가능
- &&의 경우 ,로 대치할 수 있다 
- switch의 경우, case에 범위가 가능하다  
- 범위 연산자는  ( ... )  (,)  (..<)  

~~~swift
var num = 3

// 흔히 접했던 조건문 
if(num == 3){
    print ("\(num)")
}

// swift 스타일 () 삭제  
if num == 3 {
    print ("\(num)")
}

var name = "snake"

// && 대신 , 를 사용함 
if num == 3,  name == "snake"{
    print ("\(num):\(name)")
}

switch num {
    case 2:
        print (name)
        break
        // break 반드시 할필요없음 
    
    case 3, 10 :
        print ("\(num) is in 3 or 10" )
    
    case 10 ..< 20:
        break
        
    
    default: 
      print("default")
}
~~~

##### 9. 반복문(for, while)    

>    대부분의 언어와 유사한 구조이다. 그러나 조건영역인 ()를 삭제할 수 있다.

- 조건영역인 ()를 삭제가능
- for 변수 in 배열 또는 범위연산자 
- 범위연산자는   ( ... )  (,)  (..<)를 사용한다
- for문에서 in으로 변수를 할당하고 싶지않다면 _를 사용한다
- while은 대부분의 언어와 비슷하다   
- break, continue등은 파라메터로 레이블을 지정하여 이동가능하다
- 레이블은  [이름:]로 정의한다  

~~~swift
// 리스트 
let team = ["paladin", "mage", "berserver" ]
for player in team {
  print("\(player) is my team.")
}

// 사전 
let enemy = ["slime" : 100, "bat" : 150]
for (name, life) in enemy {
  print("name is \(name) life is \(life)")
}

// 범위 
for i in (0 ..< 10){
    print (i)
}

// 범위 -2 변수할당 (X)
for _ in (0 ... 2){
    print ("하이")
}

// 범위 - 3 레이블 이동 
loopexit:
for i in (0 ... 3){
    if i == 2{ 
        print ("break loopexit")
        break loopexit
    } 
    print ("하이")
}
~~~

##### 10. 함수    

>    func로 함수를 정의한다. 다른 언어에 비해 많은 차이점을 가지고 있다.

- 함수정의는 func 함수명 -> 리턴값 { }
- 기본적으로 파라메터의 이름을 반드시 써줘야 한다 
- 파라메터이름을 표기하고 싶지않다면,  _를 표기하고 빈 칸 후, 변수를 정의한다  
- 가변 파라메터의 정의는 [데이터형...] 이다 
- 함수형 언어이기에 함수안에 함수정의가 가능하다   

~~~swift

// function 1. 파라메터 이름과 함께 
func test(name : String ) -> String {
    return name
}

print ( test (name : "cat") )

// function 2. 이름없이 파라메터 넘기기 
func test2(_ name : String ) -> String {
    return name
}

print ( test2 ( "cat" ) )

// function 3. 가변파라메터  
func test3(_ names : String... ){
    for i in names{
        print(i)
    }
}

test3 ( "cat", "dog", "human", "bird" )

// function 4. 함수 안의 함수   
func test4(num : Int ){
    func add (n : Int ) -> Int{
        return n + 100
    }
    
    let rst = add (n : num)
    print ( "\(rst)" )
}

test4(num : 100)

~~~

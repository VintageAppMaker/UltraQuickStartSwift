//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

// 아무것도 모르는 상태에서 swift만 기초학습 후,
// UI 구조 경험해보기(UIScrollView보다 TableView가 일반적임)
class MyViewController : UIViewController {
    var str : String = ""
    func print (_ s : String){
        str.append(s + "\n")
    }
    
    // 레이블 선언과 초기화
    let mainLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
    
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
    
        label.adjustsFontSizeToFitWidth = true
        label.sizeToFit()
        return label
    }()
    
    // Scroll View의 크기를 동적으로 가져온다
    func getHeight(v : UIScrollView) -> CGFloat{
        // UIScrollView의 컨텐트 전체를 보기 위해서 임의의 초기값을 더해야 한다.
        var totalSize : CGFloat = 100
        for i in v.subviews{
            totalSize = i.bounds.height  + totalSize
        }
        return totalSize
    }
    
    // scrollView를 만들고 넘긴다.
    func setUpUI() -> UIScrollView{

        let screensize: CGRect = UIScreen.main.bounds
        let screenWidth = screensize.width
        let screenHeight = screensize.height
        var scrollView: UIScrollView
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
        
        mainLabel.text = str
        mainLabel.sizeToFit()
        
        // 1. UILable에 Event handler 설정
        addEventHandlerLabel()
        
        scrollView.addSubview(mainLabel)
        let nHeight : CGFloat = getHeight(v: scrollView)
        scrollView.contentSize = CGSize(width: screenWidth, height: nHeight  )
        
        return scrollView
        
    }
    
    func addEventHandlerLabel(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tappedLabel(tapGestureRecognizer:)))
        mainLabel.isUserInteractionEnabled = true
        mainLabel.addGestureRecognizer(tapGesture)
    }
    
    @objc func tappedLabel(tapGestureRecognizer: UITapGestureRecognizer) {
        let alertController = UIAlertController(title: "Simple Test", message:
        "touched!", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    override func loadView() {
        let view = UIView()
        
        view.backgroundColor = .darkGray
        view.addSubview( setUpUI())
        
        self.view = view
    }
    
    
}

// Test용 클래스
class TestController : MyViewController{
    override func loadView() {
        MyExample()
        super.loadView()
    }
    
    func MyExample(){
        for i in 0...10{
            print ("\(i)")
        }
    }
    
}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = TestController()


		

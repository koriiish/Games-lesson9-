//
//  ViewController.swift
//  Games
//
//  Created by Карина Дьячина on 21.12.23.
//

import UIKit

class ViewController: UIViewController {
    var squares: [UIView] = []
    let circleRadius: CGFloat = 50
    var circleView: UIView!
    var buttons: [UIButton] = []
   
 //   let circle = UIImage()
//    var circleView: UIView!
//    let pinkSquare = UIView()
//    let redSquare = UIView()
//    let purpleSquare = UIView()
//    let squareButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        setupPinkSquare()
//        setupRedSquare()
//        setupPurpleSquare()
        circleConfigure()
       
        //• Функция Random - самостоятельно, найти и изучить применение
        //        for _ in 1...3 {
        //            print(Int.random(in: 1..<100))
        //        }
        
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(moveCircleRight))
//        view.addGestureRecognizer(tapGesture)
//
//        createCircleView()
}
    
        //• Игрушка для котиков - появление разноцветного кружочка, по тапу
        //исчезает и появляется в новом месте (кодом)
    
  


//    func createCircleView() {
//        let circleSize: CGFloat = 100
//        let randomX = CGFloat.random(in: 0...(view.bounds.width - circleSize))
//        let randomY = CGFloat.random(in: 0...(view.bounds.height - circleSize))
//        
//        circleView = UIView(frame: CGRect(x: randomX, y: randomY, width: circleSize, height: circleSize))
//        circleView.backgroundColor = UIColor.blue
//        circleView.layer.cornerRadius = circleSize / 2
//        view.addSubview(circleView)
//    }
//    
//    @objc func circleTapped() {
//        let circleSize: CGFloat = 100
//        
//        let randomX = CGFloat.random(in: 0...(view.bounds.width - circleSize))
//        let randomY = CGFloat.random(in: 0...(view.bounds.height - circleSize))
//        
//        UIView.animate(withDuration: 0.3) {
//            self.circleView.frame = CGRect(x: randomX, y: randomY, width: circleSize, height: circleSize)
//        }
//    }
//    
//    @objc func moveCircleRight() {
//        UIView.animate(withDuration: 0.3) {
//            self.circleView.frame.origin.x += 10
//        }
//    }
        
        
        //- По нажатию кнопки экран заполняется разноцветными квадратами (3 штуки) с
        //фиксированной стороной. Квадраты не пересекаются
    
    @IBAction func startSquareGame(_ sender: Any) {
        removeSquares()
        createSquares()
    }
    
    func removeSquares() {
        for square in squares {
            square.removeFromSuperview()
        }
        squares.removeAll()
    }
    func createSquares() {
        let squareSide: CGFloat = 100
        let colors: [UIColor] = [.systemPink, .systemMint, .systemPurple, .systemOrange, .systemIndigo, .systemBrown] // добавить цветов разных
        // увеличить количество квадратов
        for _ in 0..<6 {
            var intersects = false
            var attempts = 0
            
            var newSquare: UIView!
            repeat {
                attempts += 1
                
                if attempts > 100 {
                    break
                }
                
                let randomX = CGFloat.random(in: 0...(self.view.frame.width - squareSide))
                let randomY = CGFloat.random(in: 0...(self.view.frame.height - squareSide))
                let randomColor = colors.randomElement()!
                
                let squareFrame = CGRect(x: randomX, y: randomY, width: squareSide, height: squareSide)
                
                newSquare = UIView(frame: squareFrame)
                newSquare.backgroundColor = randomColor
                
                let buttonFrame = self.view.subviews.first(where: { $0 is UIButton })?.frame ?? CGRect.zero
                let buttonArea = buttonFrame.insetBy(dx: -20, dy: -20)
                
                intersects = squares.contains { $0.frame.intersects(squareFrame) } || buttonArea.intersects(squareFrame)
            } while intersects
            
            if !intersects {
                squares.append(newSquare)
                self.view.addSubview(newSquare)
            }
        }
    }
    
    
//    func setupPinkSquare() {
//        pinkSquare.backgroundColor = UIColor.systemPink
//        pinkSquare.isHidden = true
//        }
//        func setupRedSquare() {
//            redSquare.backgroundColor = UIColor.systemRed
//            redSquare.isHidden = true
//        }
//        func setupPurpleSquare() {
//            purpleSquare.backgroundColor = UIColor.systemPurple
//            purpleSquare.isHidden = true
//        }
//    @IBAction func startSquareGame(_ sender: Any) {
//        let screenWidth = Int(UIScreen.main.bounds.size.width)
//                let upButtonBottom = Int(upButton.frame.maxY)
//                let squareButtonTop = Int(squareButton.frame.minY)
//                let squareSide = 70
//        pinkSquare.isHidden = false
//               repeat{
//                   pinkSquare.frame = CGRect(x: Int.random(in: 1..<(screenWidth - squareSide)), y: Int.random(in: (upButtonBottom + squareSide)..<(squareButtonTop - squareSide)), width: squareSide, height: squareSide)
//               } while pinkSquare.frame.intersects(purpleSquare.frame) || pinkSquare.frame.intersects(redSquare.frame)
//               
//        redSquare.isHidden = false
//               repeat {
//                   redSquare.frame = CGRect(x: Int.random(in: 1..<(screenWidth - squareSide)), y: Int.random(in: (upButtonBottom + squareSide)..<(squareButtonTop - squareSide)), width: squareSide, height: squareSide)
//               } while redSquare.frame.intersects(pinkSquare.frame) || redSquare.frame.intersects(purpleSquare.frame)
//               
//        purpleSquare.isHidden = false
//               repeat {
//                   purpleSquare.frame = CGRect(x: Int.random(in: 1..<(screenWidth - squareSide)), y: Int.random(in: (upButtonBottom + squareSide)..<(squareButtonTop - squareSide)), width: squareSide, height: squareSide)
//               } while purpleSquare.frame.intersects(redSquare.frame) || purpleSquare.frame.intersects(pinkSquare.frame)
//           }

    
    
    
        
        //- На экране кружок по центру. Четыре кнопки - вверх, вниз, вправо,
        //влево. При нажатии кнопки кружок перемещается на фиксированное
        //расстояние. За края экрана не выходит, на кнопки не налезает
        
//    @IBAction func startCirclesGame(_ sender: Any) {
//
//        
//    }
    func circleConfigure() {
        let circleOrigin = CGPoint(x: view.bounds.midX - circleRadius, y: view.bounds.midY - circleRadius)
        circleView = UIView(frame: CGRect(origin: circleOrigin, size: CGSize(width: circleRadius * 2, height: circleRadius * 2)))
        circleView.backgroundColor = UIColor.systemPink
        circleView.layer.cornerRadius = circleRadius
        view.addSubview(circleView)
        
        let upButton = createButton(title: "↑", frame: CGRect(x: 10, y: 50, width: 80, height: 50))
        upButton.backgroundColor = UIColor.systemYellow
        let downButton = createButton(title: "↓", frame: CGRect(x: 80, y: 50, width: 80, height: 50))
        downButton.backgroundColor = UIColor.systemPurple
        let leftButton = createButton(title: "←", frame: CGRect(x: 150, y: 50, width: 80, height: 50))
        leftButton.backgroundColor = UIColor.systemMint
        let rightButton = createButton(title: "→", frame: CGRect(x: 220, y: 50, width: 100, height: 50))
        rightButton.backgroundColor = UIColor.green
        
        buttons = [upButton, downButton, leftButton, rightButton]
        
        for button in buttons {
            view.addSubview(button)
        }
    }
    
    func createButton(title: String, frame: CGRect) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.frame = frame
        button.addTarget(self, action: #selector(moveCircle(_:)), for: .touchUpInside)
        return button
    }
    
    @objc func moveCircle(_ sender: UIButton) {
        var newFrame = circleView.frame
        
        switch sender.titleLabel?.text {
        case "↑":
            newFrame.origin.y -= 50
        case "↓":
            newFrame.origin.y += 50
        case "←":
            newFrame.origin.x -= 50
        case "→":
            newFrame.origin.x += 50
        default:
            break
        }
        
        if isFrameValid(newFrame) {
            UIView.animate(withDuration: 0.3) {
                self.circleView.frame = newFrame
            }
        }
    }
    
    func isFrameValid(_ frame: CGRect) -> Bool {
        if frame.minX < 0 || frame.minY < 0 || frame.maxX > view.bounds.width || frame.maxY > view.bounds.height {
            return false
        }
        
        for button in buttons {
            if frame.intersects(button.frame) {
                return false
            }
        }
        return true
    }
}

        
//    @IBAction func upButton(_ sender: Any) {
//            circleView.position = CGRect(x: circleView, y: circleView + 10, width: , hight: )
//                }
//    }
//    
//    @IBAction func downButton(_ sender: Any) {
//    }
//    @IBAction func rightButton(_ sender: Any) {
//    }
//    @IBAction func leftButton(_ sender: Any) {
//    }





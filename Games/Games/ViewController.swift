//
//  ViewController.swift
//  Games
//
//  Created by Карина Дьячина on 21.12.23.
//

import UIKit

class ViewController: UIViewController {
    
    let circle = UIImage()
    var circleView: UIView!
    let pinkSquare = UIView()
    let redSquare = UIView()
    let purpleSquare = UIView()
    let squareButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPinkSquare()
        setupRedSquare()
        setupPurpleSquare()
        //• Функция Random - самостоятельно, найти и изучить применение
        //        for _ in 1...3 {
        //            print(Int.random(in: 1..<100))
        //        }
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(moveCircleRight))
        view.addGestureRecognizer(tapGesture)

        createCircleView()
}
        //• Игрушка для котиков - появление разноцветного кружочка, по тапу
        //исчезает и появляется в новом месте (кодом)
    func createCircleView() {
        let circleSize: CGFloat = 100
        let randomX = CGFloat.random(in: 0...(view.bounds.width - circleSize))
        let randomY = CGFloat.random(in: 0...(view.bounds.height - circleSize))
        
        circleView = UIView(frame: CGRect(x: randomX, y: randomY, width: circleSize, height: circleSize))
        circleView.backgroundColor = UIColor.blue
        circleView.layer.cornerRadius = circleSize / 2
        view.addSubview(circleView)
    }
    
    @objc func circleTapped() {
        let circleSize: CGFloat = 100
        
        let randomX = CGFloat.random(in: 0...(view.bounds.width - circleSize))
        let randomY = CGFloat.random(in: 0...(view.bounds.height - circleSize))
        
        UIView.animate(withDuration: 0.3) {
            self.circleView.frame = CGRect(x: randomX, y: randomY, width: circleSize, height: circleSize)
        }
    }
    
    @objc func moveCircleRight() {
        UIView.animate(withDuration: 0.3) {
            self.circleView.frame.origin.x += 10
        }
    }
        
        
        //- По нажатию кнопки экран заполняется разноцветными квадратами (3 штуки) с
        //фиксированной стороной. Квадраты не пересекаются
    func setupPinkSquare() {
        pinkSquare.backgroundColor = UIColor.systemPink
        pinkSquare.isHidden = true
        }
        func setupRedSquare() {
            redSquare.backgroundColor = UIColor.systemRed
            redSquare.isHidden = true
        }
        func setupPurpleSquare() {
            purpleSquare.backgroundColor = UIColor.systemPurple
            purpleSquare.isHidden = true
        }
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
        
    
        
//    @IBAction func upButton(_ sender: Any) {
//            circleView.position = CGRect(x: circleView, y: circleView + 10)
//                }
//    }
//    
//    @IBAction func downButton(_ sender: Any) {
//    }
//    @IBAction func rightButton(_ sender: Any) {
//    }
//    @IBAction func leftButton(_ sender: Any) {
//    }
}




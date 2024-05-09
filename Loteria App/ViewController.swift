//
//  ViewController.swift
//  Loteria App
//
//  Created by aref on 4/29/24.
//

import UIKit


enum gameType : String {
    case megasena = " mega sena"
    case quina = " quina "
}


infix operator >-<
func >-< (total : Int , universe : Int)  -> [Int] {
    var result : [Int] = []
    while result.count < total {
        let randomNumber = Int(arc4random_uniform(UInt32(universe))+1)
        if !result.contains(randomNumber) {
            result.append(randomNumber)
        }
    }
    return result.sorted()
}









class ViewController: UIViewController {
    @IBOutlet weak var lbgameType: UILabel!
    @IBOutlet weak var scgameType: UISegmentedControl!
    @IBOutlet var balls: [UIButton]!
    
    @IBAction func generateGame(_ sender: Any) {
        switch scgameType.selectedSegmentIndex{
        case 0 :
            showNumbers(for: .megasena)
        default :
            showNumbers(for: .quina)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        showNumbers(for: .megasena)
    }
    
    func showNumbers (for type : gameType){
        lbgameType.text = type.rawValue
        var game : [Int] = []
        switch type {
        case .megasena :
            game = 6>-<60
            balls.last!.isHidden = false
        case.quina :
            game = 5>-<80
            balls.last! .isHidden = true
            
        }
        for (index , game) in game.enumerated(){
            balls[index].setTitle("\(game)",for : .normal)
        }
        
    }
    
}

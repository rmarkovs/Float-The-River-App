//
//  ViewController.swift
//  Float River
//
//  Created by Rebecca Markovsky on 3/14/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    let cardArray = ["B2C", "R2H", "B2S", "R2D", "B3C", "R3H",
    "B3S", "R3D", "B4C", "R4H", "B4S", "R4D", "B5C", "R5H", "B5S",
    "R5D", "B6C", "R6H", "B6S", "R6D", "B7C", "R7H", "B7S", "R7D", "B8C",
    "R8H", "B8S", "R8D", "B9C", "R9H", "B9S", "R9D", "B10C", "R10H",
    "B10S", "R10D", "BJC", "RJH", "BJS", "RJD", "BQC","RQH", "BQS", "RQD", "BKC", "RKH", "BKS", "RKD", "BAC", "RAH", "BAS", "RAD"]

    @IBOutlet weak var imgCard1: UIImageView!
    
    @IBOutlet weak var imgCard2: UIImageView!
    
    @IBOutlet weak var imgCard3: UIImageView!
    
    @IBOutlet weak var imgCard4: UIImageView!
    
    @IBOutlet weak var lblScore: UILabel!
    
    @IBOutlet weak var segmentColor: UISegmentedControl!
    
    @IBOutlet weak var segmentHighLow: UISegmentedControl!
    
    @IBOutlet weak var segmentInOut: UISegmentedControl!
    
    @IBOutlet weak var segmentSuit: UISegmentedControl!
    
    var firstCardIndex : Int = 0
    var fourthCardIndex : Int = 0
    var thirdCardIndex : Int = 0
    var secondCardIndex : Int = 0
    var firstCardValue : Int = 0
    var secondCardValue : Int = 0
    var thirdCardValue : Int = 0
    
    var score : Int = 0
    var cards : Int = 0
    
    @IBOutlet weak var lblCardsCorrect: UILabel!
    
    @IBAction func btnSuitGo(_ sender: UIButton)
    {
        fourthCardIndex = Int(arc4random_uniform(52))
        imgCard4.image = UIImage(named:cardArray[fourthCardIndex])
        compareSuit()
        checkWon()
        
    }
    func compareSuit()
    {
        var firstSuit : String = ""
        if(cards%4 == 3)
        {
            if((fourthCardIndex == 0) || (fourthCardIndex%4 == 0) )
            {
                firstSuit = "Clubs"
            }
            else if(fourthCardIndex%4 == 1)
            {
                firstSuit = "Hearts"
            }
            else if(fourthCardIndex%4 == 2)
            {
                firstSuit = "Spades"
            }
            else
            {
                firstSuit = "Diamonds"
            }
            if((firstSuit == "Clubs") && (segmentSuit.selectedSegmentIndex == 3))
            {
                score = score + 4
            }
            else if((firstSuit == "Hearts") && (segmentSuit.selectedSegmentIndex == 0))
            {
                score = score + 4
            }
            else if((firstSuit == "Spades") && (segmentSuit.selectedSegmentIndex == 1))
            {
                score = score + 4
            }
            else if((firstSuit == "Diamonds") && (segmentSuit.selectedSegmentIndex == 2))
            {
                score = score + 4
            }
            cards = cards + 1
            lblScore.text = String(score)
            lblCardsCorrect.text = String(cards)
        }
    }
   
    
    @IBAction func btnInOutGo(_ sender: UIButton)
    {
        thirdCardIndex = Int(arc4random_uniform(52))
        imgCard3.image = UIImage(named:cardArray[thirdCardIndex])
        compareInOut()
        checkWon()
    }
    func compareInOut()
    {
       if(cards%4 == 2)
       {
        if((thirdCardIndex >= 0) && (thirdCardIndex)<4)
        {
            thirdCardValue = 2
        }
        else if((thirdCardIndex >= 4) && (thirdCardIndex < 8))
        {
            thirdCardValue = 3
        }
        else if((thirdCardIndex >= 8) && (thirdCardIndex < 12))
        {
            thirdCardValue = 4
        }
        else if((thirdCardIndex >= 12) && (thirdCardIndex < 16))
        {
            thirdCardValue = 5
        }
        else if((thirdCardIndex >= 16) && (thirdCardIndex < 20))
        {
            thirdCardValue = 6
        }
        else if((thirdCardIndex >= 20) && (thirdCardIndex < 24))
        {
            thirdCardValue = 7
        }
        else if((thirdCardIndex >= 24) && (thirdCardIndex < 28))
        {
            thirdCardValue = 8
        }
        else if((thirdCardIndex >= 28) && (thirdCardIndex < 32))
        {
            thirdCardValue = 9
        }
        else if((thirdCardIndex >= 32) && (thirdCardIndex < 36))
        {
            thirdCardValue = 10
        }
        else if((thirdCardIndex >= 36) && (thirdCardIndex < 40))
        {
            thirdCardValue = 11
        }
        else if((thirdCardIndex >= 40) && (thirdCardIndex < 44))
        {
            thirdCardValue = 12
        }
        else if((thirdCardIndex >= 44) && (thirdCardIndex < 48))
        {
            thirdCardValue = 13
        }
        else
        {
            thirdCardValue = 14
        }
        //value of first card
        //value of second card
        //value of current card
        if((segmentInOut.selectedSegmentIndex == 0))
        {
            if((thirdCardValue > secondCardValue) && (thirdCardValue < firstCardValue))
            {
                score = score + 3
            }
            else if((thirdCardValue < secondCardValue) && (thirdCardValue > firstCardValue))
            {
                score = score + 3
            }
        }
        else if ((segmentInOut.selectedSegmentIndex == 1))
        {
            if((thirdCardValue < firstCardValue) && (thirdCardValue < secondCardValue))
            {
                score = score + 3
            }
            else if((thirdCardValue > secondCardValue) && (thirdCardValue > firstCardValue))
            {
                score = score + 3
            }
        }
        cards = cards + 1
        lblScore.text = String(score)
        lblCardsCorrect.text = String(cards)
       }
    }
    
    
    @IBAction func btnHighLowGo(_ sender: UIButton)
    {
        secondCardIndex = Int(arc4random_uniform(52))
        imgCard2.image = UIImage(named:cardArray[secondCardIndex])
        compareHighLow()
        checkWon()
    }
    func compareHighLow()
    {
        if(cards%4 == 1)
        {
        if((firstCardIndex >= 0) && (firstCardIndex)<4)
        {
            firstCardValue = 2
        }
        else if((firstCardIndex >= 4) && (firstCardIndex < 8))
        {
            firstCardValue = 3
        }
        else if((firstCardIndex >= 8) && (firstCardIndex < 12))
        {
            firstCardValue = 4
        }
        else if((firstCardIndex >= 12) && (firstCardIndex < 16))
        {
            firstCardValue = 5
        }
        else if((firstCardIndex >= 16) && (firstCardIndex < 20))
        {
            firstCardValue = 6
        }
        else if((firstCardIndex >= 20) && (firstCardIndex < 24))
        {
            firstCardValue = 7
        }
        else if((firstCardIndex >= 24) && (firstCardIndex < 28))
        {
            firstCardValue = 8
        }
        else if((firstCardIndex >= 28) && (firstCardIndex < 32))
        {
            firstCardValue = 9
        }
        else if((firstCardIndex >= 32) && (firstCardIndex < 36))
        {
            firstCardValue = 10
        }
        else if((firstCardIndex >= 36) && (firstCardIndex < 40))
        {
            firstCardValue = 11
        }
        else if((firstCardIndex >= 40) && (firstCardIndex < 44))
        {
            firstCardValue = 12
        }
        else if((firstCardIndex >= 44) && (firstCardIndex < 48))
        {
            firstCardValue = 13
        }
        else
        {
            firstCardValue = 14
        }
        
        
        if((secondCardIndex >= 0) && (secondCardIndex)<4)
        {
            secondCardValue = 2
        }
        else if((secondCardIndex >= 4) && (secondCardIndex < 8))
        {
            secondCardValue = 3
        }
        else if((secondCardIndex >= 8) && (secondCardIndex < 12))
        {
            secondCardValue = 4
        }
        else if((secondCardIndex >= 12) && (secondCardIndex < 16))
        {
            secondCardValue = 5
        }
        else if((secondCardIndex >= 16) && (secondCardIndex < 20))
        {
            secondCardValue = 6
        }
        else if((secondCardIndex >= 20) && (secondCardIndex < 24))
        {
            secondCardValue = 7
        }
        else if((secondCardIndex >= 24) && (secondCardIndex < 28))
        {
            secondCardValue = 8
        }
        else if((secondCardIndex >= 28) && (secondCardIndex < 32))
        {
            secondCardValue = 9
        }
        else if((secondCardIndex >= 32) && (secondCardIndex < 36))
        {
            secondCardValue = 10
        }
        else if((secondCardIndex >= 36) && (secondCardIndex < 40))
        {
            secondCardValue = 11
        }
        else if((secondCardIndex >= 40) && (secondCardIndex < 44))
        {
            secondCardValue = 12
        }
        else if((secondCardIndex >= 44) && (secondCardIndex < 48))
        {
            secondCardValue = 13
        }
        else
        {
            secondCardValue = 14
        }
        
        if((segmentHighLow.selectedSegmentIndex == 0) && (firstCardValue > secondCardValue))
        {
            score = score + 2
        }
        else if((segmentHighLow.selectedSegmentIndex == 1) && (firstCardValue < secondCardValue))
        {
            score = score + 2
        }
        cards = cards + 1
        lblScore.text = String(score)
        lblCardsCorrect.text = String(cards)
        }
        
        
    }
    
    @IBAction func btnColorGo(_ sender: UIButton)
    {
        firstCardIndex = Int(arc4random_uniform(52))
        imgCard1.image = UIImage(named:cardArray[firstCardIndex])
        compareColor()
        checkWon()
    }
    func compareColor()
    {
        if((cards == 0) || (cards%4 == 0))
        {
        var firstColor : String = ""
        if(firstCardIndex%2 == 0)
        {
            firstColor = "Black"
        }
        else{
            firstColor = "Red"
        }
        if((segmentColor.selectedSegmentIndex == 0) && firstColor == "Red")
        {
            score = score + 1
        }
        else if((segmentColor.selectedSegmentIndex == 1) && firstColor == "Black")
        {
            score = score + 1
        }
        cards = cards + 1
        lblScore.text = String(score)
        lblCardsCorrect.text = String(cards)
        
        }
    }
    
    
    @IBAction func btnReset(_ sender: UIButton)
    {
        //come back to it to reset
        score = 0
        cards = 0
        firstCardValue = 0
        firstCardIndex = 0
        secondCardValue = 0
        secondCardIndex = 0
        thirdCardValue = 0
        thirdCardIndex = 0
        fourthCardIndex = 0
        imgCard1.image = UIImage(named:"StartCard")
        imgCard2.image = UIImage(named:"StartCard")
        imgCard3.image = UIImage(named:"StartCard")
        imgCard4.image = UIImage(named:"StartCard")
        lblScore.text = String(score)
        lblCardsCorrect.text = String(cards)
    }
    
    func checkWon()
    {
        if(score >= 25)
        {
            let winAlert = UIAlertController(title: "Winner!" , message: "Congratulations! You've won the game!" , preferredStyle: UIAlertController.Style.alert)
            winAlert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:nil))
            present( winAlert, animated: true, completion: nil)
        }
    }
    
}


//
//  ViewController.swift
//  chooseWrongColorGame
//
//  Created by Abhi Thummar on 11/03/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var startButtonView: UIView!
    @IBOutlet weak var nextStartButton: UIButton!
    @IBOutlet weak var settingButton: UIButton!
    @IBOutlet weak var settingView: UIView!
    @IBOutlet weak var colorSwitch: UISwitch!
    @IBOutlet weak var animateLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpStartButtonView()
        settingButtonView()
    }

    private func animationIn(desiredView: UIView){
            let backgroundView = self.view!
            backgroundView.addSubview(desiredView)
            desiredView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            desiredView.alpha = 0
            desiredView.center = backgroundView .center
            
             UIView.animate(withDuration: 0.3, animations: {
                desiredView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                
                desiredView.alpha = 1
             } )
    }
    private func setUpStartButtonView(){
        startButtonView.layer.cornerRadius = 25
        startButtonView.layer.masksToBounds = true
        startButtonView.layer.borderWidth = 2
        startButtonView.layer.borderColor = UIColor.darkGray.cgColor
    }

    private func settingButtonView(){
        settingView.layer.cornerRadius = 25
        settingView.layer.masksToBounds = true
        settingView.layer.borderWidth = 2
        settingView.layer.borderColor = UIColor.darkGray.cgColor
    }
    
    func choseWrongColorAnimate(){
            animateLable.text = ""
            
            var charIndex = 0.0
            let nameText = "1. There will be 9 cards with color name \n 2.  pick the card, which don't match  the color name & color tile."
            
            for letter in nameText{
                Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { (timer) in
                    self.animateLable.text?.append(letter)
                }
                charIndex += 1
            }
        }
    @IBAction func playButtonTapped(_ sender: Any) {
        if playButton.isEnabled == true{
            animationIn(desiredView: startButtonView)
            view.backgroundColor = .lightGray
            choseWrongColorAnimate()
        }
    }
    @IBAction func nextStartButtonTapped(_ sender: Any) {
        pushToStartButtonView()
    }
    
    @IBAction func settingButtonTapped(_ sender: Any) {
        if settingButton.isEnabled == true{
            animationIn(desiredView: settingView)
            view.backgroundColor = .lightGray
        }
     
    }
    
    @IBAction func chagecolorSwitch(_ sender: UISwitch) {
        if colorSwitch.isOn {
            view.backgroundColor = .black
        }else{
            view.backgroundColor = .lightGray
        }
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        pushToHomePage()
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        settingView.alpha = 0
        view.backgroundColor = .white
    }
    
    private func pushToHomePage(){
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let viewController: ViewController = mainStoryBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        navigationController?.pushViewController(viewController, animated: false)
    }
    
    private func pushToStartButtonView(){
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let selectModeViewController: SelectModeViewController = mainStoryBoard.instantiateViewController(withIdentifier: "SelectModeViewController") as! SelectModeViewController
        
        navigationController?.pushViewController(selectModeViewController, animated: true)
    }
     
}


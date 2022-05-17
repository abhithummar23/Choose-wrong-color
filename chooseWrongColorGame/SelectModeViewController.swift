//
//  SelectModeViewController.swift
//  chooseWrongColorGame
//
//  Created by Abhi Thummar on 11/03/22.
//

import UIKit

class SelectModeViewController: UIViewController {

    @IBOutlet weak var easyModeButton: UIButton!
    @IBOutlet weak var hardModeView: UIButton!
    @IBOutlet weak var mediumModeButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    


    @IBAction func easyModeButtonTapped(_ sender: Any) {
        pushToSelectMode()
    }
    @IBAction func mediumModeButtonTapped(_ sender: Any) {
        pushToMediumMode()
    }
    @IBAction func hardModeButtonTapped(_ sender: Any) {
        pushToHardMode()
    }
    
    private func pushToSelectMode(){
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let easyModeViewController: EasyModeViewController = mainStoryBoard.instantiateViewController(withIdentifier: "EasyModeViewController") as! EasyModeViewController
        
        navigationController?.pushViewController(easyModeViewController, animated: true)
    }
    
    private func pushToMediumMode(){
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let mediumModeViewController: MediumModeViewController = mainStoryBoard.instantiateViewController(withIdentifier: "MediumModeViewController") as! MediumModeViewController
        
        navigationController?.pushViewController(mediumModeViewController, animated: true)
    }
    
    private func pushToHardMode(){
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let hardModeViewContoller: HardModeViewContoller = mainStoryBoard.instantiateViewController(withIdentifier: "HardModeViewContoller") as! HardModeViewContoller
        
        navigationController?.pushViewController(hardModeViewContoller, animated: true)
    }
}


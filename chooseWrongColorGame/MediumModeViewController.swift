//
//  mediumModeViewController.swift
//  chooseWrongColorGame
//
//  Created by Abhi Thummar on 20/03/22.
//


import UIKit

class MediumModeViewController: UIViewController {

    @IBOutlet weak var wrongColorCollectionView: UICollectionView!
    @IBOutlet weak var countingLable: UILabel!
    @IBOutlet weak var progressBarView: UIProgressView!
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var retryButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var scoreBordView: UIView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highscoreLabel: UILabel!
 
    // MARK: - Variable
    var numberOfItem: Int = 3
    var selectedCellIndex = -1
    var inset: UIEdgeInsets = UIEdgeInsets(top: 20, left: 4, bottom: 4, right: 4)
    var arrShowColour : NSMutableArray = NSMutableArray()
    var arrShowUIColore: NSMutableArray = NSMutableArray()
    var rightColorIndex: Int = Int()
    var wrongColorIndex: Int = Int()
    var righIndex: Int = 0
    var highScore: Int = 0
    var score : Int = 0
    var selectMode: String = ""
    var arrayOfColor: NSMutableArray = ["Black","Blue","Red","Green","Cyan","Yellow","Brown","Purple","Orange"]
    var arrcolor: NSMutableArray = [UIColor.black,UIColor.blue,UIColor.red,UIColor.green,UIColor.cyan,UIColor.yellow,UIColor.brown,UIColor.purple,UIColor.orange]
    var timer = Timer()
    var second: Float = 0.0
    var timeIntervel: Double = 0.0
    

    // MARK: - View cycle
        override func viewDidLoad() {
            super.viewDidLoad()
            setColours()
            setUpView()
            setupProgressBar()
            scorLableView()
//            setTimeForMode()
//            setTimeForProgressView()
            countingLable.text = "0"
            //SetCollectionView()
        }
    
    private func setUpView(){
        scoreBordView.layer.cornerRadius = 25
        scoreBordView.layer.masksToBounds = true
        scoreBordView.layer.borderWidth  = 2
        scoreBordView.layer.borderColor = UIColor.darkGray.cgColor
        wrongColorCollectionView.register(UINib(nibName: "WrongColorCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "WrongColorCollectionViewCell")
    }
   
    
    @IBAction func homeButtonTapped(_ sender: Any) {
        pushToHomePage()
    }
    @IBAction func retryTapped(_ sender: UIButton) {
        pushToSelectMode()
        
    }; private func scorLableView() {
        countingLable.layer.cornerRadius = 10
        countingLable.layer.masksToBounds = true
        countingLable.layer.borderWidth = 2
    }
    private func pushToHomePage(){
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let viewController = mainStoryBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        navigationController?.pushViewController(viewController, animated: true)
    }
 
    private func pushToSelectMode(){
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let easyModeViewController = mainStoryBoard.instantiateViewController(withIdentifier: "EasyModeViewController") as! EasyModeViewController
        
        navigationController?.pushViewController(easyModeViewController, animated: true)
    }
    
    //MARK: - ProgressBarView
    private func setupProgressBar(){
        timer.invalidate()
        second = 5
        timeIntervel = Double(Double(second)/Double(100))
        progressBarView.progress = 5
        timer = Timer.scheduledTimer(timeInterval: timeIntervel, target: self, selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
        scoreLabel.text = "Score : \(score)"
    }
    
    @objc
    func updateTimer(){
        if second > 0{
            second = second - Float(timeIntervel)
            progressBarView.progress = (second)/Float((timeIntervel*100))
        }else{
            timer.invalidate()
            animationIn(desiredView: scoreBordView)
        }
    }
//    var count: Float = 10
//    var timer: Timer = Timer()
//    var second: Float = 0.015
//
//    func setTimeForProgressView(){
//        timer.invalidate()
//        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(timerUpdate), userInfo: nil, repeats: true)
//    }
//
//    @objc func timerUpdate(){
//        if count > 0{
//            count = count - second
//            progressBarView.progress = Float(count)/10
//
//        }else {
//            timer.invalidate()
//            animationIn(desiredView: scoreBordView)
//        }
//    }
    
    
    // MARK:- SetColour
     func setColours(){
        arrShowColour = NSMutableArray(array: arrayOfColor.shuffled())
        arrShowUIColore=NSMutableArray()
        for i in 0..<arrShowColour.count{
         let colorIndex: Int = arrayOfColor.index(of: arrShowColour[i] as! String)
        arrShowUIColore.add(arrcolor[colorIndex])
    }
        rightColorIndex = Int(arc4random_uniform(9))
        wrongColorIndex = (rightColorIndex == 8) ? 2 : ((rightColorIndex == 9) ? 3: (rightColorIndex + 1))
        wrongColorCollectionView.reloadData()
    }
    
    
    
    // MARK: - PopUp View
    private func animationIn(desiredView: UIView){
            let backgroundView = self.view!
            
            backgroundView.addSubview(desiredView)
            
            desiredView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            desiredView.alpha = 0
            desiredView.center = backgroundView .center
            
             UIView.animate(withDuration: 0.3, animations: {
                desiredView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                
                desiredView.alpha = 1
             })
        }
}

// MARK: - Extensions - UICollectionViewDelegateFlowLayout
extension MediumModeViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let avilabelWidth = collectionView.frame.width - CGFloat((( numberOfItem+1)*4))
        let width: CGFloat = avilabelWidth/CGFloat(numberOfItem)
        return CGSize(width: width-20, height: width-50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return inset.left
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return inset.left
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return inset
    }
    
 
}

// MARK: - Extensions - UICollectionViewDelegate , UICollectionViewDataSource
extension MediumModeViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1        }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrShowUIColore.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let mediumModeViewCell: MediumModeViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MediumModeViewCell", for: indexPath) as! MediumModeViewCell
        if  wrongColorIndex == indexPath.row {
            righIndex = indexPath.row
            mediumModeViewCell.colorNameCell.text = arrShowColour[rightColorIndex] as? String
            mediumModeViewCell.backgroundColor = arrShowUIColore[wrongColorIndex] as? UIColor
        }else{
            mediumModeViewCell.colorNameCell.text = arrShowColour[indexPath.row] as? String
            mediumModeViewCell.backgroundColor = arrShowUIColore[indexPath.row] as? UIColor
        }
        setupProgressBar()
        
        return mediumModeViewCell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         if indexPath.row == righIndex {
             score += 1
             countingLable.text = String(score)
             setColours()
             
             
         }else {
             animationIn(desiredView: scoreBordView)
             scoreLabel.text = "Score : \(score)"
             wrongColorCollectionView.isHidden = true
             if score > highScore{
                 highScore = score
             }
             timer.invalidate()
             view.backgroundColor = .lightGray
             }
        selectedCellIndex = indexPath.row
        wrongColorCollectionView.reloadData()
        
    }
}

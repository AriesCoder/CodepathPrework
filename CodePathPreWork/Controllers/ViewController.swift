//
//  ViewController.swift
//  CodePathPreWork
//
//  Created by Aries Lam on 12/20/22.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var schoolLogo: UIImageView!
    
    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var schoolTF: UITextField!
    
    @IBOutlet weak var yearSC: UISegmentedControl!
    
    @IBOutlet weak var numberOfPetLabel: UILabel!
    
    @IBOutlet weak var morePetStepper: UIStepper!
    
    @IBOutlet weak var morePetSwitch: UISwitch!
    
    @IBOutlet weak var introBtn: UIButton!
    
    @IBOutlet weak var introductionsBtn: UIButton!
    
    var introduction = ""
    var introductions = [StudentIntro]()
    let persistenceManager = PersistenceManager()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        updateUIs()
    }
    
//MARK: - IBActions
    @IBAction func stepperDidChange(_ sender: UIStepper) {
        
        numberOfPetLabel.text = "\(Int(sender.value))"
    }
    
    
    @IBAction func introduceDidTapped(_ sender: Any) {
          
        guard !firstNameTF.text!.isEmpty,
              !lastNameTF.text!.isEmpty,
              !schoolTF.text!.isEmpty
        else{
            emptyFieldAlert()
            return
        }
        
        introductionAlert()
        
        let newIntro    = StudentIntro(context: persistenceManager.context)
        newIntro.name   = firstNameTF.text! + " " + lastNameTF.text!
        newIntro.introduction = introduction
        
        persistenceManager.saveStudentIntro()
    }
    
    
    @IBAction func introductionsDidTapped(_ sender: Any) {
        
        introductions = persistenceManager.loadStudentIntro()
    }
    
    
//MARK: - Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! IntroductionCVC
        destination.dataArr = introductions
    }
    
    
//MARK: - Alerts
    func emptyFieldAlert(){
        
        let alertController = UIAlertController(title: "Empty field(s)", message: "Please fill out the empty field(s)", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Okay", style: .default)
        
        alertController.addAction(action)
        
        present(alertController, animated: true, completion: nil)
    }
    
    
    func introductionAlert(){
        
        let year = yearSC.titleForSegment(at: yearSC.selectedSegmentIndex)
        
        introduction = "My name is \(firstNameTF.text!) \(lastNameTF.text!) and I attend \(schoolTF.text!). I am currently in my \(year!) year and I own \(numberOfPetLabel.text!) dogs. It is \(morePetSwitch.isOn) that I want more pets."
        
        let alertController = UIAlertController(title: "My Introdution", message: introduction, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Nice to meet you!", style: .default)
        
        alertController.addAction(action)
        
        present(alertController, animated: true, completion: nil)
    }
    
    
//MARK: - updateUIs
    func updateUIs(){
        
        configureTF()
        configureSchoolLogo()
        configureYearSC()
        configureIntroBtn()
        configureIntroductionsBtn()
    }
    
    
    func configureSchoolLogo(){
        
        schoolLogo.layer.cornerRadius   = 20
        schoolLogo.layer.masksToBounds  = false
        
        schoolLogo.layer.shadowRadius   = 10
        schoolLogo.layer.shadowOpacity  = 0.5
        schoolLogo.layer.shadowOffset   = .zero
    }
    
    
    func configureTF(){
        
        firstNameTF.layer.cornerRadius  = 10
        firstNameTF.clipsToBounds       = true
        firstNameTF.layer.borderWidth   = 2
        firstNameTF.layer.borderColor   = UIColor.systemCyan.cgColor
        firstNameTF.clearButtonMode     = .always
        
        lastNameTF.layer.cornerRadius   = 10
        lastNameTF.clipsToBounds        = true
        lastNameTF.layer.borderWidth    = 2
        lastNameTF.layer.borderColor    = UIColor.systemCyan.cgColor
        lastNameTF.clearButtonMode      = .always
        
        schoolTF.layer.cornerRadius     = 10
        schoolTF.clipsToBounds          = true
        schoolTF.layer.borderWidth      = 2
        schoolTF.layer.borderColor      = UIColor.systemCyan.cgColor
        schoolTF.clearButtonMode        = .always
    }
    
    
    func configureYearSC(){
        
        yearSC.selectedSegmentTintColor = .systemCyan
        let selectedTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        yearSC.setTitleTextAttributes(selectedTitleTextAttributes, for: .selected)
        
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemCyan]
        yearSC.setTitleTextAttributes(titleTextAttributes, for: .normal)
    }
    
    
    func configureIntroBtn(){
        
        introBtn.layer.cornerRadius = 20
        introBtn.tintColor          = .white
        introBtn.backgroundColor    = .systemCyan
        introBtn.clipsToBounds      = true
        }
    
    
    func configureIntroductionsBtn(){
        
        introductionsBtn.layer.cornerRadius = 10
        introductionsBtn.clipsToBounds      = true
        introductionsBtn.configuration?.baseForegroundColor    = .systemCyan
        introductionsBtn.configuration?.baseBackgroundColor    = .systemCyan
    }
    
}


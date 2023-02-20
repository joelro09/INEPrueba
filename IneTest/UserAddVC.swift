//
//  UserAddVC.swift
//  IneTest
//
//  Created by Jimena Reyes Reyes on 20/02/23.
//

import Foundation
import UIKit

class UserAddVC: UIViewController {
    
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var edadTxt: UITextField!
    @IBOutlet weak var countryTxt: UITextField!
    
    var nombre = ""
    var email = ""
    var edad = 0
    var pais = ""
    
    var isEditable = false
    
    //Referencia al Managed object context
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTxt.text = nombre
        emailTxt.text = email
        edadTxt.text = "\(edad)"
        countryTxt.text = pais
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    private func reset() {
        nameTxt.text = ""
        emailTxt.text = ""
        edadTxt.text = ""
        countryTxt.text = ""
    }
    
    @IBAction func saveUser(_ sender: Any) {
        guard let nombre = nameTxt.text,
              let email = emailTxt.text,
              let edad = edadTxt.text,
              let country = countryTxt.text
        else {
            print("Error: No puede quedar ningun campo vacío")
            return
        }
        
        if isEditable == true {
            
        }
        let newUser = Persona(context: self.context)
        newUser.nombre = nombre
        newUser.email = email
        newUser.edad = Int64(edad) ?? 1
        newUser.nombrePais = country
        //Guardar información
        try! self.context.save()
        
        reset()
    }
    
}


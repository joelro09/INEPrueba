//
//  ViewController.swift
//  IneTest
//
//  Created by Jimena Reyes Reyes on 20/02/23.
//

import Foundation
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tablePersons: UITableView!
    
    //Referencia al Managed object context
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var nombre = ""
    var email = ""
    var edad = 0
    var pais = ""
    
    private var personas: [Persona]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       setUp()
       retriveData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        retriveData()
    }
    
    private func setUp() {
        title = "USUARIOS"
        tablePersons.dataSource = self
        tablePersons.delegate = self
        tablePersons.register(UINib(nibName: "PersonTableViewCell", bundle: nil), forCellReuseIdentifier: "cellUser")
    }

    private func retriveData() {
        do {
            self.personas = try context.fetch(Persona.fetchRequest())
            DispatchQueue.main.async {
                self.tablePersons.reloadData()
            }
            
        } catch {
            print("Error al cargar los datos")
        }
    }

    @IBAction func agregarPerson(_ sender: Any) {
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? UserAddVC {
            vc.nombre = self.nombre
            vc.email = self.email
            vc.edad = self.edad
            vc.pais = self.pais
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        personas?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellUser") as! PersonTableViewCell
      
        let persona = personas?[indexPath.row]
        
        let nameComplete = persona?.nombre
        let apellido = nameComplete?.split(separator: " ")
        
        cell.namePerson.text = "Nombre: \(apellido?[0] ?? "Default apellido")"
        cell.lastNamePerson.text = "Apellido: \(apellido?[1] ?? "Default apellido")"
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let persona = personas?[indexPath.row]
        nombre = persona?.nombre ?? "Nombre dum"
        email = persona?.email ?? "email dum"
        edad = Int(persona?.edad ?? 0)
        pais = persona?.nombrePais ?? "País dum"
        self.performSegue(withIdentifier: "showEdit", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let actionDelete = UIContextualAction(style: .destructive, title: "Eliminar") { action, view, completionHandler in
            let usuarioEliminar = self.personas![indexPath.row]
            self.context.delete(usuarioEliminar)
            try! self.context.save()
            
            self.retriveData()
            
        }
        
        return UISwipeActionsConfiguration(actions: [actionDelete])
    }
    
    
}


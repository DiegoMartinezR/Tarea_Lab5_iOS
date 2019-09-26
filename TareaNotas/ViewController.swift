//
//  ViewController.swift
//  TareaNotas
//
//  Created by Diego Martinez Rayme on 9/25/19.
//  Copyright © 2019 Diego Martinez Rayme. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var notas:[Curso] = []
     var indiceCurso = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let nota = notas[indexPath.row]
        cell.textLabel?.text = nota.nombre
       
        let prom = promedio(nota: nota)
        if prom {
            cell.backgroundColor = UIColor.green
        }else {
            cell.backgroundColor = UIColor.red
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            notas.remove(at: indiceCurso)
            tableView.deleteRows(at: [indexPath] , with: .fade)
        }
    }
    

    func promedio(nota:Curso) -> Bool{
        let prompracticas = Double(nota.practica) * 0.3
        let promlaboratorio = Double(nota.laboratorio) * 0.6
        let promexamen = Double(nota.examenFinal) * 0.1
        
        let prom = prompracticas + promlaboratorio + promexamen
        
        nota.promedioFinal = Int(prom)
        
        if prom >= 13 {
            return true;
        }else{
            return false;
        }
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        indiceCurso = indexPath.row
        let curso = notas[indexPath.row]
        performSegue(withIdentifier: "cursoSeleccionado", sender: curso)
    }
    
    
    
    
    @IBAction func registrarCurso(_ sender: Any) {
         performSegue(withIdentifier: "agregarSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "agregarSegue"{
        let siguienteVC = segue.destination as! RegistrarCursoViewController
        siguienteVC.anteriorVC = self
        }
        if segue.identifier == "cursoSeleccionado"{
            let siguienteVC = segue.destination as! CursoSeleccionadoViewController
            siguienteVC.curso = sender as! Curso
            siguienteVC.anteriorVC = self
        }
        
    }
  


}


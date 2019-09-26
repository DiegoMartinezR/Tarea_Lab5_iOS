//
//  CursoSeleccionadoViewController.swift
//  TareaNotas
//
//  Created by Diego Martinez Rayme on 9/25/19.
//  Copyright © 2019 Diego Martinez Rayme. All rights reserved.
//

import UIKit

class CursoSeleccionadoViewController: UIViewController {

    var curso = Curso()
    var anteriorVC = ViewController()
    
    @IBOutlet weak var txtNombreCurso: UILabel!
   
    @IBOutlet weak var txtNotaPractica: UILabel!
    
    @IBOutlet weak var txtNotaLaboratorio: UILabel!
    
    @IBOutlet weak var txtNotaFinal: UILabel!
    
    @IBOutlet weak var txtPromedioFinal: UILabel!
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        txtNombreCurso.text = curso.nombre
        txtNotaPractica.text = String(curso.practica)
        txtNotaLaboratorio.text = String(curso.laboratorio)
        txtNotaFinal.text = String(curso.examenFinal)
        txtPromedioFinal.text = String(curso.promedioFinal)
       
    }
    

  
}

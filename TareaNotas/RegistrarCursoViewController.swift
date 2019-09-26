

import UIKit

class RegistrarCursoViewController: UIViewController {

   var anteriorVC = ViewController()
    @IBOutlet weak var txtNombreNota: UITextField!
    
    @IBOutlet weak var txtLaboratorioNota: UITextField!
    
    @IBOutlet weak var txtPracticasNota: UITextField!
    
    @IBOutlet weak var txtNotaFinal: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    @IBAction func registrar(_ sender: Any) {
       
        let agregar = Curso()
        agregar.nombre = txtNombreNota.text!
        agregar.practica = Int(txtLaboratorioNota.text!)!
        agregar.laboratorio = Int(txtPracticasNota.text!)!
        agregar.examenFinal = Int(txtNotaFinal.text!)!
        
        anteriorVC.notas.append(agregar)
        anteriorVC.tableView.reloadData()
        navigationController!.popViewController(animated: true)
        
    }
    
}

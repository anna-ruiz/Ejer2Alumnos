//
//  ViewController.swift
//  Ejer2Alumnos
//
//  Created by Anna on 07/10/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtNombre: UITextField!
    
    @IBOutlet weak var txtTotalPreguntas: UITextField!
    @IBOutlet weak var txtTotalAcertadas: UITextField!
    @IBOutlet weak var txtPosicionLista: UITextField!
    
    //Variables para la lógica
    var listaExamenes:[Examen]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listaExamenes = []
        
    }

    @IBAction func btnInsertarExamen(_ sender: Any) {
        
        let nombre = txtNombre.text!
        let totalPreguntas = txtTotalPreguntas.text!
        let totalAciertos = txtTotalAcertadas.text!
        
        if nombre.isEmpty || totalPreguntas.isEmpty || totalAciertos.isEmpty{
            alertaError(titulo: "Error", mensaje: "Faltan datos por rellenar.")
        }else{
            //guardamos la info en un objeto q añadimos a la lista
            listaExamenes.append(Examen(nombre: nombre, totalPreguntas: Int(totalPreguntas)!, totalAcertadas: Int(totalAciertos)!))
            
            txtNombre.text = ""
            txtTotalPreguntas.text = ""
            txtTotalAcertadas.text = ""
        }
        
    }
    
    
    func alertaError(titulo: String, mensaje: String){
        let alert = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .destructive, handler: nil))
        
        //Para q se muestre en la ventana
        self.present(alert, animated: true, completion: nil)
    }
    
    
        
    //CREAMOS EL PREPARE FOR SEGUE
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let posicion = txtPosicionLista.text!
        
        if posicion.isEmpty {
            alertaError(titulo: "Error", mensaje: "Pon un indice")
        }else{
            if Int(posicion)! < 1 || Int(posicion)! > listaExamenes.count {
                alertaError(titulo: "Error", mensaje: "Posición Incorrecta!!")
            }else{
               // lbResultado.text = listaExamenes[Int(posicion)! - 1].toString()
                
                //PARA PASAR DE UNA VENTANA A OTRA!!!!!!
                if segue.identifier == "VER"{
                    let destino = segue.destination as! VerExamenViewController
                    destino.examen = listaExamenes[Int(posicion)! - 1]
                }
            }
        }
    }
    
}


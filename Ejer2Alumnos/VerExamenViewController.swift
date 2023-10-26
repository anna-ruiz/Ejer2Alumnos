//
//  VerExamenViewController.swift
//  Ejer2Alumnos
//
//  Created by Anna Ruiz on 26/10/2023.
//

import UIKit

class VerExamenViewController: UIViewController {

    @IBOutlet weak var lbNombre: UILabel!
    @IBOutlet weak var lbPreguntas: UILabel!
    @IBOutlet weak var lbTotalAcertadas: UILabel!
    @IBOutlet weak var lbNotaFinal: UILabel!
    
    var examen: Examen!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lbNombre.text = examen.nombre
        lbPreguntas.text = "\(examen.totalPreguntas)"
        lbTotalAcertadas.text = "\(examen.totalAcertadas)"
        lbNotaFinal.text = "\(String(examen.notaFinal))"
    
        
        
    }
}

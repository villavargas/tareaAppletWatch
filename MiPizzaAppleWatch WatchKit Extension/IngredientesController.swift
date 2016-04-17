//
//  IngredientesController.swift
//  MiPizzaAppleWatch
//
//  Created by Luis Alejandro Villa Vargas on 17/04/16.
//  Copyright © 2016 Luis Alejandro Villa Vargas. All rights reserved.
//

import WatchKit
import Foundation


class IngredientesController: WKInterfaceController {
    
    var resultado:[String] = []
    
    var ingredientes:[String] = []
    var tamaño = ""
    var masa = ""
    var queso = ""
    
    @IBOutlet var btnSiguiente: WKInterfaceButton!


    @IBOutlet var seleccionIngredientes: WKInterfaceLabel!
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        
        let c = context as! Valor
       // seleccionIngredientes.setText(String(c.queso))
        print("Queso: \(c.queso)   Tamaño: \(c.valores)    Masa: \(c.masa)")
        tamaño = c.valores
        masa = c.masa
        queso = c.queso
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    
    @IBAction func jamon(value: Bool) {
        if(value){
            ingredientes.append("Jamon")
            resultado.append("Jamon")
        }else{
            ingredientes = ingredientes.filter(){ $0 != "Jamon"}
            resultado = resultado.filter(){ $0 != "Jamon"}
        }
        habilitarBoton()
    }
    
    @IBAction func pepperoni(value: Bool) {
        if(value){
            ingredientes.append("Pepperoni")
            resultado.append("Pepperoni")
        }else{
            ingredientes = ingredientes.filter(){ $0 != "Pepperoni"}
            resultado = resultado.filter(){ $0 != "Pepperoni"}
        }
        habilitarBoton()
    }
    
    @IBAction func pavo(value: Bool) {
        if(value){
            ingredientes.append("Pavo")
            resultado.append("Pavo")
        }else{
            ingredientes = ingredientes.filter(){ $0 != "Pavo"}
            resultado = resultado.filter(){ $0 != "Pavo"}
        }
        habilitarBoton()
    }
    
    @IBAction func salchicha(value: Bool) {
        if(value){
            ingredientes.append("Salchicha")
            resultado.append("Salchicha")
        }else{
            ingredientes = ingredientes.filter(){ $0 != "Salchicha"}
            resultado = resultado.filter(){ $0 != "Salchicha"}
        }
        habilitarBoton()
    }
    
    @IBAction func aceituna(value: Bool) {
        if(value){
            ingredientes.append("Aceituna")
            resultado.append("Aceituna")
        }else{
            ingredientes = ingredientes.filter(){ $0 != "Aceituna"}
            resultado = resultado.filter(){ $0 != "Aceituna"}
        }
        habilitarBoton()
    }
    

    
    @IBAction func cebolla(value: Bool) {
        if(value){
            resultado.append("Cebolla")
            ingredientes.append("Cebolla")
        }else{
            resultado = resultado.filter(){ $0 != "Cebolla"}
            ingredientes = ingredientes.filter(){ $0 != "Cebolla"}
        }
        habilitarBoton()
    }
    
   
    
    func habilitarBoton() {
        if (ingredientes.count == 0) {
            btnSiguiente.setHidden(true)
        } else {
            btnSiguiente.setHidden(false)
        }
    }
    
    @IBAction func btnActionSiguiente() {
      
        print("Seleccion tamaño: \(resultado)")
        //let valores:String = seleccion
        let valorContexto = Valor(d:"Tamaño", i:tamaño, m: masa, q:queso, ingr:resultado)
        pushControllerWithName("ConfirmacionSegue", context: valorContexto)
    }


}

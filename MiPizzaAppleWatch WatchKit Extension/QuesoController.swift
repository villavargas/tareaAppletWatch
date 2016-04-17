//
//  QuesoController.swift
//  MiPizzaAppleWatch
//
//  Created by Luis Alejandro Villa Vargas on 17/04/16.
//  Copyright © 2016 Luis Alejandro Villa Vargas. All rights reserved.
//

import WatchKit
import Foundation


class QuesoController: WKInterfaceController {
    
    var arrayCheeses:[(String, String)] =
        [("Cheese 'M'", "Mozzarella"),
         ("Cheese 'C'", "Cheddar"),
         ("Cheese 'P'", "Parmesano"),
         ("No cheese", "Sin queso")]
    
    @IBOutlet var seleccionQueso: WKInterfaceLabel!

    @IBOutlet var pickerQueso: WKInterfacePicker!
    var seleccion:String = "Sin queso"
    var masa:String = ""
    var tamaño:String = ""
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        // Configure interface objects here.
        let c = context as! Valor
        seleccionQueso.setText(String(seleccion))
        
        masa = c.masa
        tamaño = c.valores
        print("Masa en controller queso: \(c.masa)")
        
        let pickerItems: [WKPickerItem] = arrayCheeses.map() {
            let pickerItem = WKPickerItem()
            pickerItem.title = $0.1
            pickerItem.caption = $0.0
            return pickerItem
        }
        pickerQueso.setItems(pickerItems)
        
    }

    @IBAction func pickerSeleccionQueso(value: Int) {
        let selection = arrayCheeses[value].1
        seleccionQueso.setText(String(selection))
        seleccion = String(selection)
        print("Seleccion 1 tamaño: \(seleccion)")
    }
    
    
    @IBAction func nextQuesoValor() {
        print("Seleccion tamaño: \(seleccion)")
        //let valores:String = seleccion
        let valorContexto = Valor(d:"Tamaño", i:tamaño, m: masa, q:seleccion, ingr:[""])
        pushControllerWithName("IdentificadorIngredientes", context: valorContexto)

    }
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}

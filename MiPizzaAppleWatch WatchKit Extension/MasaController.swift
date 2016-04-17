//
//  MasaController.swift
//  MiPizzaAppleWatch
//
//  Created by Luis Alejandro Villa Vargas on 17/04/16.
//  Copyright © 2016 Luis Alejandro Villa Vargas. All rights reserved.
//

import WatchKit
import Foundation


class MasaController: WKInterfaceController {
    
    var arrayBases:[(String, String)] =
        [("Base 'XS'", "Delgada"),
         ("Base 'S'", "Crujiente"),
         ("Base 'L'", "Gruesa")]


    var pickerItems:[WKPickerItem]?
    
    @IBOutlet var etiquetaResultado: WKInterfaceLabel!
    
    @IBOutlet var PickerMasa: WKInterfacePicker!
     var seleccion:String = "Delgada"
    var tamaño:String = ""
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        let c = context as! Valor
        
        etiquetaResultado.setText(String(seleccion))
        tamaño = c.valores
        print("Tamaño en controller masa: \(c.valores)")
        
        let pickerItems: [WKPickerItem] = arrayBases.map() {
            let pickerItem = WKPickerItem()
            pickerItem.title = $0.1
            pickerItem.caption = $0.0
            return pickerItem
        }
        PickerMasa.setItems(pickerItems)
    }

    @IBAction func PickerSeleccionaValor(value: Int) {
        let selection = arrayBases[value].1
        etiquetaResultado.setText(String(selection))
        seleccion = String(selection)
        print("Seleccion 1 tamaño: \(seleccion)")
    }
    
    @IBAction func nextMasaValor() {
        
        print("Seleccion tamaño: \(seleccion)")
        //let valores:String = seleccion
        let valorContexto = Valor(d:"Tamaño", i:tamaño, m: seleccion, q:"", ingr:[""])
        pushControllerWithName("IdentificadorQueso", context: valorContexto)

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

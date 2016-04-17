//
//  TamanoController.swift
//  MiPizzaAppleWatch
//
//  Created by Luis Alejandro Villa Vargas on 12/04/16.
//  Copyright © 2016 Luis Alejandro Villa Vargas. All rights reserved.
//

import WatchKit
import Foundation


class TamanoController: WKInterfaceController {

    let tamañosDiferentes:[(String, String)] =
    [("Size 'M'", "Pequeña"),
    ("Size 'L'", "Mediana"),
    ("Size 'XL'", "Grande")]
    
     var pickerItems:[WKPickerItem]?
    
    @IBOutlet var tamaño: WKInterfaceLabel!
    @IBOutlet var pickerSize: WKInterfacePicker!
    var seleccion:String = "Pequeña"
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        
          tamaño.setText(String(seleccion))
        
        let pickerItems: [WKPickerItem] = tamañosDiferentes.map() {
            let pickerItem = WKPickerItem()
            pickerItem.title = $0.1
            pickerItem.caption = $0.0
            return pickerItem
        }
        pickerSize.setItems(pickerItems)

    }

    
    @IBAction func valorTamaño(value: Int) {
        let selection = tamañosDiferentes[value].1
   //     aPizza.base=selection
    //    buttonBase.setTitle(selection)
        tamaño.setText(String(selection))
        seleccion = String(selection)
          print("Seleccion 1 tamaño: \(seleccion)")
    }
    

    
    @IBAction func nextValue() {
        print("Seleccion tamaño: \(seleccion)")
        let valores:String = seleccion
        let valorContexto = Valor(d:"Tamaño", i:valores, m: "", q:"", ingr:[""])
        pushControllerWithName("IdentificadorValor", context: valorContexto)
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

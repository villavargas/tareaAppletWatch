//
//  ConfirmacionController.swift
//  MiPizzaAppleWatch
//
//  Created by Luis Alejandro Villa Vargas on 17/04/16.
//  Copyright © 2016 Luis Alejandro Villa Vargas. All rights reserved.
//

import WatchKit
import Foundation


class ConfirmacionController: WKInterfaceController {
    @IBOutlet var ingredientes: WKInterfaceLabel!
    @IBOutlet var Queso: WKInterfaceLabel!
    @IBOutlet var Tamaño: WKInterfaceLabel!
   
    @IBOutlet var masa: WKInterfaceLabel!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        let c = context as! Valor
        Queso.setText(String(c.queso))
        Tamaño.setText(String(c.valores))
        masa.setText(String(c.masa))
        //ingredientes.setText()
        
        var ing:String = String(c.ingredientes[0])
        if c.ingredientes.count > 1{
          for index in 1...c.ingredientes.count-1 {
              ing += "," + c.ingredientes[index]
              print(c.ingredientes[index])
          }
        }
        ingredientes.setText(ing)
       
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

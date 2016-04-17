//
//  Valor.swift
//  MiPizzaAppleWatch
//
//  Created by Luis Alejandro Villa Vargas on 12/04/16.
//  Copyright © 2016 Luis Alejandro Villa Vargas. All rights reserved.
//

import WatchKit

class Valor: NSObject {
        
    var descripcion:String=""
    var valores:String = ""
    var masa:String = ""
    var queso:String = ""
    var ingredientes:[String] = []
    
    init(d:String,i:String, m:String, q:String, ingr:[String]){
         descripcion=d
         valores = i
         masa = m
         queso = q
         ingredientes = ingr
    }
}

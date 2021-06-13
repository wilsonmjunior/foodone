//
//  Refeicao.swift
//  foodone
//
//  Created by Wilson Junior on 25/05/21.
//

import UIKit

class Refeicao: NSObject, NSCoding {
    
    let nome: String
    let felicidade: Int
    var items: Array<Item>
    
    init(nome: String, felicidade: Int, items: [Item] = []) {
        self.nome = nome
        self.felicidade = felicidade
        self.items = items
    }
    
    // MARK - NSCoding
    
    func encode(with coder: NSCoder) {
        coder.encode(nome, forKey: "nome")
        coder.encode(felicidade, forKey: "felicidade")
        coder.encode(items, forKey: "items")
    }
    
    required init?(coder: NSCoder) {
        nome = coder.decodeObject(forKey: "nome") as! String
        felicidade = coder.decodeInteger(forKey: "felicidade")
        items = coder.decodeObject(forKey: "items") as! Array<Item>
    }
    
    // MARK - Metodos
    
    func totalDeCalorias() -> Double {
        var total = 0.0
        
        for item in items {
            total += item.calorias
        }
        
        return total
    }
    
    func detalhes() -> String {
        var mensagem = "Felicidade: \(felicidade)"
        for item in items {
            mensagem += ", \(item.nome) - calorias \(item.calorias)"
        }
        
        return mensagem
    }
}

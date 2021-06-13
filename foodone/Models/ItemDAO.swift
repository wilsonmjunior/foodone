//
//  ItemDAO.swift
//  foodone
//
//  Created by Wilson Junior on 13/06/21.
//

import UIKit

class ItemDAO {
    
    func save(_ items: [Item]) {
        do {
            let dados = try NSKeyedArchiver.archivedData(withRootObject: items, requiringSecureCoding: false)
            guard let caminho = recuperarCaminho() else { return }
            try dados.write(to: caminho)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func recupera() -> [Item] {
        do {
            guard let caminho = recuperarCaminho() else { return [] }
            
            let dados = try Data(contentsOf: caminho)
            let itemsSalvos = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dados) as! [Item]
            
            return itemsSalvos
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
    func recuperarCaminho() -> URL? {
        guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return nil
        }
        let caminho = diretorio.appendingPathComponent("items")

        return caminho
    }
}

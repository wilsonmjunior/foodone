//
//  RemoveRefeicaoViewController.swift
//  foodone
//
//  Created by Wilson Junior on 12/06/21.
//

import UIKit

class RemoveRefeicaoViewController {
    
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func exibe(_ refeicao: Refeicao, handler: @escaping ((UIAlertAction) -> Void)) {
        let alerta = UIAlertController(title: refeicao.nome, message: refeicao.detalhes(), preferredStyle: .alert)
        
        let botaoCancelar = UIAlertAction(title: "ok", style: .cancel)
        let botaoRemover = UIAlertAction(
            title: "remover",
            style: .destructive,
            handler: handler)
     
        alerta.addAction(botaoCancelar)
        alerta.addAction(botaoRemover)
        
        controller.present(alerta, animated: true, completion: nil)
    }
}

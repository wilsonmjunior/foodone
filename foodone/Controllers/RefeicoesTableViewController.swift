//
//  RefeicoesTableViewController.swift
//  foodone
//
//  Created by Wilson Junior on 30/05/21.
//

import UIKit

class RefeicoesTableViewController: UITableViewController, AdicionaRefeicaoDelegate {
    // MARK: - Atributos
    
    var refeicoes: Array<Refeicao> = []

    // MARK - View life cycle
    
    override func viewDidLoad() {
        refeicoes = RefeicaoDAO().recupera()
    }
    
    // MARK - TableView
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        let refeicao = refeicoes[indexPath.row]
        
        celula.textLabel?.text = refeicao.nome
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(mostrarDetalhes(_:)))
        celula.addGestureRecognizer(longPress)
        
        return celula
    }
    
    @objc func mostrarDetalhes(_ gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            let celula = gesture.view as! UITableViewCell
            
            guard let indexPath = tableView.indexPath(for: celula) else { return }
            
            let refeicao = refeicoes[indexPath.row]
            
            RemoveRefeicaoViewController(controller: self).exibe(refeicao, handler: { alerta in
                self.refeicoes.remove(at: indexPath.row)
                self.tableView.reloadData()
            })
        }
    }
    
//  _ serve para ocultar
    func add(_ refeicao: Refeicao) {
        refeicoes.append(refeicao)
        tableView.reloadData()
        
        RefeicaoDAO().save(refeicoes)
    }
    
//    func add(_ refeicao, felicidade: Int) {}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//      é bom sempre colocar um identifier para o segue no storyboard
        if segue.identifier == "adicionar" {
            if let viewController = segue.destination as? ViewController {
                viewController.delegate = self
//                prepara(for: segue)
            }
        }
    }
    
//    func prepara(for segue: UIStoryboardSegue) {
//
//    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selecionado \(refeicoes[indexPath.row].nome)")
    }
}

//
//  ViewController.swift
//  foodone
//
//  Created by Wilson Junior on 25/05/21.
//

import UIKit

protocol AdicionaRefeicaoDelegate {
    func add(_ refeicao: Refeicao)
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AdicionarItemDelegate {
    // MARK: - Atributos
    
    var delegate: AdicionaRefeicaoDelegate?
    var items: [Item] =  []
    var itemsSelecionados: [Item] = []
    
     // MARK: - IBOutlets
    
    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet var felicidadeTextField: UITextField?
    @IBOutlet weak var itemsTableView: UITableView?
    
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        items = ItemDAO().recupera()
        
        let botaoAdicionarItem = UIBarButtonItem(
            title: "adicionar",
            style: .plain,
            target: self,
            action: #selector(self.adicionarItem))
        
        navigationItem.rightBarButtonItem = botaoAdicionarItem
    }
    
    @objc func adicionarItem() {
        let adicionarItensViewController = AdicionarItensViewController(delegate: self)
        
        navigationController?.pushViewController(adicionarItensViewController, animated: true)
    }
    
    
    func addItem(_ item: Item) {
        items.append(item)
        if let tableView = itemsTableView {
            tableView.reloadData()
        } else {
            Alerta(controller: self).exibe(mensagem: "Não foi possível atualizar a tabela")
        }
        
        ItemDAO().save(items)
    }
    
    // MARK - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        let linha = indexPath.row
        let item = items[linha]
        celula.textLabel?.text = item.nome
        
        return celula
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let celula = tableView.cellForRow(at: indexPath) else { return }
        
        if celula.accessoryType == .none {
            celula.accessoryType = .checkmark
            
            let item = items[indexPath.row]
            itemsSelecionados.append(item)
        } else {
            celula.accessoryType = .none
            
            let item = items[indexPath.row]
            if let position = itemsSelecionados.firstIndex(of: item) {
                itemsSelecionados.remove(at: position)
            }
        }
        
    }
    
    func recuperarRefeicaoDoFormulario() -> Refeicao? {
        guard let nome = nomeTextField?.text else {
            return nil
        }
        
        guard let felicidadeDaRefeicao = felicidadeTextField?.text,
              let felicidade = Int(felicidadeDaRefeicao) else {
                return nil
            }

        let refeicao = Refeicao(nome: nome, felicidade: felicidade, items: itemsSelecionados)
        
        return refeicao
    }
        
    // MARK: - IBAtions
    
    @IBAction func adicionar() {
        if let refeicao = recuperarRefeicaoDoFormulario() {
            delegate?.add(refeicao)
            navigationController?.popViewController(animated: true)
        } else {
            Alerta(controller: self).exibe(mensagem: "Erro ao ler dados do formulário")
        }
    }
}


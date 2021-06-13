//
//  AdicionarItensViewController.swift
//  foodone
//
//  Created by Wilson Junior on 06/06/21.
//

import UIKit

protocol AdicionarItemDelegate {
    func addItem(_ item: Item)
}

class AdicionarItensViewController: UIViewController {
    // MARK: - View Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK - IBOutlets
    
    @IBOutlet weak var nomeTextField: UITextField?
    @IBOutlet weak var caloriasTextField: UITextField?
    
    // MARK: - Atributos
    
    var delegate: AdicionarItemDelegate?
    
    
    init(delegate: AdicionarItemDelegate) {
        super.init(nibName: "AdicionarItensViewController", bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - IBAction
    
    @IBAction func adicionarItem(_ sender: Any) {
        guard let nome = nomeTextField?.text else { return }
        guard let caloriasText = caloriasTextField?.text,
              let calorias = Double(caloriasText) else { return }
        
        let item = Item(nome: nome, calorias: calorias)
        delegate?.addItem(item)
        
        navigationController?.popViewController(animated: true)
    }
}

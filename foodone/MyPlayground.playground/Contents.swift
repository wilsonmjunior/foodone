import UIKit
//
//let nome = "Macarrao"
//let felicidade = 5
//let calorias = 135.5
//let vegetal = true
//
//func alimentoConsumido(_ nome: String, _ calorias: Double) {
//    print("O alimento consumido foi o \(nome) com \(calorias) calorias")
//}
//
//func alimentoConsumidoParamExplicito(nome: String, calorias: Double) {
//    print("O alimento consumido foi o \(nome) com \(calorias) calorias")
//}

//alimentoConsumido(nome, calorias)
//alimentoConsumidoParamExplicito(nome: nome, calorias: calorias)


// Modulo Arrays

//let totalDCalorias = [20.5, 10, 60.7, 90.2, 120.6]

//print(totalDCalorias)
//
//for i in 0...3 {
//    print(i)
//    print(totalDCalorias[i])
//}
//
//for i in 0...totalDCalorias.count - 1 {
//    print(i)
//    print(totalDCalorias[i])
//}
//
//for caloria in totalDCalorias {
//    print(caloria)
//}

//func todasCalorias(totalCalorias: Array<Double>) -> Double {
//    var total: Double = 0
//
//    for caloria in totalCalorias {
//        total += caloria
//    }
//
//    return total
//}

//print("Total:", todasCalorias(totalCalorias: totalDCalorias))

// Classes

//class Refeicao2 {
//    var nome: String?
//    var felicidade: Int?
//}
//
//let refeicao2 = Refeicao2()
//refeicao2.nome = "Lasanha"

//forced unwrap
//print(refeicao2.nome!)

//if refeicao2.nome != nil {
//    print(refeicao2.nome!)
//}

//if let nome = refeicao2.nome {
//    print(nome)
//}

//func exibeNomeDaRefeicao() {
//    if let nome = refeicao2.nome {
//        print("if let", nome)
//    }
//
//    guard let nome = refeicao2.nome else {
//        return
//    }
//
//    print("guard let", nome)
//}
//
//exibeNomeDaRefeicao()
//
//let numero = Int("10")
//
//if let n = numero {
//    print("numero: ", n)
//} else {
//    print("erro ao converter o numero!")
//}

class Item {
    var nome: String
    var calorias: Double
    
    init(nome: String, calorias: Double) {
        self.nome = nome
        self.calorias = calorias
    }
}

class Refeicao {
    var nome: String
    var felicidade: Int
    var items: Array<Item> = []
    
    init(nome: String, felicidade: Int) {
        self.nome = nome
        self.felicidade = felicidade
    }
    
    func totalDCalorias() -> Double {
        var total = 0.0
        
        for item in refeicao.items {
            total += item.calorias
        }
        
        return total
    }
}
  

let arroz = Item(nome: "Arroz", calorias: 51.0)
let feijao = Item(nome: "Feijão", calorias: 80.5)

let refeicao = Refeicao(nome: "Macarrao", felicidade: 4)

refeicao.items.append(arroz)
refeicao.items.append(feijao)

print(refeicao.nome)

if let primeiroItem = refeicao.items.first {
    print(primeiroItem.nome)
}

print(refeicao.totalDCalorias())

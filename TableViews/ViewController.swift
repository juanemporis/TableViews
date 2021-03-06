//
//  ViewController.swift
//  TableViews
//
//  Created by wendy manrique on 28/04/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private let  myCountries = ["España","Mexico","Peru","Colombia","Argentina","Venezuela","EE.UU","Francia","Italia"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //DataSource indica que elementos va a tener nuestra tabla
        tableView.dataSource = self
        tableView.delegate = self
        
        //Nuestra tabla podra pintar seran de MyCustomTableViewCell
        tableView.register(UINib(nibName: "MyCustomTableViewCell", bundle: nil), forCellReuseIdentifier: "mycustomcell")
    }

 
}

extension ViewController : UITableViewDataSource{
    //Esta operacion pondra Sub Titulos en la cabecera de ambas celdas
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Celdas simples"
        }
        return "Celdas Custom"
    }
   
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if section == 0 {
            return "Footer para Celdas Simples"
        }
        return "Footer para seldas Custom"
    }
    
    
    //Esta operacion indicara cuantas celdas debera tener nuestra tabla
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myCountries.count  //Esta operacion agregara un pais cada que se agregue uno en myCountries
    
}
    //Esta operacion podremos decirle cuantas secciones tendra neustra tabla
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 50
        }
        return UITableView.automaticDimension  //Esta operacion creara celdas de altura dinamica 
    }
    
    //Esta operacion va a definir el contenido de cada una de las celdas
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
        var cell = tableView.dequeueReusableCell(withIdentifier: "mycell")
        if cell == nil{
            //Esta operacion se encargara de modificar las las celdas
            cell = UITableViewCell(style: .default, reuseIdentifier: "mycell")//Esta oepracion modifica el estilo de las celdas
            cell?.backgroundColor = .gray//Esta operacion modifica el color de las celdas
            cell?.textLabel?.font = UIFont.systemFont(ofSize: 20)//Esta operacion modifica el tamaño de letra
            cell?.accessoryType = .disclosureIndicator//Esta operacion te muestra una flecha de cambio de pantalla
        }
    
        cell!.textLabel?.text = myCountries[indexPath.row]
        return cell!
        }
           
            let cell = tableView.dequeueReusableCell(withIdentifier: "mycustomcell", for: indexPath) as?
            MyCustomTableViewCell
            
            cell?.myFirstLabel.text = String(indexPath.row + 1)
            cell!.mySecondLabel.text = myCountries[indexPath.row]
        
        //Con esta operacion se modifica el nombre de los paises el indexpath == 2 indica el pais de peru 
        if indexPath.row == 2 {
            cell!.mySecondLabel.text = "sfddsfdsfsdfdsnjkfhdsfbdsjkfhjdsbfhjddjafhsdjkfjksdhfkjsdhfkjsdhfkjhdsjkfhsdkjhfkjdshfjkhdskjfhsdjhfksdjhfkjsdhfjkdhkjfhdjskhfkjsdhfk"
   }
        return cell!

    }
}

extension ViewController: UITableViewDelegate{
    //Esta operacion va a llamar cada ves que se da click
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(myCountries[indexPath.row])
    }
    
}

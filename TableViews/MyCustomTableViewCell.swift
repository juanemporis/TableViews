//
//  MyCustomTableViewCell.swift
//  TableViews
//
//  Created by wendy manrique on 2/05/22.
//

import UIKit

class MyCustomTableViewCell: UITableViewCell {
    @IBOutlet weak var myFirstLabel: UILabel!
    @IBOutlet weak var mySecondLabel: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    
    //Esta operacion podra retocar cualquiera de los elementos tanto como de la celda o los elemntos custom que hemos creado en ella
    override func awakeFromNib() {
        super.awakeFromNib()
        
        myFirstLabel.font = UIFont.boldSystemFont(ofSize: 20)
        myFirstLabel.textColor = .blue
        
        backgroundColor = .gray
    }
//Esta operacion encadena una accion en pantalla
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        //En caso que nuestra label sea nulo nos va a mostrar un texto vacio
        print(myFirstLabel.text ?? "")

        
    }
    
}

//
//  ViewController.swift
//  iOStest
//
//  Created by Said Sarabia Saavedra on 3/10/19.
//  Copyright © 2019 Said Sarabia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var limitdateLabel: UILabel!
    @IBOutlet weak var areaLabel: UILabel!
    @IBOutlet weak var pricelabel: UILabel!
    @IBOutlet weak var licenseLabel: UILabel!
    @IBOutlet weak var builderLabel: UILabel!
    @IBOutlet weak var desc1Label: UILabel!
    @IBOutlet weak var desc2Label: UILabel!
    @IBOutlet weak var desc3Label: UILabel!
    @IBOutlet weak var serv1Label: UILabel!
    @IBOutlet weak var serv2Label: UILabel!
    @IBOutlet weak var serv3Label: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    
    let url = URL(string: "https://chapin.vintapp.mx/projectsNoLogin")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let projectservice = projectService(url: url)
        
        //IniceJSON : indice del array en el JSON de respuesta
        projectservice.getProject(IndiceJSON: 1) { (informacion) in
            if let informacion = informacion{
                DispatchQueue.main.async {
                    if let nombre = informacion.name{
                        self.nameLabel.text = "\(nombre)"
                    }else{
                        self.nameLabel.text = ""
                    }
                    if let limite = informacion.limitdate{
                        self.limitdateLabel.text = "\(limite)"
                    }else{
                        self.limitdateLabel.text = ""
                    }
                    if let area = informacion.area{
                        self.areaLabel.text = "\(area)"
                    }else{
                        self.areaLabel.text = ""
                    }
                    if let precio = informacion.price{
                        self.pricelabel.text = "\(precio)"
                    }else{
                        self.pricelabel.text = ""
                    }
                    if let licencia = informacion.license{
                        self.licenseLabel.text = "\(licencia)"
                    }else{
                        self.licenseLabel.text = ""
                    }
                    if let builder = informacion.builder{
                        self.builderLabel.text = "\(builder)"
                    }else{
                        self.builderLabel.text = ""
                    }
                    if let desc1 = informacion.description?[0]{
                        self.desc1Label.text = "\(desc1)"
                    }else{
                        self.desc1Label.text = ""
                    }
                    if let desc2 = informacion.description?[1]{
                        self.desc2Label.text = "\(desc2)"
                    }else{
                        self.desc2Label.text = ""
                    }
                    if let desc3 = informacion.description?[2]{
                        self.desc3Label.text = "\(desc3)"
                    }else{
                        self.desc3Label.text = ""
                    }
                    if let serv1 = informacion.services?[0]{
                        self.serv1Label.text = "\(serv1)"
                    }else{
                        self.serv1Label.text = ""
                    }
                    if let serv2 = informacion.services?[1]{
                        self.serv2Label.text = "\(serv2)"
                    }else{
                        self.serv2Label.text = ""
                    }
                    if let serv3 = informacion.services?[2]{
                        self.serv3Label.text = "\(serv3)"
                    }else{
                        self.serv3Label.text = ""
                    }
                }
            }
        }
    }
}


//
//  ProviderVC.swift
//  A2_FA_iOS_Saurav_C0794691
//
//  Created by Saurav Bajracharya on 2021-05-26.
//  Copyright © 2021 Saurav Bajracharya. All rights reserved.
//

import UIKit



class ProviderVC: UIViewController {
    
    var provider: Provider?
    var products = [Product]()

    @IBOutlet weak var productName: UILabel!
    
    @IBOutlet weak var providerView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension ProviderVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProviderCell") as! ProviderVC
        cell.productName.text = self.products[indexPath.row].name
        
        return cell
    }
    
    
}

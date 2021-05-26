//
//  ProductVC.swift
//  A2_FA_iOS_Saurav_C0794691
//
//  Created by Saurav Bajracharya on 2021-05-23.
//  Copyright © 2021 Saurav Bajracharya. All rights reserved.
//

import UIKit
import CoreData

class ProductVC: UIViewController {

    
    @IBOutlet weak var productID: UITextField!
    
    @IBOutlet weak var productName: UITextField!
    
    @IBOutlet weak var productDesc: UITextField!
    
    @IBOutlet weak var productPrice: UITextField!
    
    @IBOutlet weak var productProvider: UITextField!
    
    
    var editMode: Bool = false
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var selectedProduct: Product?{
        didSet{
            editMode = true
        }
    }
 
   
    
    
    weak var delegate: ProductTVC?
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        
        productName.text = selectedProduct?.name
        productID.text = selectedProduct?.id
        productDesc.text = selectedProduct?.desc
        productPrice.text = selectedProduct?.price
        productProvider.text = selectedProduct?.provider
        
//       let providerNames = self.providers.map {$0.name?.lowercased()}
//
//
//        let newProvider = Provider(context: self.context)
//        newProvider.name = productProvider.text
//        self.providers.append(newProvider)
//        self.saveProviders()
        
        
       
        // Do any additional setup after loading the view.
    }
    

    
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//
//
//       let productListTableVC = segue.destination as? ProductTVC
//        productListTableVC.
//
//
//    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        
           if editMode {
              delegate!.deleteProduct(product: selectedProduct!)
          }
        guard productName.text != "" else {return}
        
       
        
        delegate!.updateProduct(with: productName.text!, id:  productID.text!, desc: productDesc.text!, price: productPrice.text!, provider: productProvider.text!)
//
        }
    
    
    
    
}

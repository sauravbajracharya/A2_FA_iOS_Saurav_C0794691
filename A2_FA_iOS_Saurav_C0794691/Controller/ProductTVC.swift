//
//  ProductTVC.swift
//  A2_FA_iOS_Saurav_C0794691
//
//  Created by Saurav Bajracharya on 2021-05-23.
//  Copyright © 2021 Saurav Bajracharya. All rights reserved.
//

import UIKit
import CoreData


class ProductTVC: UITableViewController {

  
   var products = [Product]()
  
   
    struct Provider {
        var name: String?
        var products = [Product]()
    }

    //asd
    
   var switchProductsProviders: Bool = false

    // create the context
   let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
     
     // define a search controller
    let searchController = UISearchController(searchResultsController: nil)
     

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isToolbarHidden = false
        
        if switchProductsProviders == false{
        navigationItem.title = "Products"
        } else {
            navigationItem.title = "Providers"
        }
        
        
//        if someEntityExists() == false {
//            saveStaticProducts()
//        } else {
//            deleteAllRecords()
//            saveStaticProducts()
//        }
      
       showSearchBar()
        loadProducts()

            
       searchController.isActive = true

    }
    

    override func viewWillAppear(_ animated: Bool) {
           tableView.reloadData()
       }
    
    // MARK: - Table view data source
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        
        return products.count
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
         let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath)
        
      
    
        let product = products[indexPath.row]
//        let provider = providers[indexPath.row]
      
        // Configure the cell...
        
        if switchProductsProviders == false {
        
        
        cell.textLabel?.text =  product.name!
        cell.detailTextLabel?.text = product.provider!

        let backgroundView = UIView()
        
        cell.selectedBackgroundView = backgroundView
        
        } else {
            
        cell.textLabel?.text =  product.provider
        cell.detailTextLabel?.text = product.name
      
        }
        
    return cell
        
        
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    
       // Override to support editing the table view.
       override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
           if editingStyle == .delete {
               // Delete the row from the data source
               
               deleteProduct(product: products[indexPath.row])
               saveProducts()
               products.remove(at: indexPath.row)
                          // Delete the row from the data source
                          
               tableView.deleteRows(at: [indexPath], with: .fade)
               
               
           } else if editingStyle == .insert {
               // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
           }
       }
    
    
    
    

        // MARK: - Navigation

    //   In a storyboard-based application, you will often want to do a little preparation before navigation
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? ProductVC {
                  destination.delegate = self
                  
                  if let cell = sender as? UITableViewCell {
                      if let index = tableView.indexPath(for: cell)?.row {
                          destination.selectedProduct = products[index]
                        
                        
                      }
                  }
              }

     

     }

        
    
    func showSearchBar() {
           searchController.searchBar.delegate = self
           searchController.obscuresBackgroundDuringPresentation = false
           searchController.searchBar.placeholder = "Search Product"
           navigationItem.searchController = searchController
           definesPresentationContext = true
           searchController.searchBar.searchTextField.textColor = .lightGray
       }
    
    
    func saveProducts(){
        do {
                  try context.save()
                  tableView.reloadData()
              } catch {
                  print("Error saving the products \(error.localizedDescription)")
              }
    }
    
    
    func deleteProduct(product: Product) {
             context.delete(product)
         }

    
  func loadProducts(predicate: NSPredicate? = nil) {
    
      let request: NSFetchRequest<Product> = Product.fetchRequest()
    
    request.predicate = predicate
    

      do {
          products = try context.fetch(request)
      } catch {
          print("Error loading products \(error.localizedDescription)")
      }
      tableView.reloadData()
    }
  
    
    
    
    func deleteAllRecords(){
        let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Product")
             let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)

             do {
                 try context.execute(deleteRequest)
                 try context.save()
             } catch {
                 print ("There was an error")
             }
    }
    
    @IBAction func switchBtn(_ sender: UIBarButtonItem) {
        switchProductsProviders = !switchProductsProviders
         tableView.reloadData()
    }
    
  
    
    
   
//    func saveStaticProducts(){
//           let newProduct = Product(context: self.context)
//           newProduct.id = 1
//           newProduct.name = "PS4"
//           newProduct.desc = "Console"
//           newProduct.price = 5000
//           newProduct.provider = "Sony"
//           self.products.append(newProduct)
//
//           let newProduct2 = Product(context: self.context)
//           newProduct2.id = 2
//           newProduct2.name = "Xbox"
//           newProduct2.desc = "Console"
//           newProduct2.price = 3000
//           newProduct2.provider = "Microsoft"
//           self.products.append(newProduct2)
//
//           let newProduct3 = Product(context: self.context)
//           newProduct3.id = 3
//           newProduct3.name = "Nintendo Switch"
//           newProduct3.desc = "Portable Console"
//           newProduct3.price = 4000
//           newProduct3.provider = "Nintendo"
//           self.products.append(newProduct3)
//
//           let newProduct4 = Product(context: self.context)
//           newProduct4.id = 4
//           newProduct4.name = "PC"
//           newProduct4.desc = "Gaming rig"
//           newProduct4.price = 5000
//           newProduct4.provider = "Microsoft"
//           self.products.append(newProduct4)
//
//        let newProduct5 = Product(context: self.context)
//        newProduct5.id = 5
//        newProduct5.name = "WII"
//        newProduct5.desc = "Console"
//        newProduct5.price = 2000
//        newProduct5.provider = "Nintendo"
//        self.products.append(newProduct5)
//
//        let newProduct6 = Product(context: self.context)
//        newProduct6.id = 6
//        newProduct6.name = "Gameboy"
//        newProduct6.desc = "Handheld Gaming"
//        newProduct6.price = 1500
//        newProduct6.provider = "Nintendo"
//        self.products.append(newProduct6)
//
//        let newProduct7 = Product(context: self.context)
//        newProduct7.id = 7
//        newProduct7.name = "PS5"
//        newProduct7.desc = "Next Gen Console"
//        newProduct7.price = 6000
//        newProduct7.provider = "Sony"
//        self.products.append(newProduct7)
//
//        let newProduct8 = Product(context: self.context)
//        newProduct8.id = 8
//        newProduct8.name = "Shield Portable"
//        newProduct8.desc = "Handheld Console"
//        newProduct8.price = 4000
//        newProduct8.provider = "Nvidia"
//        self.products.append(newProduct8)
//
//        let newProduct9 = Product(context: self.context)
//        newProduct9.id = 9
//        newProduct9.name = "PS Vita"
//        newProduct9.desc = "Handheld Console"
//        newProduct9.price = 2500
//        newProduct9.provider = "Sony"
//        self.products.append(newProduct9)
//
//        let newProduct10 = Product(context: self.context)
//        newProduct10.id = 10
//        newProduct10.name = "Atari"
//        newProduct10.desc = "Old Console"
//        newProduct10.price = 1500
//        newProduct10.provider = "Atari"
//        self.products.append(newProduct10)
//        self.saveProducts()
//
//    }
    
    func someEntityExists() -> Bool {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Product")
        fetchRequest.includesSubentities = false

        var entitiesCount = 0

        do {
            entitiesCount = try context.count(for: fetchRequest)
        }
        catch {
            print("error executing fetch request: \(error)")
        }
        return entitiesCount > 0
    }
    
    
    
    func updateProduct(with name: String, id: String, desc: String, price: String, provider: String) {
        products = []
        let newProduct = Product(context: context)
        newProduct.name = name
        newProduct.id = id
        newProduct.desc = desc
        newProduct.price = price
        newProduct.provider = provider
        
        saveProducts()
        loadProducts()
    }
    
    

}
 

//MARK: - search bar delegate methods
extension ProductTVC: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // add predicate
        let predicate = NSPredicate(format: "name CONTAINS[cd] %@", searchBar.text!)
        loadProducts(predicate : predicate)
    }
    

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0 {
            loadProducts()
            
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }
        }
    }
    
}

 

//
//  ViewController.swift
//  iOS-Base
//
//  Created by Helmi Akbar on 8/24/17.
//  Copyright © 2017 Helmi Akbar. All rights reserved.
//

import UIKit

class ProductViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate, ProductView {

    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var emptyView: UIView!
    
    fileprivate var productsToDisplay = [ProductViewData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ProductPresenter.sharedInstance.attachView(view: self)
        ProductPresenter.sharedInstance.getProductsAPI()
        ProductPresenter.sharedInstance.getUserAPI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.productsToDisplay.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell")! as UITableViewCell
        
        let product = self.productsToDisplay[indexPath.row]
        cell.textLabel?.text = product.productName
        cell.detailTextLabel?.text = "Rp "+"\(product.productPrice)"
        return cell
    }

    // MARK: - Table view delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - Presenter delegate
    func startLoading() {
        self.showLoadingIndicator()
    }
    
    func finishLoading() {
        self.hideLoadingIndicator()
    }
    
    func setProduct(datas: [ProductViewData]) {
        self.productsToDisplay = datas
        self.tableView?.isHidden = false
        self.tableView?.reloadData()
        emptyView?.isHidden = true;
    }
    
    func setUser(data: UserViewData) {
        self.userLabel.text = data.userName
    }
    
    func setEmptyObject() {
        self.tableView?.isHidden = true
        emptyView?.isHidden = false;
    }
    
    func setErrorMessageFromAPI(errorMessage: String) {
        self.basicAlertView(title: "", message: errorMessage, successBlock: {})
    }
}


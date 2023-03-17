//
//  ViewController.swift
//  UITableView
//
//  Created by Дмитрий Гусев on 17.03.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    
    let identifier = "myCell"
    var array = ["1", "2", "3", "4", "5"]
    
    //
//    var myTableView = UITableView()
//
//    let identifire = "MyCell"
//
//    var array = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

//        createTable()
    }
    
//    func createTable() {
//
//        myTableView = UITableView(frame: view.bounds, style: .plain)
//        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: identifire)
//
//        myTableView.delegate = self
//        myTableView.dataSource = self
//
//        myTableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//
//        view.addSubview(myTableView)
        
//    }
    
    // MARK: - UITableViewDataSource

    
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//        return array.count
//
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let cell = tableView.dequeueReusableCell(withIdentifier: identifire, for: indexPath)
//
//        let number = array[indexPath.row]
//        cell.textLabel?.text = number
//
//        return cell
//    }
    
    // MARK: - UITableViewDelegate

//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        70
//    }
//
//    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
//        print("Accesory path =", indexPath)
//
//        let ounerCell = tableView.cellForRow(at: indexPath)
//        print("Cell title =", ounerCell?.textLabel?.text ?? "nil")
//    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let number = array[indexPath.row]
//        print(number)
//    }
//
    
    @IBAction func editTable(_ sender: Any) {
        myTableView.isEditing = !myTableView.isEditing
    }
    
    
}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        
        let number = array[indexPath.row]
        cell.textLabel?.text = number
        
        return cell
        
    }
    
    //delete
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            array.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
        }
    }
    
    // move
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = array[sourceIndexPath.row]
        array.remove(at: sourceIndexPath.row)
        array.insert(item, at: destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, shouldShowMenuForRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, canPerformAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        
        if action == #selector(copy(_:)){
            return true
        }
        return false
        
    }
    
    func tableView(_ tableView: UITableView, performAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) {
        if action == #selector(copy(_:)){
            let cell = tableView.cellForRow(at: indexPath)
            let pasteBoard = UIPasteboard.general
            pasteBoard.string = cell?.textLabel?.text
        }
    }
}

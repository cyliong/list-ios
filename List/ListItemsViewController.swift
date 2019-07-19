import UIKit
import RealmSwift

class ListItemsViewController: UITableViewController {
    
    let realm = try! Realm()
    lazy var listItems: Results<ListItem> = { realm.objects(ListItem.self) }()

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListItemCell", for: indexPath)

        let item = listItems[indexPath.row]
        cell.textLabel?.text = item.title

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showInputDialog(position: indexPath.row)
    }

    override func tableView(
        _ tableView: UITableView,
        commit editingStyle: UITableViewCell.EditingStyle,
        forRowAt indexPath: IndexPath
    ) {
        if editingStyle == .delete {
            try! realm.write {
                realm.delete(listItems[indexPath.row])
                tableView.reloadData()
            }
        }
    }
    
    @IBAction func addItem(_ sender: UIBarButtonItem) {
        showInputDialog()
    }
    
    private func showInputDialog(position: Int = -1) {
        let isNew = position == -1
        
        let alert = UIAlertController(
            title: isNew ? "New Item" : "Edit Item",
            message: nil,
            preferredStyle: .alert)
        
        alert.addTextField { textField in
            if isNew {
                textField.placeholder = "Enter a new item"
            } else {
                textField.text = self.listItems[position].title
            }
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        alert.addAction(UIAlertAction(title: "Save", style: .default) { _ in
            guard let itemTitle = alert.textFields?.first?.text, !itemTitle.isEmpty else {
                self.showInputDialog(position: position)
                return
            }
            
            try! self.realm.write {
                if isNew {
                    let listItem = ListItem(title: itemTitle)
                    self.realm.add(listItem)
                    let indexPath = IndexPath(row: self.listItems.count - 1, section: 0)
                    self.tableView.insertRows(at: [indexPath], with: .automatic)
                } else {
                    self.listItems[position].title = itemTitle
                    let indexPath = IndexPath(row: position, section: 0)
                    self.tableView.reloadRows(at: [indexPath], with: .automatic)
                }
            }
        })
        
        present(alert, animated: true)
    }
    
}

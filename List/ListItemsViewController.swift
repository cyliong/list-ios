import UIKit
import MaterialComponents.MaterialSnackbar
import RealmSwift
import Flutter

class ListItemsViewController: UITableViewController {
    
    private let viewModel = ListItemsViewModel()
    private var notificationToken: NotificationToken?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notificationToken = viewModel.listItems.observe { [weak self] (changes: RealmCollectionChange) in
            guard let tableView = self?.tableView else { return }
            
            switch changes {
            case .initial:
                tableView.reloadData()
            case .update(_, let deletions, let insertions, let modifications):
                tableView.beginUpdates()
                tableView.deleteRows(at: deletions.map({ IndexPath(row: $0, section: 0) }),
                                     with: .automatic)
                tableView.insertRows(at: insertions.map({ IndexPath(row: $0, section: 0) }),
                                     with: .automatic)
                tableView.reloadRows(at: modifications.map({ IndexPath(row: $0, section: 0) }),
                                     with: .automatic)
                tableView.endUpdates()
                
                if !deletions.isEmpty {
                    let message = MDCSnackbarMessage()
                    message.text = "Item deleted."
                    MDCSnackbarManager.default.show(message)
                }
            case .error(let error):
                fatalError("\(error)")
            }
        }
    }
    
    deinit {
        notificationToken?.invalidate()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.listItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListItemCell", for: indexPath)

        let item = viewModel.listItems[indexPath.row]
        cell.textLabel?.text = item.title

        return cell
    }

    override func tableView(
        _ tableView: UITableView,
        commit editingStyle: UITableViewCell.EditingStyle,
        forRowAt indexPath: IndexPath
    ) {
        if editingStyle == .delete {
            viewModel.onDelete(index: indexPath.row)
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EditItem",
            let navigationController = segue.destination as? UINavigationController,
            let itemViewController = navigationController.viewControllers.first as? ItemViewController,
            let indexPath = tableView.indexPathForSelectedRow
        {
            itemViewController.viewModel = viewModel.itemViewModel(index: indexPath.row)
        }
    }
    
    // MARK: - Actions
    
    @IBAction func about(_ sender: UIBarButtonItem) {
        let flutterViewController = FlutterViewController(project: nil, nibName: nil, bundle: nil)
        flutterViewController.title = "About"
        navigationController?.pushViewController(flutterViewController, animated: true)
    }
}

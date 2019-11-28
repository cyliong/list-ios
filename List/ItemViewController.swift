import UIKit

class ItemViewController: UITableViewController {
    
    var viewModel: ItemViewModel?

    @IBOutlet private var titleTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let viewModel = viewModel {
            titleTextField.text = viewModel.title
        } else {
            title = "New Item"
            viewModel = ItemViewModel()
        }
        
        titleTextField.becomeFirstResponder()
    }
    
    // MARK: - Actions
    
    @IBAction func save(_ sender: UIBarButtonItem) {
        if let title = titleTextField.text, !title.isEmpty {
            viewModel?.onSave(title: title)
            dismiss(animated: true)
        } else {
            let alert = UIAlertController(
                title: "Please enter an item.",
                message: nil,
                preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
        }
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
}

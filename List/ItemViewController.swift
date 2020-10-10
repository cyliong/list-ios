import UIKit
import RxSwift
import RxCocoa

class ItemViewController: UITableViewController {
    
    var viewModel: ItemViewModel?

    @IBOutlet private var titleTextField: UITextField!
    @IBOutlet private var saveButton: UIBarButtonItem!
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let viewModel = viewModel {
            titleTextField.text = viewModel.title
        } else {
            title = "New Item"
            viewModel = ItemViewModel()
        }
        
        titleTextField.becomeFirstResponder()
        
        titleTextField
            .rx
            .text
            .observe(on: MainScheduler.asyncInstance)
            .throttle(.milliseconds(100), scheduler: MainScheduler.instance)
            .map {
                !($0?.replacingOccurrences(of: " ", with: "").isEmpty ?? true)
            }
            .bind(to: saveButton.rx.isEnabled)
            .disposed(by: disposeBag)
    }
    
    // MARK: - Actions
    
    @IBAction func save(_ sender: UIBarButtonItem) {
        viewModel?.onSave(title: titleTextField.text!)
        dismiss(animated: true)
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
}

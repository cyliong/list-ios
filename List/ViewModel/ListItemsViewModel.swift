import Foundation
import RealmSwift

class ListItemsViewModel {
    
    lazy var listItems: Results<ListItem> = { realm.objects(ListItem.self) }()
    
    private let realm = try! Realm()
    
    func itemViewModel(index: Int) -> ItemViewModel {
        ItemViewModel(item: listItems[index])
    }
    
    func onDelete(index: Int) {
        try! realm.write {
            realm.delete(listItems[index])
        }
    }
    
}

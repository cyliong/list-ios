import Foundation
import RealmSwift

class ListItemsViewModel {
    
    lazy var listItems: Results<ListItem> = {
        try! Realm().objects(ListItem.self).sorted(byKeyPath: "created")
    }()
    
    func itemViewModel(index: Int) -> ItemViewModel {
        ItemViewModel(item: listItems[index])
    }
    
    func onDelete(index: Int) {
        let realm = try! Realm()
        try! realm.write {
            realm.delete(listItems[index])
        }
    }
    
}

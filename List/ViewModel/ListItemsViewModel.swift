import Foundation
import RealmSwift

class ListItemsViewModel {
    
    private let realm = try! Realm()
    
    lazy var listItems: Results<ListItem> = { realm.objects(ListItem.self) }()
    
    func addItem(title: String) {
        try! realm.write {
            realm.add(ListItem(title: title))
        }
    }
    
    func updateItem(index: Int, title: String) {
        try! realm.write {
            listItems[index].title = title
        }
    }
    
    func deleteItem(index: Int) {
        try! realm.write {
            realm.delete(listItems[index])
        }
    }
    
}

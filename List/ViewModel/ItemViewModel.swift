import Foundation
import RealmSwift

class ItemViewModel {
    
    var title: String? {
        item?.title
    }
    
    private var item: ListItem?
    
    convenience init(item: ListItem) {
        self.init()
        self.item = item
    }
    
    func onSave(title: String) {
        let realm = try! Realm()
        try! realm.write {
            if let item = item  {
                item.title = title
            } else {
                realm.add(ListItem(title: title))
            }
        }
    }
    
}

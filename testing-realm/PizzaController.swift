import RealmSwift

public struct PizzaController {
    let realm: Realm!

    public init(realm: Realm) {
        self.realm = realm
    }

    public init() {
        // TODO: A production app should handle this possible failure properly
        do {
            let realm = try Realm()
            self.init(realm: realm)
        } catch {
            fatalError("\(error)")
        }
    }

    public func addPizza(pizza: Pizza) {
        // TODO: A production app should handle this possible failure properly
        do {
            try realm.write {
                self.realm.add(pizza)
            }
        } catch {
            fatalError("\(error)")
        }
    }
}

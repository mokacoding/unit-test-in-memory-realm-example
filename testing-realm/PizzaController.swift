import RealmSwift

public struct PizzaController {
    let realm: Realm!

    public init(realm: Realm) {
        self.realm = realm
    }

    public init() {
        self.init(realm: Realm())
    }

    public func addPizza(pizza: Pizza) {
        realm.write {
            self.realm.add(pizza)
        }
    }
}

import Foundation
import RealmSwift

public class Pizza: Object {
    public dynamic var name = ""
    public var ingredients = List<Ingredient>()
}

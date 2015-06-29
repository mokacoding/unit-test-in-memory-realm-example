import Quick
import Nimble
import RealmSwift
import testing_realm

class PizzaControllerOnDiskSpec: QuickSpec {
    override func spec() {
        describe("PizzaController") {
            var testRealm: Realm!
            var sut: PizzaController!

            beforeEach{
                testRealm = Realm()
                sut = PizzaController(realm: testRealm)
            }

            afterEach {
                let path = Realm.defaultPath
                let fileManager = NSFileManager.defaultManager()
                fileManager.removeItemAtPath(path, error: nil)
                let lockPath = path + ".lock"
                fileManager.removeItemAtPath(lockPath, error: nil)
            }

            it("adds the Pizza to the Realm") {
                expect(testRealm.objects(Pizza).count).to(equal(0))

                let p = Pizza()
                p.name = "Margherita"
                sut.addPizza(p)

                expect(testRealm.objects(Pizza).count).to(equal(1))
            }

            it("adds the Pizza to the Realm other 99 times, to test the speed") {
                let end = 100
                for i in 0..<end {
                    let p = Pizza()
                    p.name = "Margherita"
                    sut.addPizza(p)
                }
                expect(testRealm.objects(Pizza).count).to(equal(end + 1))
            }
        }
    }
}

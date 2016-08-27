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
                testRealm = try! Realm(
                    configuration: Realm.Configuration.defaultConfiguration
                )
                sut = PizzaController(realm: testRealm)
            }

            afterEach {
                let url = testRealm.configuration.fileURL!
                let fileManager = NSFileManager.defaultManager()
                do {
                    try fileManager.removeItemAtURL(url)
                } catch {
                    // noop
                }
                let lockURL = url.URLByAppendingPathExtension("lock")
                do {
                    try fileManager.removeItemAtURL(lockURL)
                } catch {
                    // noop
                }
            }

            it("adds the Pizza to the Realm") {
                expect(testRealm.objects(Pizza).count).to(equal(0))

                let p = Pizza()
                p.name = "Margherita"
                sut.addPizza(p)

                expect(testRealm.objects(Pizza).count).to(equal(1))
            }

            it("adds the Pizza to the Realm other \(TestConfiguration().iterations) times, to test the speed") {
                let end = TestConfiguration().iterations
                (0..<end).forEach { _ in
                    let p = Pizza()
                    p.name = "Margherita"
                    sut.addPizza(p)
                }
                expect(testRealm.objects(Pizza).count).to(equal(end + 1))
            }
        }
    }
}

import Quick
import Nimble

class DemoSpec: QuickSpec {
    override func spec() {
        describe("just a demo") {
            it("demoes the demo") {
                expect(false).to(beTruthy())
            }
        }
    }
}

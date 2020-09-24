import XCTest
import RealmSwift

// Xcode instantiates this class once before any XCTestCase.
// See https://stackoverflow.com/questions/29822457/how-to-run-one-time-setup-code-before-executing-any-xctest?answertab=votes#tab-top
class TestSetup: NSObject {
    func deleteAppData() {
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let url = URL(fileURLWithPath: "\(documentsPath)/mongodb-realm")
        do {
            try FileManager.default.removeItem(at: url)
        } catch {
            
        }
    }

    func removeAllUsersFromDevice() {
        print("Removing all users...")
        let removeUserExpectations = app.allUsers().map { _, user -> XCTestExpectation in
            let expectation = XCTestExpectation(description: "Remove user \(user.id!)")
            print("Removing users \(user.id!)")
            user.remove { (error) in
                guard error == nil else {
                    fatalError("Failed to remove user \(user.id!): \(error!.localizedDescription)")
                }
                print("User \(user.id!) removed.")
                expectation.fulfill()
            }
            return expectation
        }
        XCTWaiter().wait(for: removeUserExpectations, timeout: 10)
    }

    override init() {
        super.init()

        deleteAppData()
    
        let app = App(id: YOUR_REALM_APP_ID)
        removeAllUsersFromDevice()
        
        let expectation = XCTestExpectation(description: "Call to delete all users completes")
        app.login(credentials: Credentials.anonymous()) { (user, error) in
            guard error == nil else {
                fatalError(error!.localizedDescription)
            }
            
            user!.functions.deleteAllUsers([]) { (result, error) in
                guard error == nil else {
                    fatalError(error!.localizedDescription)
                }
                print("Delete all users result: \(result!)")
                // Must remove anonymous user from device, as it is
                // in invalid state by backend call
                user!.remove { (error) in
                    // ignore error https://jira.mongodb.org/browse/RCOCOA-866
                    expectation.fulfill()
                }
            }
        }
    
        let waiter = XCTWaiter()
        waiter.wait(for: [expectation], timeout: 10)
        assert(waiter.fulfilledExpectations == [expectation])
    }
}
import UIKit

// Main Module
class ApiClient {
    static let shared = ApiClient()
    private init() {}
}

class MockApiClient: ApiClient {
    
}

// Login Module
struct User {}
protocol LoginClient {
    func loggedIn(completion: (User) -> Void)
}

extension ApiClient: LoginClient {
    func loggedIn(completion: (User) -> Void) {}
}

class LoginService {
    
    var loggedIn: (((User) -> Void) -> Void)?
    
    
    func login() {
        loggedIn? { user in
            
        }
    }
}

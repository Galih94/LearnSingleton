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

// Feed Module
struct Feed {}
protocol FeedClient {
    func loadFeedItem(completion: ([Feed]) -> Void)
}

extension ApiClient: FeedClient {
    func loadFeedItem(completion: ([Feed]) -> Void) {}
}


class FeedService {
    
    var loadFeed: ((([Feed]) -> Void) -> Void)?
    
    func load() {
        loadFeed? { feeds in
            
        }
    }
}

// Follower Module
struct Follower {}
protocol FollowerClient {
    func loadFollower(completion: ([Follower]) -> Void)
}

extension ApiClient: FollowerClient {
    func loadFollower(completion: ([Follower]) -> Void) {}
}

class FollowerService {
    
    var loadFollower: (((Follower) -> Void) -> Void)?
    
    func load() {
        loadFollower? { followers in
            
        }
    }
}


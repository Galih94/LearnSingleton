//
//  Singleton.swift
//  SingletonEssentialDevelopment
//
//  Created by Galih Samodra Wicaksono on 02/05/23.
//

import UIKit

// Singleton 1 -> Normal Singleton with getter function
//class ApiClient {
//    private static let instance = ApiClient() // initialize ApiClient
//    private init() {} // make init private so it cannot be re-initialized so that only 1 instance exist
//    static func getInstance() -> ApiClient { // make way to call object ApiClient
//        return instance
//    }
//}
//
//let client = ApiClient.getInstance()
//------
// Singleton 2 -> Singleton without getter function
//class ApiClient {
//    static let instance = ApiClient() // initialize ApiClient
//    private init() {} // make init private so it cannot be re-initialized so that only 1 instance exist
//}
//
//class MockApiClient: ApiClient { // ApiClient not final so it can be subclassed to change behavior
//
//}
//
//let client = ApiClient.instance
//------

// Singleton 3 -> wrong Singleton, because Singleton can be extended in the future so it cannot be "final"
//final class ApiClient {
//    static let instance = ApiClient() // initialize ApiClient
//    private init() {} // make init private so it cannot be re-initialized so that only 1 instance exist
//}
//
//extension ApiClient { // class add extension to add function so it does not change behavior
//     func login() {}
//}
//
//let client = ApiClient.instance
//------

// mutable global state 1 -> wrong Singleton, because Singleton can not be changed it's object
//class ApiClient {
//    static var instance = ApiClient() // initialize ApiClient is var so it can be changed
//    private init() {} // make init private so it cannot be re-initialized so that only 1 instance exist
//    func login() {}
//}
//
//class MockApiClient: ApiClient {
//    init() {}
//}
//
//class LoginViewController: UIViewController {
//    func didTapLoginButton() {
//        ApiClient.instance = MockApiClient()
//        ApiClient.instance.login()
//    }
//}
//------

// example of singleton (Singleton that can be re-initialized)(lowercased s)
//URLSession.shared
//URLSession()
//------

//// example using Singleton in not modular class because all load depends on ApiCLient
//// API Module
//struct LoggedInUser {}
//struct FeedItem {}
//class ApiClient {
//    static let instance = ApiClient() // initialize ApiClient
//    private init() {} // make init private so it cannot be re-initialized so that only 1 instance exist
//    func login(completion: (LoggedInUser) -> Void) {}
//    func loadFeeds(completion: ([FeedItem]) -> Void) {}
//}
//
//class MockApiClient: ApiClient { // subclass ApiClient to change behavior func login
//    override func login(completion: (LoggedInUser) -> Void) {}
//}
//
//// Login Module
//class LoginViewController: UIViewController {
//    var api = ApiClient.instance
//    func didTapLoginButton() {
//        api.login() { user in
//            // show feed screen
//        }
//    }
//}
//
//// Feed Module
//class FeedViewController: UIViewController {
//    var api = ApiClient.instance
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        api.loadFeeds { loadedItems in
//            // load feeds
//        }
//    }
//}

//// example using Singleton in a little modular class because all load depends on ApiCLient but using extension to separate between modules
//// API Module
//class ApiClient {
//    static let instance = ApiClient() // initialize ApiClient
//    private init() {} // make init private so it cannot be re-initialized so that only 1 instance exist
//    func execute(_ : URLRequest, completion: (Data) -> Void) {} // base function execute as generic function
//}
//
//class MockApiClient: ApiClient {} // subclass ApiClient to change behavior func login
//
//// Login Module
//struct LoggedInUser {}
//extension ApiClient {
//    func login(completion: (LoggedInUser) -> Void) {}
//}
//class LoginViewController: UIViewController {
//    var api = ApiClient.instance
//    func didTapLoginButton() {
//        api.login() { user in
//            // show feed screen
//        }
//    }
//}
//
//// Feed Module
//struct FeedItem {}
//extension ApiClient {
//    func loadFeeds(completion: ([FeedItem]) -> Void) {}
//}
//class FeedViewController: UIViewController {
//    var api = ApiClient.instance
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        api.loadFeeds { loadedItems in
//            // load feeds
//        }
//    }
//}

// example using Singleton in a little modular class because all load depends on ApiCLient but using extension to separate between modules
// API Module
class ApiClient {
    static let instance = ApiClient() // initialize ApiClient
    private init() {} // make init private so it cannot be re-initialized so that only 1 instance exist
    func execute(_ : URLRequest, completion: (Data) -> Void) {} // base function execute as generic function
}

class MockApiClient: ApiClient {} // subclass ApiClient to change behavior func login

// Main Module
extension ApiClient {
    func login(completion: (LoggedInUser) -> Void) {}
}
extension ApiClient {
    func loadFeeds(completion: ([FeedItem]) -> Void) {}
}


// Login Module
struct LoggedInUser {}
class LoginViewController: UIViewController {
    var login: (((LoggedInUser) -> Void) -> Void)?
    func didTapLoginButton() {
        login? { user in
            // show feed screen
        }
    }
}

// Feed Module
struct FeedItem {}
class FeedViewController: UIViewController {
    var loadFeeds: ((([FeedItem]) -> Void) -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadFeeds? { loadedItems in
            // load feeds
        }
    }
}



 

import XCTest
import SwiftDependencyContainer

class DependencyContainerTests: XCTestCase {
    
    var sut: DependencyContainer!
    
    override func setUp() {
        sut = .init()
    }
    
    func test_bootstrapOnDemand() throws {
        try sut.registerSingletonImpl1WithKey()
        
        let start = Date()
        
        let singleton = try sut.resolveSingleton(.singleton1)
        
        XCTAssertTrue(start < singleton.created)
    }
    
    func test_eagerBootstrap() throws {
        try sut.registerSingletonImpl1WithKey(eager: true)
        
        try sut.bootstrap()
        
        let start = Date()
        
        let singleton = try sut.resolveSingleton(.singleton1)
        
        XCTAssertTrue(start > singleton.created)
    }
    
    func test_eagerWithoutBootstrap() throws {
        try sut.registerSingletonImpl1WithKey(eager: true)
                
        do {
            _ = try sut.resolveSingleton(.singleton1)
            XCTFail("Shouldn't be able to resolve a dependency before the container is bootstrapped")
        } catch let error {
            if case .notBootstrapped = error as? DependencyContainer.ResolveError<Singleton> {
                // expected
            } else {
                XCTFail("Unknown error: \(error)")
            }
        }
    }
    
    func test_singleInstance() throws {
        try sut.registerSingletonImpl1WithKey()
        
        XCTAssertTrue(try sut.resolveSingleton(.singleton1) === sut.resolveSingleton(.singleton1))
    }
    
    func test_replaceRegisteredInstanceBeforeBootstrap() throws {
        try sut.registerSingletonImpl1WithKey(id: "1")
        try sut.registerSingletonImpl1WithKey(id: "2")
        
        let result = try sut.resolveSingleton(.singleton1)
        XCTAssertEqual(result.id, "2")
    }
    
    func test_registerAfterEagerRegisterFails() throws {
        try sut.registerSingletonImpl1WithKey(eager: true)
        try sut.bootstrap()
        do {
            try sut.registerSingletonImpl1WithKey()
            XCTFail("Should fail, dependency for key is already bootstrapped.")
        } catch {}
    }
    
    func test_registerAfterBootstrappedFails() throws {
        try sut.registerSingletonImpl1WithKey()
        
        try _ = sut.resolveSingleton(.singleton1)
        
        do {
            try sut.registerSingletonImpl1WithKey()
            XCTFail("Should fail, dependency for key was already resolved.")
        } catch {}
    }
    
    func test_registerUsingTypeinformation() throws {
        try sut.add(isEager: true) { SingletonImpl1() }
        
        try sut.add {
            let s1: SingletonImpl1 = try $0.resolve()
            return SingletonImpl2(other: s1)
        }
        
        try sut.bootstrap()
        
        let _: SingletonImpl1 = try sut.resolve()
        let _: SingletonImpl2 = try sut.resolve()
        
        let resolvedFailure: Singleton? = try? sut.resolve()
        XCTAssertNil(resolvedFailure)
    }
    
    func test_registerSameObjectTwiceFails() throws {
        try sut.add(isEager: true) { SingletonImpl1() }
        try sut.bootstrap()
        
        do {
            try sut.add() { SingletonImpl1() }
            
            XCTFail("Shouldn't be possible, same object type is already bootstrapped.")
        } catch is DependencyContainer.RegisterError {
            // expected
        } catch let error {
            XCTFail("Unknown error: \(error)")
        }
    }
    
    func test_registerObjectAfterBootstrappedFails() throws {
        try sut.bootstrap()
        
        do {
            try sut.add() { SingletonImpl1() }
            
            XCTFail("Shouldn't be possible, container is already bootstrapped.")
        } catch is DependencyContainer.RegisterError {
            // expected
        } catch let error {
            XCTFail("Unknown error: \(error)")
        }
    }
    
    func test_constructorInjectOtherDepency() throws {
        try sut.registerSingletonImpl1WithKey()
        
        try sut.add(TestKey.singleton2) {
            SingletonImpl2(other: try $0.resolveSingleton(.singleton1))
        }
    }
    
    func test_resolveUnknownObjectThrows() {
        do {
            let _: Singleton = try sut.resolve(using: .singleton1)
            
            XCTFail("Dependency shouldn't be registered!")
        } catch is DependencyContainer.ResolveError<Singleton> {
            // expected
        } catch let error {
            XCTFail("Unknown error: \(error)")
        }
    }
    
    func test_addSingletonForProtocol() throws {
        let singleton: SingletonImpl1 = SingletonImpl1()
        
        try sut.add(for: Singleton1.self) { singleton }
        
        try sut.add(for: Singleton2.self) {
            let singleton1: Singleton1 = try $0.resolve()
            return SingletonImpl2(other: singleton1)
        }
        
        let resolvedByProtocol: Singleton1 = try sut.resolve()
        
        XCTAssertTrue(resolvedByProtocol === singleton)
        
        let _: Singleton2 = try sut.resolve()
        
        do {
            let _: SingletonImpl2 = try sut.resolve()
            XCTFail("Dependency shouldn't be registered for it's class type!")
        } catch {
            // expected
        }
    }
    
    func test_addSingletonForClass() throws {
        let singleton: SingletonImpl1 = SingletonImpl1()
        
        try sut.add(for: BaseSingleton.self) { singleton }
        
        let resolvedByProvidedClass: BaseSingleton = try sut.resolve()
        
        XCTAssertTrue(resolvedByProvidedClass === singleton)
        
        do {
            let _: SingletonImpl1 = try sut.resolve()
            XCTFail("Dependency shouldn't be registered for it's class type!")
        } catch {
            // expected
        }
    }
    
    func test_addSingletonWithMultipleTypeInfo() throws {
        let singleton: SingletonImpl1 = SingletonImpl1()

        try sut.add(for: [BaseSingleton.self, Singleton1.self]) { singleton }
        
        let resolved1: BaseSingleton = try sut.resolve()
        let resolved2: Singleton1 = try sut.resolve()
        
        XCTAssertTrue(resolved1 === singleton)
        XCTAssertTrue(resolved2 === singleton)
        
        do {
            let _: SingletonImpl1 = try sut.resolve()
            XCTFail("Dependency shouldn't be registered for it's class type!")
        } catch {
            // expected
        }
    }
    
    func test_multipleTypeInfoWithResolverContext() throws {
        try sut.add(for: Singleton.self) { SingletonImpl1() }
        
        try sut.add(for: [Singleton2.self, SingletonImpl2.self]) {
            SingletonImpl2(other: try $0.resolve())
        }
        
        let _: Singleton = try sut.resolve()
        let resolved2_1: Singleton2 = try sut.resolve()
        let resolved2_2: SingletonImpl2 = try sut.resolve()
        
        XCTAssertTrue(resolved2_1 === resolved2_2)
        
        do {
            let _: Singleton1 = try sut.resolve()
            XCTFail("Dependency shouldn't be registered for that type information!")
        } catch let error {
            if case .notRegistered = error as? DependencyContainer.ResolveError<Singleton1> {
                // expected
            } else {
                XCTFail("Unknown error: \(error)")
            }
        }
    }
}

// MARK: - Helper

enum TestKey: CaseIterable {
    case singleton1
    case singleton2
}

extension DependencyContainer {
    
    func registerSingletonImpl1WithKey(id: String = "1", eager: Bool = false) throws {
        try add(TestKey.singleton1, isEager: eager) { SingletonImpl1(id: id) }
    }
    
    func registerSingletonImpl2WithKey(eager: Bool = false) throws {
        try add(TestKey.singleton2, isEager: eager) { SingletonImpl2(other: try $0.resolve(using: .singleton1)) }
    }
    
    func resolveSingleton(_ key: TestKey) throws -> Singleton {
        try resolve(using: key)
    }
    
    fileprivate func add<T>(for key: TestKey, element: @escaping () -> T) throws {
        try add(key, bootstrap: element)
    }
    
    fileprivate func resolve<T>(using key: TestKey) throws -> T {
        try resolve(key)
    }
}

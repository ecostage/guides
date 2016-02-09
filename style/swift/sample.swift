// Don't include generated header comments

import Foundation // or not

// MARK: Closures

// Use typealias when closures are referenced in multiple places
typealias CoolClosure = (foo: Int) -> Bool

// Use aliased parameter names when function parameters are ambiguous
func yTown(some: Int, withCallback callback: CoolClosure) -> Bool {
    return CoolClosure(some)
}

// It's OK to use $ variable references if the closure is very short and
// readability is maintained
let cool = yTown(5) { $0 == 6 }

// Use full variable names when closures are more complex
let cool = yTown(5) { foo in
    if foo > 5 && foo < 0 {
        return true
    } else {
      return false
    }
}

// MARK: Optionals

var maybe: Bool?

// Use if-let syntax to unwrap optionals
if let definitely = maybe {
    println("This is \(definitely) here")
}

// If the API you are using has implicit unwrapping you should still use if-let
func someUnauditedAPI(thing: String!) {
    if let string = thing {
        println(string)
    }
}

// MARK: Enums

enum Response {
    case Success(NSData)
    case Failure(NSError)
}

// When the type is known you can let the compiler infer
let response: Response = .Success(NSData())

func doSomeWork() -> Response {
    let data = ...
    return .Success(data)
}

switch response {
case let .Success(data):
    println("The response returned successfully \(data)")

case let .Failure(error):
    println("An error occured: \(error)")
}

// Group methods into specific extensions for each level of access control
private extension MyClass {
  func doSomethingPrivate() {

  }
}

// MARK: Capitalization

// Types begin with a capital letter
struct DopeObject {
  // if the first letter of an acronym is lowercase, the entire thing should
  // be lowercase
  let json: AnyObject

  // if the first letter of an acronym is uppercase, the entire thing should
  // be uppercase
  static func decodeFromJSON(json: AnyObject) -> DopeObject {
    return DopeObject(json: json)
  }
}

// Break up long function calls and initializers
let foo = Foo(
  bar: Bar(),
  baz: Baz(),
  quz: Quz(
    x: 42,
    y: 365
  )
)

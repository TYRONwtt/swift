// RUN: %target-typecheck-verify-swift

class Foo {
  func bar(_: bar) {} // expected-error{{use of undeclared type 'bar'}}
}

class C {
	var triangle : triangle  // expected-error{{use of undeclared type 'triangle'}}

	init() {}
}

typealias t = t // expected-error {{type alias 't' references itself}}
// expected-note@-1{{type declared here}}




// <rdar://problem/17564699> QoI: Structs should get convenience initializers
struct MyStruct {
  init(k: Int) {
  }
  convenience init() {  // expected-error {{delegating initializers in structs are not marked with 'convenience'}} {{3-15=}}
    self.init(k: 1)
  }
}

// RUN: %target-swift-frontend -disable-availability-checking -parse-as-library %s -emit-sil -o /dev/null -verify
// RUN: %target-swift-frontend -disable-availability-checking -parse-as-library %s -emit-sil -o /dev/null -verify -strict-concurrency=targeted
// RUN: %target-swift-frontend -disable-availability-checking -parse-as-library %s -emit-sil -o /dev/null -verify -strict-concurrency=complete
// RUN: %target-swift-frontend -disable-availability-checking -parse-as-library %s -emit-sil -o /dev/null -verify -strict-concurrency=complete -enable-experimental-feature SendNonSendable

// REQUIRES: concurrency

// This should pass without any warnings or errors

@MainActor
var floofer: Int = 42

@main struct Doggo { }

extension Doggo {
  static func main() {
    print("Doggo value: \(floofer)")
  }
}

// -*- swift -*-

//===----------------------------------------------------------------------===//
// Automatically Generated From validation-test/stdlib/Collection/Inputs/Template.swift.gyb
// Do Not Edit Directly!
//===----------------------------------------------------------------------===//

// RUN: rm -rf %t
// RUN: mkdir -p %t
// RUN: %gyb %s -o %t/main.swift
// RUN: %line-directive %t/main.swift -- %target-build-swift %t/main.swift -o %t/DefaultedMutableRangeReplaceableCollection.swift.a.out
// RUN: %line-directive %t/main.swift -- %target-run %t/DefaultedMutableRangeReplaceableCollection.swift.a.out
// REQUIRES: executable_test

import StdlibUnittest
import StdlibCollectionUnittest

// Also import modules which are used by StdlibUnittest internally. This
// workaround is needed to link all required libraries in case we compile
// StdlibUnittest with -sil-serialize-all.
import SwiftPrivate
#if _runtime(_ObjC)
import ObjectiveC
#endif

var CollectionTests = TestSuite("Collection")

// Test collections using value types as elements.
do {
  var resiliencyChecks = CollectionMisuseResiliencyChecks.all
  resiliencyChecks.creatingOutOfBoundsIndicesBehavior = .trap

  CollectionTests.addRangeReplaceableCollectionTests(
    makeCollection: { (elements: [OpaqueValue<Int>]) in
      return DefaultedMutableRangeReplaceableCollection(elements: elements)
    },
    wrapValue: identity,
    extractValue: identity,
    makeCollectionOfEquatable: { (elements: [MinimalEquatableValue]) in
      return DefaultedMutableRangeReplaceableCollection(elements: elements)
    },
    wrapValueIntoEquatable: identityEq,
    extractValueFromEquatable: identityEq,
    resiliencyChecks: resiliencyChecks
  )
  CollectionTests.addMutableCollectionTests(
    makeCollection: { (elements: [OpaqueValue<Int>]) in
      return DefaultedMutableRangeReplaceableCollection(elements: elements)
    },
    wrapValue: identity,
    extractValue: identity,
    makeCollectionOfEquatable: { (elements: [MinimalEquatableValue]) in
      return DefaultedMutableRangeReplaceableCollection(elements: elements)
    },
    wrapValueIntoEquatable: identityEq,
    extractValueFromEquatable: identityEq,
    makeCollectionOfComparable: { (elements: [MinimalComparableValue]) in
      return DefaultedMutableRangeReplaceableCollection(elements: elements)
    },
    wrapValueIntoComparable: identityComp,
    extractValueFromComparable: identityComp,
    resiliencyChecks: resiliencyChecks
    , withUnsafeMutableBufferPointerIsSupported: false,
    isFixedLengthCollection: true
  )
}

// Test collections using a reference type as element.
do {
  var resiliencyChecks = CollectionMisuseResiliencyChecks.all
  resiliencyChecks.creatingOutOfBoundsIndicesBehavior = .trap

  CollectionTests.addRangeReplaceableCollectionTests(
    makeCollection: { (elements: [LifetimeTracked]) in
      return DefaultedMutableRangeReplaceableCollection(elements: elements)
    },
    wrapValue: { (element: OpaqueValue<Int>) in
      LifetimeTracked(element.value, identity: element.identity)
    },
    extractValue: { (element: LifetimeTracked) in
      OpaqueValue(element.value, identity: element.identity)
    },
    makeCollectionOfEquatable: { (elements: [MinimalEquatableValue]) in
      // FIXME: use LifetimeTracked.
      return DefaultedMutableRangeReplaceableCollection(elements: elements)
    },
    wrapValueIntoEquatable: identityEq,
    extractValueFromEquatable: identityEq,
    resiliencyChecks: resiliencyChecks
  )
  CollectionTests.addMutableCollectionTests(
    makeCollection: { (elements: [LifetimeTracked]) in
      return DefaultedMutableRangeReplaceableCollection(elements: elements)
    },
    wrapValue: { (element: OpaqueValue<Int>) in
      LifetimeTracked(element.value, identity: element.identity)
    },
    extractValue: { (element: LifetimeTracked) in
      OpaqueValue(element.value, identity: element.identity)
    },
    makeCollectionOfEquatable: { (elements: [MinimalEquatableValue]) in
      // FIXME: use LifetimeTracked.
      return DefaultedMutableRangeReplaceableCollection(elements: elements)
    },
    wrapValueIntoEquatable: identityEq,
    extractValueFromEquatable: identityEq,
    makeCollectionOfComparable: { (elements: [MinimalComparableValue]) in
      // FIXME: use LifetimeTracked.
      return DefaultedMutableRangeReplaceableCollection(elements: elements)
    },
    wrapValueIntoComparable: identityComp,
    extractValueFromComparable: identityComp,
    resiliencyChecks: resiliencyChecks
    , withUnsafeMutableBufferPointerIsSupported: false,
    isFixedLengthCollection: true
  )
}

runAllTests()

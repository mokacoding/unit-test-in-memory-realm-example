# Testing Realm Apps Example

This is the example code for the post [Testing Realm app](http://www.mokacoding.com/blog/testing-realm-apps/) from [mokacoding](http://www.mokacoding.com/).

It shows how to encapsulate the logic that access the realm in a single class, and how to test it using an on-disk realm vs an in-memory one.

You can run the `benchmark` script to run both in-memory and on-disk tests a number of times, and compare the performances.

**Note:** The `in-memory-xctest` target is there to show how to write the tests without using third party testing frameworks, but is not part of the benchmark.

For more info tweet me [@mokagio](http://twitter.com/mokagio).

---

(c) 2015-2016 - Giovanni Lodi

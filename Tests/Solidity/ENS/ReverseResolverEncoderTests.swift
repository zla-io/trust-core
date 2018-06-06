// Copyright © 2017-2018 ZLA.
//
// This file is part of ZLA. The full ZLA copyright notice, including
// terms governing use, modification, and redistribution, is contained in the
// file LICENSE at the root of the source code distribution tree.

import XCTest
import TrustCore

class ReverseResolverEncoderTests: XCTestCase {

    let address = Address(string: "0x5aaeb6053f3e94c9b9a09f33669435e7ef1beaed")!
    let addr_reverse = "addr.reverse"
    let ens_name = "foo.eth"
    lazy var reverse_name: String = {
        [address.data.hexString, addr_reverse].joined(separator: ".")
    }()

    func testEncodeENS() {
        // ethabi encode function ./reverse_resolver.json ens
        XCTAssertEqual(ReverseResolverEncoder.encodeENS().hexString, "3f15457f")
    }

    func testEncodeName() {
        // ethabi encode function ./reverse_resolver.json name -p 2103fd044150f573e47fcb48a7eedec6afd0911f9af1b0ff9167014ff22edd24
        let name = namehash(reverse_name)
        XCTAssertEqual(ReverseResolverEncoder.encodeName(name).hexString, "691f34312103fd044150f573e47fcb48a7eedec6afd0911f9af1b0ff9167014ff22edd24")
    }

    func testEncodeSetName() {
        // ethabi encode function ./reverse_resolver.json setName -p 2103fd044150f573e47fcb48a7eedec6afd0911f9af1b0ff9167014ff22edd24 foo.eth
        let node = namehash(reverse_name)
        XCTAssertEqual(node.hexString, "2103fd044150f573e47fcb48a7eedec6afd0911f9af1b0ff9167014ff22edd24")
        let result = ReverseResolverEncoder.encodeSetName(node, name: ens_name)
        XCTAssertEqual(result.hexString, "773722132103fd044150f573e47fcb48a7eedec6afd0911f9af1b0ff9167014ff22edd2400000000000000000000000000000000000000000000000000000000000000400000000000000000000000000000000000000000000000000000000000000007666f6f2e65746800000000000000000000000000000000000000000000000000")
    }
}

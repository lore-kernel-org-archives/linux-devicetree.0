From: Trent Piepho <tpiepho@impinj.com>
Subject: [PATCH 5/5] net: phy: dp83867: Use unsigned variables to store
 unsigned properties
Date: Fri, 10 May 2019 21:46:13 +0000
Message-ID: <20190510214550.18657-5-tpiepho@impinj.com>
References: <20190510214550.18657-1-tpiepho@impinj.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190510214550.18657-1-tpiepho@impinj.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Trent Piepho <tpiepho@impinj.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>
List-Id: devicetree@vger.kernel.org

VGhlIHZhcmlhYmxlcyB1c2VkIHRvIHN0b3JlIHUzMiBEVCBwcm9wZXJ0aWVzIHdlcmUgc2lnbmVk
IGludHMuICBUaGlzCmRvZXNuJ3Qgd29yayBwcm9wZXJseSBpZiB0aGUgdmFsdWUgb2YgdGhlIHBy
b3BlcnR5IHdlcmUgdG8gb3ZlcmZsb3cuClVzZSB1bnNpZ25lZCB2YXJpYWJsZXMgc28gdGhpcyBk
b2Vzbid0IGhhcHBlbi4KCkNjOiBBbmRyZXcgTHVubiA8YW5kcmV3QGx1bm4uY2g+CkNjOiBGbG9y
aWFuIEZhaW5lbGxpIDxmLmZhaW5lbGxpQGdtYWlsLmNvbT4KQ2M6IEhlaW5lciBLYWxsd2VpdCA8
aGthbGx3ZWl0MUBnbWFpbC5jb20+ClNpZ25lZC1vZmYtYnk6IFRyZW50IFBpZXBobyA8dHBpZXBo
b0BpbXBpbmouY29tPgotLS0KIGRyaXZlcnMvbmV0L3BoeS9kcDgzODY3LmMgfCA2ICsrKy0tLQog
MSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL25ldC9waHkvZHA4Mzg2Ny5jIGIvZHJpdmVycy9uZXQvcGh5L2RwODM4Njcu
YwppbmRleCBhNDZjYzk0MjdmYjMuLmVkZDllMjc0MjVlOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9u
ZXQvcGh5L2RwODM4NjcuYworKysgYi9kcml2ZXJzL25ldC9waHkvZHA4Mzg2Ny5jCkBAIC04Miw5
ICs4Miw5IEBAIGVudW0gewogfTsKIAogc3RydWN0IGRwODM4NjdfcHJpdmF0ZSB7Ci0JaW50IHJ4
X2lkX2RlbGF5OwotCWludCB0eF9pZF9kZWxheTsKLQlpbnQgZmlmb19kZXB0aDsKKwl1MzIgcnhf
aWRfZGVsYXk7CisJdTMyIHR4X2lkX2RlbGF5OworCXUzMiBmaWZvX2RlcHRoOwogCWludCBpb19p
bXBlZGFuY2U7CiAJaW50IHBvcnRfbWlycm9yaW5nOwogCWJvb2wgcnhjdHJsX3N0cmFwX3F1aXJr
OwotLSAKMi4xNC41Cgo=

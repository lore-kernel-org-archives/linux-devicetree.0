From: "Z.q. Hou" <zhiqiang.hou@nxp.com>
Subject: [PATCHv5 04/20] PCI: mobiveil: Remove the flag MSI_FLAG_MULTI_PCI_MSI
Date: Fri, 12 Apr 2019 08:35:36 +0000
Message-ID: <20190412083635.33626-5-Zhiqiang.Hou@nxp.com>
References: <20190412083635.33626-1-Zhiqiang.Hou@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190412083635.33626-1-Zhiqiang.Hou@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "bhelgaas@google.com" <bhelgaas@google.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "l.subrahmanya@mobiveil.co.in" <l.subrahmanya@mobiveil.co.in>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Leo Li <leoyang.li@nxp.com>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>
Cc: Mingkai Hu <mingkai.hu@nxp.com>, "M.h. Lian" <minghuan.lian@nxp.com>, Xiaowei Bao <xiaowei.bao@nxp.com>, "Z.q. Hou" <zhiqiang.hou@nxp.com>
List-Id: devicetree@vger.kernel.org

RnJvbTogSG91IFpoaXFpYW5nIDxaaGlxaWFuZy5Ib3VAbnhwLmNvbT4NCg0KVGhlIGN1cnJlbnQg
Y29kZSBkb2VzIG5vdCBzdXBwb3J0IG11bHRpcGxlIE1TSXMsIHNvIHJlbW92ZQ0KdGhlIGNvcnJl
c3BvbmRpbmcgZmxhZyBmcm9tIHRoZSBtc2lfZG9tYWluX2luZm8gc3RydWN0dXJlLg0KDQpGaXhl
czogMWU5MTNlNTgzMzVmICgiUENJOiBtb2JpdmVpbDogQWRkIE1TSSBzdXBwb3J0IikNClNpZ25l
ZC1vZmYtYnk6IEhvdSBaaGlxaWFuZyA8WmhpcWlhbmcuSG91QG54cC5jb20+DQpSZXZpZXdlZC1i
eTogTWluZ2h1YW4gTGlhbiA8TWluZ2h1YW4uTGlhbkBueHAuY29tPg0KLS0tDQpWNToNCiAtIENv
cnJlY3RlZCB0aGUgc3ViamVjdC4NCg0KIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpZS1tb2Jp
dmVpbC5jIHwgMiArLQ0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2llLW1vYml2ZWls
LmMgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaWUtbW9iaXZlaWwuYw0KaW5kZXggNTYzMjEw
ZTczMWQzLi5hMGRkMzM3YzYyMTQgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL3BjaS9jb250cm9sbGVy
L3BjaWUtbW9iaXZlaWwuYw0KKysrIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2llLW1vYml2
ZWlsLmMNCkBAIC03MDMsNyArNzAzLDcgQEAgc3RhdGljIHN0cnVjdCBpcnFfY2hpcCBtb2JpdmVp
bF9tc2lfaXJxX2NoaXAgPSB7DQogDQogc3RhdGljIHN0cnVjdCBtc2lfZG9tYWluX2luZm8gbW9i
aXZlaWxfbXNpX2RvbWFpbl9pbmZvID0gew0KIAkuZmxhZ3MJPSAoTVNJX0ZMQUdfVVNFX0RFRl9E
T01fT1BTIHwgTVNJX0ZMQUdfVVNFX0RFRl9DSElQX09QUyB8DQotCQkgICBNU0lfRkxBR19NVUxU
SV9QQ0lfTVNJIHwgTVNJX0ZMQUdfUENJX01TSVgpLA0KKwkJICAgTVNJX0ZMQUdfUENJX01TSVgp
LA0KIAkuY2hpcAk9ICZtb2JpdmVpbF9tc2lfaXJxX2NoaXAsDQogfTsNCiANCi0tIA0KMi4xNy4x
DQoNCg==

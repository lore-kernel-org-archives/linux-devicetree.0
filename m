From: "Z.q. Hou" <zhiqiang.hou@nxp.com>
Subject: [PATCHv5 17/20] PCI: mobiveil: Complete initialization of host even
 if no PCIe link
Date: Fri, 12 Apr 2019 08:36:54 +0000
Message-ID: <20190412083635.33626-18-Zhiqiang.Hou@nxp.com>
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

RnJvbTogSG91IFpoaXFpYW5nIDxaaGlxaWFuZy5Ib3VAbnhwLmNvbT4NCg0KU29tZXRpbWVzIHRo
ZXJlIGlzIG5vdCBhIFBDSWUgRW5kcG9pbnQgc3RhbGxlZCBpbiB0aGUgc2xvdCwNCnNvIGRvIG5v
dCBleGl0IHdoZW4gdGhlIFBDSWUgbGluayBpcyBub3QgdXAuIEFuZCBkZWdyYWRlIHRoZQ0KcHJp
bnQgbGV2ZWwgb2YgbGluayB1cCBpbmZvLg0KDQpTaWduZWQtb2ZmLWJ5OiBIb3UgWmhpcWlhbmcg
PFpoaXFpYW5nLkhvdUBueHAuY29tPg0KUmV2aWV3ZWQtYnk6IE1pbmdodWFuIExpYW4gPE1pbmdo
dWFuLkxpYW5AbnhwLmNvbT4NClJldmlld2VkLWJ5OiBTdWJyYWhtYW55YSBMaW5nYXBwYSA8bC5z
dWJyYWhtYW55YUBtb2JpdmVpbC5jby5pbj4NCi0tLQ0KVjU6DQogLSBDb3JyZWN0ZWQgYW5kIHJl
dG91Y2hlZCB0aGUgc3ViamVjdCBhbmQgY2hhbmdlbG9nLg0KDQogZHJpdmVycy9wY2kvY29udHJv
bGxlci9wY2llLW1vYml2ZWlsLmMgfCA2ICsrLS0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9jb250
cm9sbGVyL3BjaWUtbW9iaXZlaWwuYyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpZS1tb2Jp
dmVpbC5jDQppbmRleCAxZWUzZWEyNTcwYzAuLjhkYzg3YzdhNjAwZSAxMDA2NDQNCi0tLSBhL2Ry
aXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpZS1tb2JpdmVpbC5jDQorKysgYi9kcml2ZXJzL3BjaS9j
b250cm9sbGVyL3BjaWUtbW9iaXZlaWwuYw0KQEAgLTU2MCw3ICs1NjAsNyBAQCBzdGF0aWMgaW50
IG1vYml2ZWlsX2JyaW5ndXBfbGluayhzdHJ1Y3QgbW9iaXZlaWxfcGNpZSAqcGNpZSkNCiAJCXVz
bGVlcF9yYW5nZShMSU5LX1dBSVRfTUlOLCBMSU5LX1dBSVRfTUFYKTsNCiAJfQ0KIA0KLQlkZXZf
ZXJyKCZwY2llLT5wZGV2LT5kZXYsICJsaW5rIG5ldmVyIGNhbWUgdXBcbiIpOw0KKwlkZXZfaW5m
bygmcGNpZS0+cGRldi0+ZGV2LCAibGluayBuZXZlciBjYW1lIHVwXG4iKTsNCiANCiAJcmV0dXJu
IC1FVElNRURPVVQ7DQogfQ0KQEAgLTkyNiwxMCArOTI2LDggQEAgc3RhdGljIGludCBtb2JpdmVp
bF9wY2llX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQogCWJyaWRnZS0+c3dp
enpsZV9pcnEgPSBwY2lfY29tbW9uX3N3aXp6bGU7DQogDQogCXJldCA9IG1vYml2ZWlsX2JyaW5n
dXBfbGluayhwY2llKTsNCi0JaWYgKHJldCkgew0KKwlpZiAocmV0KQ0KIAkJZGV2X2luZm8oZGV2
LCAibGluayBicmluZy11cCBmYWlsZWRcbiIpOw0KLQkJZ290byBlcnJvcjsNCi0JfQ0KIA0KIAkv
KiBzZXR1cCB0aGUga2VybmVsIHJlc291cmNlcyBmb3IgdGhlIG5ld2x5IGFkZGVkIFBDSWUgcm9v
dCBidXMgKi8NCiAJcmV0ID0gcGNpX3NjYW5fcm9vdF9idXNfYnJpZGdlKGJyaWRnZSk7DQotLSAN
CjIuMTcuMQ0KDQo=

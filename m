From: "Z.q. Hou" <zhiqiang.hou@nxp.com>
Subject: [PATCHv5 08/20] PCI: mobiveil: Use the 1st inbound window for MEM
 inbound transactions
Date: Fri, 12 Apr 2019 08:36:00 +0000
Message-ID: <20190412083635.33626-9-Zhiqiang.Hou@nxp.com>
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

RnJvbTogSG91IFpoaXFpYW5nIDxaaGlxaWFuZy5Ib3VAbnhwLmNvbT4NCg0KVGhlIGluYm91bmQg
d2luZG93cyBoYXZlIGluZGVwZW5kZW50IHJlZ2lzdGVyIHNldCBhZ2FpbnN0IG91dGJvdW5kIHdp
bmRvd3MuDQpUaGlzIHBhdGNoIGNoYW5nZSB0aGUgTUVNIGluYm91bmQgd2luZG93IHRvIHRoZSBm
aXJzdCBvbmUuDQoNClNpZ25lZC1vZmYtYnk6IEhvdSBaaGlxaWFuZyA8WmhpcWlhbmcuSG91QG54
cC5jb20+DQpSZXZpZXdlZC1ieTogTWluZ2h1YW4gTGlhbiA8TWluZ2h1YW4uTGlhbkBueHAuY29t
Pg0KUmV2aWV3ZWQtYnk6IFN1YnJhaG1hbnlhIExpbmdhcHBhIDxsLnN1YnJhaG1hbnlhQG1vYml2
ZWlsLmNvLmluPg0KLS0tDQpWNToNCiAtIENvcnJlY3RlZCBhbmQgcmV0b3VjaGVkIHRoZSBzdWJq
ZWN0IGFuZCBjaGFuZ2Vsb2cuDQoNCiBkcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaWUtbW9iaXZl
aWwuYyB8IDIgKy0NCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpZS1tb2JpdmVpbC5j
IGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2llLW1vYml2ZWlsLmMNCmluZGV4IGRmNzFjMTFi
NDgxMC4uZTg4YWZjNzkyYTVjIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9w
Y2llLW1vYml2ZWlsLmMNCisrKyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpZS1tb2JpdmVp
bC5jDQpAQCAtNjE2LDcgKzYxNiw3IEBAIHN0YXRpYyBpbnQgbW9iaXZlaWxfaG9zdF9pbml0KHN0
cnVjdCBtb2JpdmVpbF9wY2llICpwY2llKQ0KIAkJCSAgIENGR19XSU5ET1dfVFlQRSwgcmVzb3Vy
Y2Vfc2l6ZShwY2llLT5vYl9pb19yZXMpKTsNCiANCiAJLyogbWVtb3J5IGluYm91bmQgdHJhbnNs
YXRpb24gd2luZG93ICovDQotCXByb2dyYW1faWJfd2luZG93cyhwY2llLCBXSU5fTlVNXzEsIDAs
IE1FTV9XSU5ET1dfVFlQRSwgSUJfV0lOX1NJWkUpOw0KKwlwcm9ncmFtX2liX3dpbmRvd3MocGNp
ZSwgV0lOX05VTV8wLCAwLCBNRU1fV0lORE9XX1RZUEUsIElCX1dJTl9TSVpFKTsNCiANCiAJLyog
R2V0IHRoZSBJL08gYW5kIG1lbW9yeSByYW5nZXMgZnJvbSBEVCAqLw0KIAlyZXNvdXJjZV9saXN0
X2Zvcl9lYWNoX2VudHJ5KHdpbiwgJnBjaWUtPnJlc291cmNlcykgew0KLS0gDQoyLjE3LjENCg0K

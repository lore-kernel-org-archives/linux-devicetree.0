From: "Z.q. Hou" <zhiqiang.hou@nxp.com>
Subject: [PATCHv5 06/20] PCI: mobiveil: Replace the resource list iteration
 function
Date: Fri, 12 Apr 2019 08:35:48 +0000
Message-ID: <20190412083635.33626-7-Zhiqiang.Hou@nxp.com>
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

RnJvbTogSG91IFpoaXFpYW5nIDxaaGlxaWFuZy5Ib3VAbnhwLmNvbT4NCg0KQXMgaXQgd29uJ3Qg
ZGVsZXRlIGFueSBub2RlIGR1cmluZyB0aGlzIGl0ZXJhdGlvbiwgcmVwbGFjZQ0KdGhlIGZ1bmN0
aW9uIHJlc291cmNlX2xpc3RfZm9yX2VhY2hfZW50cnlfc2FmZSgpIHdpdGggdGhlDQpyZXNvdXJj
ZV9saXN0X2Zvcl9lYWNoX2VudHJ5KCkuDQoNClNpZ25lZC1vZmYtYnk6IEhvdSBaaGlxaWFuZyA8
WmhpcWlhbmcuSG91QG54cC5jb20+DQpSZXZpZXdlZC1ieTogTWluZ2h1YW4gTGlhbiA8TWluZ2h1
YW4uTGlhbkBueHAuY29tPg0KUmV2aWV3ZWQtYnk6IFN1YnJhaG1hbnlhIExpbmdhcHBhIDxsLnN1
YnJhaG1hbnlhQG1vYml2ZWlsLmNvLmluPg0KLS0tDQpWNToNCiAtIENvcnJlY3RlZCBhbmQgcmV0
b3VjaGVkIHRoZSBzdWJqZWN0IGFuZCBjaGFuZ2Vsb2cuDQoNCiBkcml2ZXJzL3BjaS9jb250cm9s
bGVyL3BjaWUtbW9iaXZlaWwuYyB8IDQgKystLQ0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9jb250cm9s
bGVyL3BjaWUtbW9iaXZlaWwuYyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpZS1tb2JpdmVp
bC5jDQppbmRleCA4ZmY4NzMwMjNiNWYuLmIyY2M5YzA5N2ZjOSAxMDA2NDQNCi0tLSBhL2RyaXZl
cnMvcGNpL2NvbnRyb2xsZXIvcGNpZS1tb2JpdmVpbC5jDQorKysgYi9kcml2ZXJzL3BjaS9jb250
cm9sbGVyL3BjaWUtbW9iaXZlaWwuYw0KQEAgLTU2OSw3ICs1NjksNyBAQCBzdGF0aWMgaW50IG1v
Yml2ZWlsX2hvc3RfaW5pdChzdHJ1Y3QgbW9iaXZlaWxfcGNpZSAqcGNpZSkNCiB7DQogCXUzMiB2
YWx1ZSwgcGFiX2N0cmwsIHR5cGU7DQogCWludCBlcnI7DQotCXN0cnVjdCByZXNvdXJjZV9lbnRy
eSAqd2luLCAqdG1wOw0KKwlzdHJ1Y3QgcmVzb3VyY2VfZW50cnkgKndpbjsNCiANCiAJZXJyID0g
bW9iaXZlaWxfYnJpbmd1cF9saW5rKHBjaWUpOw0KIAlpZiAoZXJyKSB7DQpAQCAtNjIwLDcgKzYy
MCw3IEBAIHN0YXRpYyBpbnQgbW9iaXZlaWxfaG9zdF9pbml0KHN0cnVjdCBtb2JpdmVpbF9wY2ll
ICpwY2llKQ0KIAlwcm9ncmFtX2liX3dpbmRvd3MocGNpZSwgV0lOX05VTV8xLCAwLCBNRU1fV0lO
RE9XX1RZUEUsIElCX1dJTl9TSVpFKTsNCiANCiAJLyogR2V0IHRoZSBJL08gYW5kIG1lbW9yeSBy
YW5nZXMgZnJvbSBEVCAqLw0KLQlyZXNvdXJjZV9saXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUod2lu
LCB0bXAsICZwY2llLT5yZXNvdXJjZXMpIHsNCisJcmVzb3VyY2VfbGlzdF9mb3JfZWFjaF9lbnRy
eSh3aW4sICZwY2llLT5yZXNvdXJjZXMpIHsNCiAJCWlmIChyZXNvdXJjZV90eXBlKHdpbi0+cmVz
KSA9PSBJT1JFU09VUkNFX01FTSkNCiAJCQl0eXBlID0gTUVNX1dJTkRPV19UWVBFOw0KIAkJZWxz
ZSBpZiAocmVzb3VyY2VfdHlwZSh3aW4tPnJlcykgPT0gSU9SRVNPVVJDRV9JTykNCi0tIA0KMi4x
Ny4xDQoNCg==

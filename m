From: "Z.q. Hou" <zhiqiang.hou@nxp.com>
Subject: [PATCHv5 11/20] PCI: mobiveil: Correct the fixup of Class Code field
Date: Fri, 12 Apr 2019 08:36:18 +0000
Message-ID: <20190412083635.33626-12-Zhiqiang.Hou@nxp.com>
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

RnJvbTogSG91IFpoaXFpYW5nIDxaaGlxaWFuZy5Ib3VAbnhwLmNvbT4NCg0KT25seSBmaXggdXAg
dGhlIENsYXNzIENvZGUgZmllbGQgdG8gUENJIGJyaWRnZSwgZG8gbm90IGNoYW5nZSB0aGUNClJl
dmlzaW9uIElELiBBbmQgdGhpcyBwYXRjaCBhbHNvIG1vdmUgdGhlIENsYXNzIENvZGUgZml4dXAg
dG8NCmZ1bmN0aW9uIG1vYml2ZWlsX2hvc3RfaW5pdCgpLg0KDQpGaXhlczogOWFmNmJjYjExZTEy
ICgiUENJOiBtb2JpdmVpbDogQWRkIE1vYml2ZWlsIFBDSWUgSG9zdCBCcmlkZ2UgSVAgZHJpdmVy
IikNClNpZ25lZC1vZmYtYnk6IEhvdSBaaGlxaWFuZyA8WmhpcWlhbmcuSG91QG54cC5jb20+DQpS
ZXZpZXdlZC1ieTogTWluZ2h1YW4gTGlhbiA8TWluZ2h1YW4uTGlhbkBueHAuY29tPg0KUmV2aWV3
ZWQtYnk6IFN1YnJhaG1hbnlhIExpbmdhcHBhIDxsLnN1YnJhaG1hbnlhQG1vYml2ZWlsLmNvLmlu
Pg0KLS0tDQpWNToNCiAtIENvcnJlY3RlZCBhbmQgcmV0b3VjaGVkIHRoZSBzdWJqZWN0IGFuZCBj
aGFuZ2Vsb2cuDQoNCiBkcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaWUtbW9iaXZlaWwuYyB8IDkg
KysrKysrLS0tDQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMo
LSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpZS1tb2JpdmVpbC5j
IGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2llLW1vYml2ZWlsLmMNCmluZGV4IDc4ZTU3NWU3
MWY0ZC4uOGVlZTFhYjdlZTI0IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9w
Y2llLW1vYml2ZWlsLmMNCisrKyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpZS1tb2JpdmVp
bC5jDQpAQCAtNjUzLDYgKzY1MywxMiBAQCBzdGF0aWMgaW50IG1vYml2ZWlsX2hvc3RfaW5pdChz
dHJ1Y3QgbW9iaXZlaWxfcGNpZSAqcGNpZSkNCiAJCQkJICAgdHlwZSwgcmVzb3VyY2Vfc2l6ZSh3
aW4tPnJlcykpOw0KIAl9DQogDQorCS8qIGZpeHVwIGZvciBQQ0llIGNsYXNzIHJlZ2lzdGVyICov
DQorCXZhbHVlID0gY3NyX3JlYWRsKHBjaWUsIFBBQl9JTlRQX0FYSV9QSU9fQ0xBU1MpOw0KKwl2
YWx1ZSAmPSAweGZmOw0KKwl2YWx1ZSB8PSAoUENJX0NMQVNTX0JSSURHRV9QQ0kgPDwgMTYpOw0K
Kwljc3Jfd3JpdGVsKHBjaWUsIHZhbHVlLCBQQUJfSU5UUF9BWElfUElPX0NMQVNTKTsNCisNCiAJ
Lyogc2V0dXAgTVNJIGhhcmR3YXJlIHJlZ2lzdGVycyAqLw0KIAltb2JpdmVpbF9wY2llX2VuYWJs
ZV9tc2kocGNpZSk7DQogDQpAQCAtODk2LDkgKzkwMiw2IEBAIHN0YXRpYyBpbnQgbW9iaXZlaWxf
cGNpZV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KIAkJZ290byBlcnJvcjsN
CiAJfQ0KIA0KLQkvKiBmaXh1cCBmb3IgUENJZSBjbGFzcyByZWdpc3RlciAqLw0KLQljc3Jfd3Jp
dGVsKHBjaWUsIDB4MDYwNDAyYWIsIFBBQl9JTlRQX0FYSV9QSU9fQ0xBU1MpOw0KLQ0KIAkvKiBp
bml0aWFsaXplIHRoZSBJUlEgZG9tYWlucyAqLw0KIAlyZXQgPSBtb2JpdmVpbF9wY2llX2luaXRf
aXJxX2RvbWFpbihwY2llKTsNCiAJaWYgKHJldCkgew0KLS0gDQoyLjE3LjENCg0K

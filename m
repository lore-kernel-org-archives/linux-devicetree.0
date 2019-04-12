From: "Z.q. Hou" <zhiqiang.hou@nxp.com>
Subject: [PATCHv5 14/20] PCI: mobiveil: Initialize
 Primary/Secondary/Subordinate bus numbers
Date: Fri, 12 Apr 2019 08:36:36 +0000
Message-ID: <20190412083635.33626-15-Zhiqiang.Hou@nxp.com>
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

RnJvbTogSG91IFpoaXFpYW5nIDxaaGlxaWFuZy5Ib3VAbnhwLmNvbT4NCg0KVGhlIHJlc2V0IHZh
bHVlIG9mIFByaW1hcnksIFNlY29uZGFyeSBhbmQgU3Vib3JkaW5hdGUgYnVzIG51bWJlcnMgaXMN
Cnplcm8sIHNvIHNldCBhIHdvcmthYmxlIHZhbHVlIGZvciB0aGVzZSAzIGJ1cyBudW1iZXJzLg0K
DQpTaWduZWQtb2ZmLWJ5OiBIb3UgWmhpcWlhbmcgPFpoaXFpYW5nLkhvdUBueHAuY29tPg0KUmV2
aWV3ZWQtYnk6IE1pbmdodWFuIExpYW4gPE1pbmdodWFuLkxpYW5AbnhwLmNvbT4NClJldmlld2Vk
LWJ5OiBTdWJyYWhtYW55YSBMaW5nYXBwYSA8bC5zdWJyYWhtYW55YUBtb2JpdmVpbC5jby5pbj4N
Ci0tLQ0KVjU6DQogLSBDb3JyZWN0ZWQgYW5kIHJldG91Y2hlZCB0aGUgc3ViamVjdCBhbmQgY2hh
bmdlbG9nLg0KDQogZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2llLW1vYml2ZWlsLmMgfCA2ICsr
KysrKw0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykNCg0KZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpZS1tb2JpdmVpbC5jIGIvZHJpdmVycy9wY2kvY29udHJv
bGxlci9wY2llLW1vYml2ZWlsLmMNCmluZGV4IGRiN2VjYjAyMWM2My4uOTIxMDE2NWZlOGMwIDEw
MDY0NA0KLS0tIGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2llLW1vYml2ZWlsLmMNCisrKyBi
L2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpZS1tb2JpdmVpbC5jDQpAQCAtNTgyLDYgKzU4Miwx
MiBAQCBzdGF0aWMgaW50IG1vYml2ZWlsX2hvc3RfaW5pdChzdHJ1Y3QgbW9iaXZlaWxfcGNpZSAq
cGNpZSkNCiAJdTMyIHZhbHVlLCBwYWJfY3RybCwgdHlwZTsNCiAJc3RydWN0IHJlc291cmNlX2Vu
dHJ5ICp3aW47DQogDQorCS8qIHNldHVwIGJ1cyBudW1iZXJzICovDQorCXZhbHVlID0gY3NyX3Jl
YWRsKHBjaWUsIFBDSV9QUklNQVJZX0JVUyk7DQorCXZhbHVlICY9IDB4ZmYwMDAwMDA7DQorCXZh
bHVlIHw9IDB4MDBmZjAxMDA7DQorCWNzcl93cml0ZWwocGNpZSwgdmFsdWUsIFBDSV9QUklNQVJZ
X0JVUyk7DQorDQogCS8qDQogCSAqIHByb2dyYW0gQnVzIE1hc3RlciBFbmFibGUgQml0IGluIENv
bW1hbmQgUmVnaXN0ZXIgaW4gUEFCIENvbmZpZw0KIAkgKiBTcGFjZQ0KLS0gDQoyLjE3LjENCg0K

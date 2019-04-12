From: "Z.q. Hou" <zhiqiang.hou@nxp.com>
Subject: [PATCHv5 19/20] PCI: mobiveil: Add 8-bit and 16-bit register
 accessors
Date: Fri, 12 Apr 2019 08:37:05 +0000
Message-ID: <20190412083635.33626-20-Zhiqiang.Hou@nxp.com>
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

RnJvbTogSG91IFpoaXFpYW5nIDxaaGlxaWFuZy5Ib3VAbnhwLmNvbT4NCg0KVGhlcmUgYXJlIHNv
bWUgOC1iaXQgYW5kIDE2LWJpdCByZWdpc3RlcnMgaW4gUENJZQ0KY29uZmlndXJhdGlvbiBzcGFj
ZSwgc28gYWRkIGFjY2Vzc29ycyBmb3IgdGhlbS4NCg0KU2lnbmVkLW9mZi1ieTogSG91IFpoaXFp
YW5nIDxaaGlxaWFuZy5Ib3VAbnhwLmNvbT4NClJldmlld2VkLWJ5OiBNaW5naHVhbiBMaWFuIDxN
aW5naHVhbi5MaWFuQG54cC5jb20+DQpSZXZpZXdlZC1ieTogU3VicmFobWFueWEgTGluZ2FwcGEg
PGwuc3VicmFobWFueWFAbW9iaXZlaWwuY28uaW4+DQotLS0NClY1Og0KIC0gQ29ycmVjdGVkIGFu
ZCByZXRvdWNoZWQgdGhlIHN1YmplY3QgYW5kIGNoYW5nZWxvZy4NCiAtIE5vIGZ1bmN0aW9uYWxp
dHkgY2hhbmdlLg0KDQogZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2llLW1vYml2ZWlsLmMgfCAy
MCArKysrKysrKysrKysrKysrKysrKw0KIDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCsp
DQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaWUtbW9iaXZlaWwuYyBi
L2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpZS1tb2JpdmVpbC5jDQppbmRleCA0MTFlOTc3OWRh
MTIuLjQ1NmFkZmVlMzkzYyAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNp
ZS1tb2JpdmVpbC5jDQorKysgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaWUtbW9iaXZlaWwu
Yw0KQEAgLTI2OCwxMSArMjY4LDMxIEBAIHN0YXRpYyB1MzIgY3NyX3JlYWRsKHN0cnVjdCBtb2Jp
dmVpbF9wY2llICpwY2llLCB1MzIgb2ZmKQ0KIAlyZXR1cm4gY3NyX3JlYWQocGNpZSwgb2ZmLCAw
eDQpOw0KIH0NCiANCitzdGF0aWMgdTMyIGNzcl9yZWFkdyhzdHJ1Y3QgbW9iaXZlaWxfcGNpZSAq
cGNpZSwgdTMyIG9mZikNCit7DQorCXJldHVybiBjc3JfcmVhZChwY2llLCBvZmYsIDB4Mik7DQor
fQ0KKw0KK3N0YXRpYyB1MzIgY3NyX3JlYWRiKHN0cnVjdCBtb2JpdmVpbF9wY2llICpwY2llLCB1
MzIgb2ZmKQ0KK3sNCisJcmV0dXJuIGNzcl9yZWFkKHBjaWUsIG9mZiwgMHgxKTsNCit9DQorDQog
c3RhdGljIHZvaWQgY3NyX3dyaXRlbChzdHJ1Y3QgbW9iaXZlaWxfcGNpZSAqcGNpZSwgdTMyIHZh
bCwgdTMyIG9mZikNCiB7DQogCWNzcl93cml0ZShwY2llLCB2YWwsIG9mZiwgMHg0KTsNCiB9DQog
DQorc3RhdGljIHZvaWQgY3NyX3dyaXRldyhzdHJ1Y3QgbW9iaXZlaWxfcGNpZSAqcGNpZSwgdTMy
IHZhbCwgdTMyIG9mZikNCit7DQorCWNzcl93cml0ZShwY2llLCB2YWwsIG9mZiwgMHgyKTsNCit9
DQorDQorc3RhdGljIHZvaWQgY3NyX3dyaXRlYihzdHJ1Y3QgbW9iaXZlaWxfcGNpZSAqcGNpZSwg
dTMyIHZhbCwgdTMyIG9mZikNCit7DQorCWNzcl93cml0ZShwY2llLCB2YWwsIG9mZiwgMHgxKTsN
Cit9DQorDQogc3RhdGljIGJvb2wgbW9iaXZlaWxfcGNpZV9saW5rX3VwKHN0cnVjdCBtb2JpdmVp
bF9wY2llICpwY2llKQ0KIHsNCiAJcmV0dXJuIChjc3JfcmVhZGwocGNpZSwgTFRTU01fU1RBVFVT
KSAmDQotLSANCjIuMTcuMQ0KDQo=

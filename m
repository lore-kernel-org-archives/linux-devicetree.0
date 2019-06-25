From: "Z.q. Hou" <zhiqiang.hou@nxp.com>
Subject: [PATCHv7 4/7] PCI: mobiveil: Add 8-bit and 16-bit CSR register
 accessors
Date: Tue, 25 Jun 2019 09:09:28 +0000
Message-ID: <20190625091039.18933-5-Zhiqiang.Hou@nxp.com>
References: <20190625091039.18933-1-Zhiqiang.Hou@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190625091039.18933-1-Zhiqiang.Hou@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "bhelgaas@google.com" <bhelgaas@google.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "arnd@arndb.de" <arnd@arndb.de>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "l.subrahmanya@mobiveil.co.in" <l.subrahmanya@mobiveil.co.in>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "m.karthikeyan@mobiveil.co.in" <m.karthikeyan@mobiveil.co.in>, Leo Li <leoyang.li@nxp.com>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.>
Cc: Mingkai Hu <mingkai.hu@nxp.com>, "M.h. Lian" <minghuan.lian@nxp.com>, Xiaowei Bao <xiaowei.bao@nxp.com>, "Z.q. Hou" <zhiqiang.hou@nxp.com>
List-Id: devicetree@vger.kernel.org

RnJvbTogSG91IFpoaXFpYW5nIDxaaGlxaWFuZy5Ib3VAbnhwLmNvbT4NCg0KVGhlcmUgYXJlIHNv
bWUgOC1iaXQgYW5kIDE2LWJpdCByZWdpc3RlcnMgaW4gUENJZSBjb25maWd1cmF0aW9uDQpzcGFj
ZSwgc28gYWRkIHRoZXNlIGFjY2Vzc29ycyBhY2NvcmRpbmdseS4NCg0KU2lnbmVkLW9mZi1ieTog
SG91IFpoaXFpYW5nIDxaaGlxaWFuZy5Ib3VAbnhwLmNvbT4NClJldmlld2VkLWJ5OiBNaW5naHVh
biBMaWFuIDxNaW5naHVhbi5MaWFuQG54cC5jb20+DQpSZXZpZXdlZC1ieTogU3VicmFobWFueWEg
TGluZ2FwcGEgPGwuc3VicmFobWFueWFAbW9iaXZlaWwuY28uaW4+DQotLS0NClY3Og0KIC0gTmV3
IHBhdGNoIG1vdmVkIGZyb20gdGhlIGZpeGVzIHNlcmllcy4NCg0KIC4uLi9wY2kvY29udHJvbGxl
ci9tb2JpdmVpbC9wY2llLW1vYml2ZWlsLmggICB8IDIwICsrKysrKysrKysrKysrKysrKysNCiAx
IGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9w
Y2kvY29udHJvbGxlci9tb2JpdmVpbC9wY2llLW1vYml2ZWlsLmggYi9kcml2ZXJzL3BjaS9jb250
cm9sbGVyL21vYml2ZWlsL3BjaWUtbW9iaXZlaWwuaA0KaW5kZXggMTU5YjAxNDJhMmJjLi5hNzI5
YTRmODc5ZmUgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL21vYml2ZWlsL3Bj
aWUtbW9iaXZlaWwuaA0KKysrIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9tb2JpdmVpbC9wY2ll
LW1vYml2ZWlsLmgNCkBAIC0xODUsOSArMTg1LDI5IEBAIHN0YXRpYyBpbmxpbmUgdTMyIGNzcl9y
ZWFkbChzdHJ1Y3QgbW9iaXZlaWxfcGNpZSAqcGNpZSwgdTMyIG9mZikNCiAJcmV0dXJuIGNzcl9y
ZWFkKHBjaWUsIG9mZiwgMHg0KTsNCiB9DQogDQorc3RhdGljIGlubGluZSB1MzIgY3NyX3JlYWR3
KHN0cnVjdCBtb2JpdmVpbF9wY2llICpwY2llLCB1MzIgb2ZmKQ0KK3sNCisJcmV0dXJuIGNzcl9y
ZWFkKHBjaWUsIG9mZiwgMHgyKTsNCit9DQorDQorc3RhdGljIGlubGluZSB1MzIgY3NyX3JlYWRi
KHN0cnVjdCBtb2JpdmVpbF9wY2llICpwY2llLCB1MzIgb2ZmKQ0KK3sNCisJcmV0dXJuIGNzcl9y
ZWFkKHBjaWUsIG9mZiwgMHgxKTsNCit9DQorDQogc3RhdGljIGlubGluZSB2b2lkIGNzcl93cml0
ZWwoc3RydWN0IG1vYml2ZWlsX3BjaWUgKnBjaWUsIHUzMiB2YWwsIHUzMiBvZmYpDQogew0KIAlj
c3Jfd3JpdGUocGNpZSwgdmFsLCBvZmYsIDB4NCk7DQogfQ0KIA0KK3N0YXRpYyBpbmxpbmUgdm9p
ZCBjc3Jfd3JpdGV3KHN0cnVjdCBtb2JpdmVpbF9wY2llICpwY2llLCB1MzIgdmFsLCB1MzIgb2Zm
KQ0KK3sNCisJY3NyX3dyaXRlKHBjaWUsIHZhbCwgb2ZmLCAweDIpOw0KK30NCisNCitzdGF0aWMg
aW5saW5lIHZvaWQgY3NyX3dyaXRlYihzdHJ1Y3QgbW9iaXZlaWxfcGNpZSAqcGNpZSwgdTMyIHZh
bCwgdTMyIG9mZikNCit7DQorCWNzcl93cml0ZShwY2llLCB2YWwsIG9mZiwgMHgxKTsNCit9DQor
DQogI2VuZGlmIC8qIF9QQ0lFX01PQklWRUlMX0ggKi8NCi0tIA0KMi4xNy4xDQoNCg==

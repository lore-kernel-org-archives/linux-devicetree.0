From: "Z.q. Hou" <zhiqiang.hou@nxp.com>
Subject: [PATCHv5 03/20] PCI: mobiveil: Correct the returned error number
Date: Fri, 12 Apr 2019 08:35:30 +0000
Message-ID: <20190412083635.33626-4-Zhiqiang.Hou@nxp.com>
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

RnJvbTogSG91IFpoaXFpYW5nIDxaaGlxaWFuZy5Ib3VAbnhwLmNvbT4NCg0KVGhpcyBwYXRjaCBj
b3JyZWN0cyB0aGUgcmV0dXJuZWQgZXJyb3IgbnVtYmVyIGJ5IGNvbnZlbnRpb24sDQphbmQgcmVt
b3ZlcyBhbiB1bm5lY2Vzc2FyeSBlcnJvciBjaGVjay4NCg0KU2lnbmVkLW9mZi1ieTogSG91IFpo
aXFpYW5nIDxaaGlxaWFuZy5Ib3VAbnhwLmNvbT4NClJldmlld2VkLWJ5OiBNaW5naHVhbiBMaWFu
IDxNaW5naHVhbi5MaWFuQG54cC5jb20+DQpSZXZpZXdlZC1ieTogU3VicmFobWFueWEgTGluZ2Fw
cGEgPGwuc3VicmFobWFueWFAbW9iaXZlaWwuY28uaW4+DQotLS0NClY1Og0KIC0gQ29ycmVjdGVk
IGFuZCByZXRvdWNoZWQgdGhlIHN1YmplY3QgYW5kIGNoYW5nZWxvZy4NCg0KIGRyaXZlcnMvcGNp
L2NvbnRyb2xsZXIvcGNpZS1tb2JpdmVpbC5jIHwgOCArKystLS0tLQ0KIDEgZmlsZSBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJz
L3BjaS9jb250cm9sbGVyL3BjaWUtbW9iaXZlaWwuYyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIv
cGNpZS1tb2JpdmVpbC5jDQppbmRleCBiODc0NzFmMDhhNDAuLjU2MzIxMGU3MzFkMyAxMDA2NDQN
Ci0tLSBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpZS1tb2JpdmVpbC5jDQorKysgYi9kcml2
ZXJzL3BjaS9jb250cm9sbGVyL3BjaWUtbW9iaXZlaWwuYw0KQEAgLTgxOSw3ICs4MTksNyBAQCBz
dGF0aWMgaW50IG1vYml2ZWlsX3BjaWVfaW5pdF9pcnFfZG9tYWluKHN0cnVjdCBtb2JpdmVpbF9w
Y2llICpwY2llKQ0KIA0KIAlpZiAoIXBjaWUtPmludHhfZG9tYWluKSB7DQogCQlkZXZfZXJyKGRl
diwgIkZhaWxlZCB0byBnZXQgYSBJTlR4IElSUSBkb21haW5cbiIpOw0KLQkJcmV0dXJuIC1FTk9E
RVY7DQorCQlyZXR1cm4gLUVOT01FTTsNCiAJfQ0KIA0KIAlyYXdfc3Bpbl9sb2NrX2luaXQoJnBj
aWUtPmludHhfbWFza19sb2NrKTsNCkBAIC04NDUsMTEgKzg0NSw5IEBAIHN0YXRpYyBpbnQgbW9i
aXZlaWxfcGNpZV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KIAkvKiBhbGxv
Y2F0ZSB0aGUgUENJZSBwb3J0ICovDQogCWJyaWRnZSA9IGRldm1fcGNpX2FsbG9jX2hvc3RfYnJp
ZGdlKGRldiwgc2l6ZW9mKCpwY2llKSk7DQogCWlmICghYnJpZGdlKQ0KLQkJcmV0dXJuIC1FTk9E
RVY7DQorCQlyZXR1cm4gLUVOT01FTTsNCiANCiAJcGNpZSA9IHBjaV9ob3N0X2JyaWRnZV9wcml2
KGJyaWRnZSk7DQotCWlmICghcGNpZSkNCi0JCXJldHVybiAtRU5PTUVNOw0KIA0KIAlwY2llLT5w
ZGV2ID0gcGRldjsNCiANCkBAIC04NjYsNyArODY0LDcgQEAgc3RhdGljIGludCBtb2JpdmVpbF9w
Y2llX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQogCQkJCQkJICAgICZwY2ll
LT5yZXNvdXJjZXMsICZpb2Jhc2UpOw0KIAlpZiAocmV0KSB7DQogCQlkZXZfZXJyKGRldiwgIkdl
dHRpbmcgYnJpZGdlIHJlc291cmNlcyBmYWlsZWRcbiIpOw0KLQkJcmV0dXJuIC1FTk9NRU07DQor
CQlyZXR1cm4gcmV0Ow0KIAl9DQogDQogCS8qDQotLSANCjIuMTcuMQ0KDQo=

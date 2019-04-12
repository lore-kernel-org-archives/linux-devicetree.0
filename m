From: "Z.q. Hou" <zhiqiang.hou@nxp.com>
Subject: [PATCHv5 13/20] PCI: mobiveil: Move IRQ chained handler setup out of
 DT parse
Date: Fri, 12 Apr 2019 08:36:30 +0000
Message-ID: <20190412083635.33626-14-Zhiqiang.Hou@nxp.com>
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

RnJvbTogSG91IFpoaXFpYW5nIDxaaGlxaWFuZy5Ib3VAbnhwLmNvbT4NCg0KTW92ZSBpcnFfc2V0
X2NoYWluZWRfaGFuZGxlcl9hbmRfZGF0YSgpIG91dCBvZiBEVCBwYXJzZSBmdW5jdGlvbi4NCg0K
U2lnbmVkLW9mZi1ieTogSG91IFpoaXFpYW5nIDxaaGlxaWFuZy5Ib3VAbnhwLmNvbT4NClJldmll
d2VkLWJ5OiBNaW5naHVhbiBMaWFuIDxNaW5naHVhbi5MaWFuQG54cC5jb20+DQpSZXZpZXdlZC1i
eTogU3VicmFobWFueWEgTGluZ2FwcGEgPGwuc3VicmFobWFueWFAbW9iaXZlaWwuY28uaW4+DQot
LS0NClY1Og0KIC0gQ29ycmVjdGVkIHRoZSBzdWJqZWN0Lg0KDQogZHJpdmVycy9wY2kvY29udHJv
bGxlci9wY2llLW1vYml2ZWlsLmMgfCA0ICsrLS0NCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9wY2kvY29udHJv
bGxlci9wY2llLW1vYml2ZWlsLmMgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaWUtbW9iaXZl
aWwuYw0KaW5kZXggYzI4NDhjMjJiNDY2Li5kYjdlY2IwMjFjNjMgMTAwNjQ0DQotLS0gYS9kcml2
ZXJzL3BjaS9jb250cm9sbGVyL3BjaWUtbW9iaXZlaWwuYw0KKysrIGIvZHJpdmVycy9wY2kvY29u
dHJvbGxlci9wY2llLW1vYml2ZWlsLmMNCkBAIC00NjAsOCArNDYwLDYgQEAgc3RhdGljIGludCBt
b2JpdmVpbF9wY2llX3BhcnNlX2R0KHN0cnVjdCBtb2JpdmVpbF9wY2llICpwY2llKQ0KIAkJcmV0
dXJuIC1FTk9ERVY7DQogCX0NCiANCi0JaXJxX3NldF9jaGFpbmVkX2hhbmRsZXJfYW5kX2RhdGEo
cGNpZS0+aXJxLCBtb2JpdmVpbF9wY2llX2lzciwgcGNpZSk7DQotDQogCXJldHVybiAwOw0KIH0N
CiANCkBAIC05MDIsNiArOTAwLDggQEAgc3RhdGljIGludCBtb2JpdmVpbF9wY2llX3Byb2JlKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQogCQlnb3RvIGVycm9yOw0KIAl9DQogDQorCWly
cV9zZXRfY2hhaW5lZF9oYW5kbGVyX2FuZF9kYXRhKHBjaWUtPmlycSwgbW9iaXZlaWxfcGNpZV9p
c3IsIHBjaWUpOw0KKw0KIAlyZXQgPSBkZXZtX3JlcXVlc3RfcGNpX2J1c19yZXNvdXJjZXMoZGV2
LCAmcGNpZS0+cmVzb3VyY2VzKTsNCiAJaWYgKHJldCkNCiAJCWdvdG8gZXJyb3I7DQotLSANCjIu
MTcuMQ0KDQo=

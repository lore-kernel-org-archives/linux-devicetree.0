From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH V2 1/4] dt-bindings: fsl: scu: add watchdog binding
Date: Sun, 28 Apr 2019 03:27:00 +0000
Message-ID: <1556421727-7401-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "wim@linux-watchdog.org" <wim@linux-watchdog.org>, "linux@roeck-us.net" <linux@roeck-us.net>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, Aisheng Dong <aisheng.dong@nxp.com>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, Peng Fan <peng.fan@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm->
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

aS5NWCBzeXN0ZW0gY29udHJvbGxlciB3YXRjaGRvZyBoYXMgcHJldGltZW91dCBmdW5jdGlvbiB3
aGljaA0KZGVwZW5kcyBvbiBpLk1YIFNDVSBkcml2ZXIsIHNvIHdhdGNoZG9nIERUIG5vZGUgbmVl
ZHMgdG8gYmUNCnN1Ym5vZGUgb2YgU0NVLCB0aGlzIHBhdGNoIGFkZHMgaS5NWCBzeXN0ZW0gY29u
dHJvbGxlciB3YXRjaGRvZw0KYmluZGluZyB0byBTQ1UgYmluZGluZyBkb2MuDQoNClNpZ25lZC1v
ZmYtYnk6IEFuc29uIEh1YW5nIDxBbnNvbi5IdWFuZ0BueHAuY29tPg0KLS0tDQpOZXcgcGF0Y2gu
DQotLS0NCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vZnJlZXNjYWxlL2ZzbCxzY3UudHh0
ICAgICAgICAgfCAxNSArKysrKysrKysrKysrKysNCiAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0
aW9ucygrKQ0KDQpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2FybS9mcmVlc2NhbGUvZnNsLHNjdS50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvYXJtL2ZyZWVzY2FsZS9mc2wsc2N1LnR4dA0KaW5kZXggNWQ3ZGJhYi4uMWI1NjU1NyAx
MDA2NDQNCi0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vZnJlZXNj
YWxlL2ZzbCxzY3UudHh0DQorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
YXJtL2ZyZWVzY2FsZS9mc2wsc2N1LnR4dA0KQEAgLTEzMyw2ICsxMzMsMTYgQEAgUlRDIGJpbmRp
bmdzIGJhc2VkIG9uIFNDVSBNZXNzYWdlIFByb3RvY29sDQogUmVxdWlyZWQgcHJvcGVydGllczoN
CiAtIGNvbXBhdGlibGU6IHNob3VsZCBiZSAiZnNsLGlteDhxeHAtc2MtcnRjIjsNCiANCitXYXRj
aGRvZyBiaW5kaW5ncyBiYXNlZCBvbiBTQ1UgTWVzc2FnZSBQcm90b2NvbA0KKy0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KKw0KK1Jl
cXVpcmVkIHByb3BlcnRpZXM6DQorLSBjb21wYXRpYmxlOiBzaG91bGQgYmU6DQorICAgICAgICAg
ICAgICAiZnNsLGlteDhxeHAtc2Mtd2R0Ig0KKyAgICAgICAgICAgICAgZm9sbG93ZWQgYnkgImZz
bCxpbXgtc2Mtd2R0IjsNCitPcHRpb25hbCBwcm9wZXJ0aWVzOg0KKy0gdGltZW91dC1zZWM6IGNv
bnRhaW5zIHRoZSB3YXRjaGRvZyB0aW1lb3V0IGluIHNlY29uZHMuDQorDQogRXhhbXBsZSAoaW14
OHF4cCk6DQogLS0tLS0tLS0tLS0tLQ0KIGFsaWFzZXMgew0KQEAgLTE4NSw2ICsxOTUsMTEgQEAg
ZmlybXdhcmUgew0KIAkJcnRjOiBydGMgew0KIAkJCWNvbXBhdGlibGUgPSAiZnNsLGlteDhxeHAt
c2MtcnRjIjsNCiAJCX07DQorDQorCQl3YXRjaGRvZyB7DQorCQkJY29tcGF0aWJsZSA9ICJmc2ws
aW14OHF4cC1zYy13ZHQiLCAiZnNsLGlteC1zYy13ZHQiOw0KKwkJCXRpbWVvdXQtc2VjID0gPDYw
PjsNCisJCX07DQogCX07DQogfTsNCiANCi0tIA0KMi43LjQNCg0K

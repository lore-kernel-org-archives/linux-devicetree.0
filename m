Return-Path: <SRS0=9N3P=SS=nxp.com=anson.huang@kernel.org>
From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH V12 1/5] dt-bindings: fsl: scu: add thermal binding
Date: Tue, 16 Apr 2019 03:22:09 +0000
Message-ID: <1555384609-7030-1-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "rui.zhang@intel.com" <rui.zhang@intel.com>, "edubezval@gmail.com" <edubezval@gmail.com>, "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, Aisheng Dong <aisheng.dong@nxp.com>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, Daniel Baluta <daniel.baluta@nxp.com>, Peng Fan <peng.fan@nxp.com>, "heiko@sntech.de" <heiko@sntech.de>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "agross@kernel.org" <agross@kernel.org>, "olof@lixom.net" <olof@lixom.net>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "jagan@amarulasolutions.com" <jagan@amarulasolutions.com>, "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>, "marc.w.gonzalez@free.fr" <marc.w.gonzalez@free.fr>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

TlhQIGkuTVg4UVhQIGlzIGFuIEFSTXY4IFNvQyB3aXRoIGEgQ29ydGV4LU00IGNvcmUgaW5zaWRl
IGFzDQpzeXN0ZW0gY29udHJvbGxlciwgdGhlIHN5c3RlbSBjb250cm9sbGVyIGlzIGluIGNoYXJn
ZSBvZiBzeXN0ZW0NCnBvd2VyLCBjbG9jayBhbmQgdGhlcm1hbCBzZW5zb3JzIGV0Yy4gbWFuYWdl
bWVudCwgTGludXgga2VybmVsDQpoYXMgdG8gY29tbXVuaWNhdGUgd2l0aCBzeXN0ZW0gY29udHJv
bGxlciB2aWEgTVUgKG1lc3NhZ2UgdW5pdCkNCklQQyB0byBnZXQgdGVtcGVyYXR1cmUgZnJvbSB0
aGVybWFsIHNlbnNvcnMsIHRoaXMgcGF0Y2ggYWRkcw0KYmluZGluZyBkb2MgZm9yIGkuTVggc3lz
dGVtIGNvbnRyb2xsZXIgdGhlcm1hbCBkcml2ZXIuDQoNClNpZ25lZC1vZmYtYnk6IEFuc29uIEh1
YW5nIDxBbnNvbi5IdWFuZ0BueHAuY29tPg0KLS0tDQpObyBjaGFuZ2VzLg0KLS0tDQogLi4uL2Rl
dmljZXRyZWUvYmluZGluZ3MvYXJtL2ZyZWVzY2FsZS9mc2wsc2N1LnR4dCAgICAgICAgfCAxNiAr
KysrKysrKysrKysrKysrDQogMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKykNCg0KZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vZnJlZXNjYWxl
L2ZzbCxzY3UudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9mcmVl
c2NhbGUvZnNsLHNjdS50eHQNCmluZGV4IDVkN2RiYWIuLmY0ZmI2ZDUgMTAwNjQ0DQotLS0gYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2ZyZWVzY2FsZS9mc2wsc2N1LnR4
dA0KKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9mcmVlc2NhbGUv
ZnNsLHNjdS50eHQNCkBAIC0xMzMsNiArMTMzLDE3IEBAIFJUQyBiaW5kaW5ncyBiYXNlZCBvbiBT
Q1UgTWVzc2FnZSBQcm90b2NvbA0KIFJlcXVpcmVkIHByb3BlcnRpZXM6DQogLSBjb21wYXRpYmxl
OiBzaG91bGQgYmUgImZzbCxpbXg4cXhwLXNjLXJ0YyI7DQogDQorVGhlcm1hbCBiaW5kaW5ncyBi
YXNlZCBvbiBTQ1UgTWVzc2FnZSBQcm90b2NvbA0KKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KKw0KK1JlcXVpcmVkIHByb3BlcnRp
ZXM6DQorLSBjb21wYXRpYmxlOgkJCVNob3VsZCBiZSA6DQorCQkJCSAgImZzbCxpbXg4cXhwLXNj
LXRoZXJtYWwiDQorCQkJCWZvbGxvd2VkIGJ5ICJmc2wsaW14LXNjLXRoZXJtYWwiOw0KKw0KKy0g
I3RoZXJtYWwtc2Vuc29yLWNlbGxzOglTZWUgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3RoZXJtYWwvdGhlcm1hbC50eHQNCisJCQkJZm9yIGEgZGVzY3JpcHRpb24uDQorDQogRXhh
bXBsZSAoaW14OHF4cCk6DQogLS0tLS0tLS0tLS0tLQ0KIGFsaWFzZXMgew0KQEAgLTE4NSw2ICsx
OTYsMTEgQEAgZmlybXdhcmUgew0KIAkJcnRjOiBydGMgew0KIAkJCWNvbXBhdGlibGUgPSAiZnNs
LGlteDhxeHAtc2MtcnRjIjsNCiAJCX07DQorDQorCQl0c2VuczogdGhlcm1hbC1zZW5zb3Igew0K
KwkJCWNvbXBhdGlibGUgPSAiZnNsLGlteDhxeHAtc2MtdGhlcm1hbCIsICJmc2wsaW14LXNjLXRo
ZXJtYWwiOw0KKwkJCSN0aGVybWFsLXNlbnNvci1jZWxscyA9IDwxPjsNCisJCX07DQogCX07DQog
fTsNCiANCi0tIA0KMi43LjQNCg0K

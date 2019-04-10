Return-Path: <SRS0=NnWQ=SM=nxp.com=anson.huang@kernel.org>
From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH V11 1/4] dt-bindings: fsl: scu: add thermal binding
Date: Wed, 10 Apr 2019 06:01:22 +0000
Message-ID: <1554875779-19727-1-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "rui.zhang@intel.com" <rui.zhang@intel.com>, "edubezval@gmail.com" <edubezval@gmail.com>, "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, Aisheng Dong <aisheng.dong@nxp.com>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, Peng Fan <peng.fan@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "heiko@sntech.de" <heiko@sntech.de>, Andy Gross <andy.gross@linaro.org>, "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "jagan@amarulasolutions.com" <jagan@amarulasolutions.com>, "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>, "ezequiel@collabora.com" <ezequiel@collabora.com>, "stefan.wahren@i2se.com" <stefan.wahren@i2se.com>, "marc.w.gonzalez@free.fr" <marc.w.gonzalez@free.fr>, "olof@lixom.net" <olof@lixom.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

TlhQIGkuTVg4UVhQIGlzIGFuIEFSTXY4IFNvQyB3aXRoIGEgQ29ydGV4LU00IGNvcmUgaW5zaWRl
IGFzDQpzeXN0ZW0gY29udHJvbGxlciwgdGhlIHN5c3RlbSBjb250cm9sbGVyIGlzIGluIGNoYXJn
ZSBvZiBzeXN0ZW0NCnBvd2VyLCBjbG9jayBhbmQgdGhlcm1hbCBzZW5zb3JzIGV0Yy4gbWFuYWdl
bWVudCwgTGludXgga2VybmVsDQpoYXMgdG8gY29tbXVuaWNhdGUgd2l0aCBzeXN0ZW0gY29udHJv
bGxlciB2aWEgTVUgKG1lc3NhZ2UgdW5pdCkNCklQQyB0byBnZXQgdGVtcGVyYXR1cmUgZnJvbSB0
aGVybWFsIHNlbnNvcnMsIHRoaXMgcGF0Y2ggYWRkcw0KYmluZGluZyBkb2MgZm9yIGkuTVggc3lz
dGVtIGNvbnRyb2xsZXIgdGhlcm1hbCBkcml2ZXIuDQoNClNpZ25lZC1vZmYtYnk6IEFuc29uIEh1
YW5nIDxBbnNvbi5IdWFuZ0BueHAuY29tPg0KLS0tDQpDaGFuZ2VzIHNpbmNlIFYxMDoNCgktIHJl
bW92ZSBwcm9wZXJ0eSAiaW14LHNlbnNvci1yZXNvdXJjZS1pZCIuDQotLQ0KIC4uLi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2FybS9mcmVlc2NhbGUvZnNsLHNjdS50eHQgICAgICAgIHwgMTYgKysrKysr
KysrKysrKysrKw0KIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2ZyZWVzY2FsZS9mc2ws
c2N1LnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vZnJlZXNjYWxl
L2ZzbCxzY3UudHh0DQppbmRleCA1ZDdkYmFiLi5mNGZiNmQ1IDEwMDY0NA0KLS0tIGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9mcmVlc2NhbGUvZnNsLHNjdS50eHQNCisr
KyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vZnJlZXNjYWxlL2ZzbCxz
Y3UudHh0DQpAQCAtMTMzLDYgKzEzMywxNyBAQCBSVEMgYmluZGluZ3MgYmFzZWQgb24gU0NVIE1l
c3NhZ2UgUHJvdG9jb2wNCiBSZXF1aXJlZCBwcm9wZXJ0aWVzOg0KIC0gY29tcGF0aWJsZTogc2hv
dWxkIGJlICJmc2wsaW14OHF4cC1zYy1ydGMiOw0KIA0KK1RoZXJtYWwgYmluZGluZ3MgYmFzZWQg
b24gU0NVIE1lc3NhZ2UgUHJvdG9jb2wNCistLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCisNCitSZXF1aXJlZCBwcm9wZXJ0aWVzOg0K
Ky0gY29tcGF0aWJsZToJCQlTaG91bGQgYmUgOg0KKwkJCQkgICJmc2wsaW14OHF4cC1zYy10aGVy
bWFsIg0KKwkJCQlmb2xsb3dlZCBieSAiZnNsLGlteC1zYy10aGVybWFsIjsNCisNCistICN0aGVy
bWFsLXNlbnNvci1jZWxsczoJU2VlIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90
aGVybWFsL3RoZXJtYWwudHh0DQorCQkJCWZvciBhIGRlc2NyaXB0aW9uLg0KKw0KIEV4YW1wbGUg
KGlteDhxeHApOg0KIC0tLS0tLS0tLS0tLS0NCiBhbGlhc2VzIHsNCkBAIC0xODUsNiArMTk2LDEx
IEBAIGZpcm13YXJlIHsNCiAJCXJ0YzogcnRjIHsNCiAJCQljb21wYXRpYmxlID0gImZzbCxpbXg4
cXhwLXNjLXJ0YyI7DQogCQl9Ow0KKw0KKwkJdHNlbnM6IHRoZXJtYWwtc2Vuc29yIHsNCisJCQlj
b21wYXRpYmxlID0gImZzbCxpbXg4cXhwLXNjLXRoZXJtYWwiLCAiZnNsLGlteC1zYy10aGVybWFs
IjsNCisJCQkjdGhlcm1hbC1zZW5zb3ItY2VsbHMgPSA8MT47DQorCQl9Ow0KIAl9Ow0KIH07DQog
DQotLSANCjIuNy40DQoNCg==

Return-Path: <SRS0=NnWQ=SM=nxp.com=anson.huang@kernel.org>
From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH RESEND V11 1/4] dt-bindings: fsl: scu: add thermal binding
Date: Wed, 10 Apr 2019 07:43:04 +0000
Message-ID: <1554881866-26333-1-git-send-email-Anson.Huang@nxp.com>
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
bW92ZSBwcm9wZXJ0eSAiaW14LHNlbnNvci1yZXNvdXJjZS1pZCIuDQotLS0NCiAuLi4vZGV2aWNl
dHJlZS9iaW5kaW5ncy9hcm0vZnJlZXNjYWxlL2ZzbCxzY3UudHh0ICAgICAgICB8IDE2ICsrKysr
KysrKysrKysrKysNCiAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKQ0KDQpkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9mcmVlc2NhbGUvZnNs
LHNjdS50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2ZyZWVzY2Fs
ZS9mc2wsc2N1LnR4dA0KaW5kZXggNzJkNDgxYy4uMDIzZmI1YyAxMDA2NDQNCi0tLSBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vZnJlZXNjYWxlL2ZzbCxzY3UudHh0DQor
KysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2ZyZWVzY2FsZS9mc2ws
c2N1LnR4dA0KQEAgLTEyMiw2ICsxMjIsMTcgQEAgUlRDIGJpbmRpbmdzIGJhc2VkIG9uIFNDVSBN
ZXNzYWdlIFByb3RvY29sDQogUmVxdWlyZWQgcHJvcGVydGllczoNCiAtIGNvbXBhdGlibGU6IHNo
b3VsZCBiZSAiZnNsLGlteDhxeHAtc2MtcnRjIjsNCiANCitUaGVybWFsIGJpbmRpbmdzIGJhc2Vk
IG9uIFNDVSBNZXNzYWdlIFByb3RvY29sDQorLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQorDQorUmVxdWlyZWQgcHJvcGVydGllczoN
CistIGNvbXBhdGlibGU6CQkJU2hvdWxkIGJlIDoNCisJCQkJICAiZnNsLGlteDhxeHAtc2MtdGhl
cm1hbCINCisJCQkJZm9sbG93ZWQgYnkgImZzbCxpbXgtc2MtdGhlcm1hbCI7DQorDQorLSAjdGhl
cm1hbC1zZW5zb3ItY2VsbHM6CVNlZSBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
dGhlcm1hbC90aGVybWFsLnR4dA0KKwkJCQlmb3IgYSBkZXNjcmlwdGlvbi4NCisNCiBFeGFtcGxl
IChpbXg4cXhwKToNCiAtLS0tLS0tLS0tLS0tDQogbHNpb19tdTE6IG1haWxib3hANWQxYzAwMDAg
ew0KQEAgLTE2OCw2ICsxNzksMTEgQEAgZmlybXdhcmUgew0KIAkJcnRjOiBydGMgew0KIAkJCWNv
bXBhdGlibGUgPSAiZnNsLGlteDhxeHAtc2MtcnRjIjsNCiAJCX07DQorDQorCQl0c2VuczogdGhl
cm1hbC1zZW5zb3Igew0KKwkJCWNvbXBhdGlibGUgPSAiZnNsLGlteDhxeHAtc2MtdGhlcm1hbCIs
ICJmc2wsaW14LXNjLXRoZXJtYWwiOw0KKwkJCSN0aGVybWFsLXNlbnNvci1jZWxscyA9IDwxPjsN
CisJCX07DQogCX07DQogfTsNCiANCi0tIA0KMi43LjQNCg0K

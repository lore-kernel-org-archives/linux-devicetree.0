Return-Path: <SRS0=NnWQ=SM=nxp.com=anson.huang@kernel.org>
From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH RESEND V11 4/4] arm64: dts: imx: add i.MX8QXP thermal support
Date: Wed, 10 Apr 2019 07:43:31 +0000
Message-ID: <1554881866-26333-4-git-send-email-Anson.Huang@nxp.com>
References: <1554881866-26333-1-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1554881866-26333-1-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "rui.zhang@intel.com" <rui.zhang@intel.com>, "edubezval@gmail.com" <edubezval@gmail.com>, "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, Aisheng Dong <aisheng.dong@nxp.com>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, Peng Fan <peng.fan@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "heiko@sntech.de" <heiko@sntech.de>, Andy Gross <andy.gross@linaro.org>, "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "jagan@amarulasolutions.com" <jagan@amarulasolutions.com>, "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>, "ezequiel@collabora.com" <ezequiel@collabora.com>, "stefan.wahren@i2se.com" <stefan.wahren@i2se.com>, "marc.w.gonzalez@free.fr" <marc.w.gonzalez@free.fr>, "olof@lixom.net" <olof@lixom.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

QWRkIGkuTVg4UVhQIENQVSB0aGVybWFsIHpvbmUgc3VwcG9ydC4NCg0KU2lnbmVkLW9mZi1ieTog
QW5zb24gSHVhbmcgPEFuc29uLkh1YW5nQG54cC5jb20+DQotLS0NCkNoYW5nZXMgc2luY2UgVjEw
Og0KCS0gcmVtb3ZlIHByb3BlcnR5ICJpbXgsc2Vuc29yLXJlc291cmNlLWlkIiBhbmQgcHV0IEhX
IHJlc291cmNlIElEIGluc2lkZSBlYWNoDQoJICB0aGVybWFsLXNlbnNvcnMnIHBoYW5kbGUgYXJn
dW1lbnQuDQotLS0NCiBhcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4cXhwLmR0c2kg
fCAzMyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCiAxIGZpbGUgY2hhbmdlZCwgMzMg
aW5zZXJ0aW9ucygrKQ0KDQpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2Nh
bGUvaW14OHF4cC5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OHF4cC5k
dHNpDQppbmRleCA3MGVmM2RiLi5jYzFkODc3IDEwMDY0NA0KLS0tIGEvYXJjaC9hcm02NC9ib290
L2R0cy9mcmVlc2NhbGUvaW14OHF4cC5kdHNpDQorKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2Zy
ZWVzY2FsZS9pbXg4cXhwLmR0c2kNCkBAIC0xMCw2ICsxMCw3IEBADQogI2luY2x1ZGUgPGR0LWJp
bmRpbmdzL2dwaW8vZ3Bpby5oPg0KICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1cHQtY29u
dHJvbGxlci9hcm0tZ2ljLmg+DQogI2luY2x1ZGUgPGR0LWJpbmRpbmdzL3BpbmN0cmwvcGFkcy1p
bXg4cXhwLmg+DQorI2luY2x1ZGUgPGR0LWJpbmRpbmdzL3RoZXJtYWwvdGhlcm1hbC5oPg0KIA0K
IC8gew0KIAlpbnRlcnJ1cHQtcGFyZW50ID0gPCZnaWM+Ow0KQEAgLTE0OSw2ICsxNTAsMTEgQEAN
CiAJCXJ0YzogcnRjIHsNCiAJCQljb21wYXRpYmxlID0gImZzbCxpbXg4cXhwLXNjLXJ0YyI7DQog
CQl9Ow0KKw0KKwkJdHNlbnM6IHRoZXJtYWwtc2Vuc29yIHsNCisJCQljb21wYXRpYmxlID0gImZz
bCxpbXg4cXhwLXNjLXRoZXJtYWwiLCAiZnNsLGlteC1zYy10aGVybWFsIjsNCisJCQkjdGhlcm1h
bC1zZW5zb3ItY2VsbHMgPSA8MT47DQorCQl9Ow0KIAl9Ow0KIA0KIAl0aW1lciB7DQpAQCAtNDg0
LDQgKzQ5MCwzMSBAQA0KIAkJCXBvd2VyLWRvbWFpbnMgPSA8JnBkIElNWF9TQ19SX0dQSU9fNz47
DQogCQl9Ow0KIAl9Ow0KKw0KKwl0aGVybWFsX3pvbmVzOiB0aGVybWFsLXpvbmVzIHsNCisJCWNw
dS10aGVybWFsMCB7DQorCQkJcG9sbGluZy1kZWxheS1wYXNzaXZlID0gPDI1MD47DQorCQkJcG9s
bGluZy1kZWxheSA9IDwyMDAwPjsNCisJCQl0aGVybWFsLXNlbnNvcnMgPSA8JnRzZW5zIElNWF9T
Q19SX1NZU1RFTT47DQorCQkJdHJpcHMgew0KKwkJCQljcHVfYWxlcnQwOiB0cmlwMCB7DQorCQkJ
CQl0ZW1wZXJhdHVyZSA9IDwxMDcwMDA+Ow0KKwkJCQkJaHlzdGVyZXNpcyA9IDwyMDAwPjsNCisJ
CQkJCXR5cGUgPSAicGFzc2l2ZSI7DQorCQkJCX07DQorCQkJCWNwdV9jcml0MDogdHJpcDEgew0K
KwkJCQkJdGVtcGVyYXR1cmUgPSA8MTI3MDAwPjsNCisJCQkJCWh5c3RlcmVzaXMgPSA8MjAwMD47
DQorCQkJCQl0eXBlID0gImNyaXRpY2FsIjsNCisJCQkJfTsNCisJCQl9Ow0KKwkJCWNvb2xpbmct
bWFwcyB7DQorCQkJCW1hcDAgew0KKwkJCQkJdHJpcCA9IDwmY3B1X2FsZXJ0MD47DQorCQkJCQlj
b29saW5nLWRldmljZSA9DQorCQkJCQkJPCZBMzVfMCBUSEVSTUFMX05PX0xJTUlUIFRIRVJNQUxf
Tk9fTElNSVQ+Ow0KKwkJCQl9Ow0KKwkJCX07DQorCQl9Ow0KKwl9Ow0KIH07DQotLSANCjIuNy40
DQoNCg==

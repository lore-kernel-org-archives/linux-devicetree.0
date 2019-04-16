Return-Path: <SRS0=9N3P=SS=nxp.com=anson.huang@kernel.org>
From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH V12 5/5] arm64: dts: imx: add i.MX8QXP thermal support
Date: Tue, 16 Apr 2019 03:22:41 +0000
Message-ID: <1555384609-7030-5-git-send-email-Anson.Huang@nxp.com>
References: <1555384609-7030-1-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1555384609-7030-1-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "rui.zhang@intel.com" <rui.zhang@intel.com>, "edubezval@gmail.com" <edubezval@gmail.com>, "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, Aisheng Dong <aisheng.dong@nxp.com>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, Daniel Baluta <daniel.baluta@nxp.com>, Peng Fan <peng.fan@nxp.com>, "heiko@sntech.de" <heiko@sntech.de>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "agross@kernel.org" <agross@kernel.org>, "olof@lixom.net" <olof@lixom.net>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "jagan@amarulasolutions.com" <jagan@amarulasolutions.com>, "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>, "marc.w.gonzalez@free.fr" <marc.w.gonzalez@free.fr>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

QWRkIGkuTVg4UVhQIENQVSB0aGVybWFsIHpvbmUgc3VwcG9ydC4NCg0KU2lnbmVkLW9mZi1ieTog
QW5zb24gSHVhbmcgPEFuc29uLkh1YW5nQG54cC5jb20+DQotLS0NCkNoYW5nZXMgc2luY2UgVjEx
Og0KCS0gYWRkIGNvb2xpbmcgZGV2aWNlIGZvciBhbGwgc2Vjb25kYXJ5IENQVXMuDQotLS0NCiBh
cmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4cXhwLmR0c2kgfCAzNyArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysNCiAxIGZpbGUgY2hhbmdlZCwgMzcgaW5zZXJ0aW9ucygrKQ0K
DQpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OHF4cC5kdHNp
IGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OHF4cC5kdHNpDQppbmRleCAwNjgz
ZWUyLi41ZWVhZGRjIDEwMDY0NA0KLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUv
aW14OHF4cC5kdHNpDQorKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4cXhw
LmR0c2kNCkBAIC0xMCw2ICsxMCw3IEBADQogI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2dwaW8vZ3Bp
by5oPg0KICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9hcm0tZ2lj
Lmg+DQogI2luY2x1ZGUgPGR0LWJpbmRpbmdzL3BpbmN0cmwvcGFkcy1pbXg4cXhwLmg+DQorI2lu
Y2x1ZGUgPGR0LWJpbmRpbmdzL3RoZXJtYWwvdGhlcm1hbC5oPg0KIA0KIC8gew0KIAlpbnRlcnJ1
cHQtcGFyZW50ID0gPCZnaWM+Ow0KQEAgLTE0OSw2ICsxNTAsMTEgQEANCiAJCXJ0YzogcnRjIHsN
CiAJCQljb21wYXRpYmxlID0gImZzbCxpbXg4cXhwLXNjLXJ0YyI7DQogCQl9Ow0KKw0KKwkJdHNl
bnM6IHRoZXJtYWwtc2Vuc29yIHsNCisJCQljb21wYXRpYmxlID0gImZzbCxpbXg4cXhwLXNjLXRo
ZXJtYWwiLCAiZnNsLGlteC1zYy10aGVybWFsIjsNCisJCQkjdGhlcm1hbC1zZW5zb3ItY2VsbHMg
PSA8MT47DQorCQl9Ow0KIAl9Ow0KIA0KIAl0aW1lciB7DQpAQCAtNTIyLDQgKzUyOCwzNSBAQA0K
IAkJY29tcGF0aWJsZSA9ICJmc2wsaW14OHF4cC1zYy13ZHQiLCAiZnNsLGlteC1zYy13ZHQiOw0K
IAkJdGltZW91dC1zZWMgPSA8NjA+Ow0KIAl9Ow0KKw0KKwl0aGVybWFsX3pvbmVzOiB0aGVybWFs
LXpvbmVzIHsNCisJCWNwdS10aGVybWFsMCB7DQorCQkJcG9sbGluZy1kZWxheS1wYXNzaXZlID0g
PDI1MD47DQorCQkJcG9sbGluZy1kZWxheSA9IDwyMDAwPjsNCisJCQl0aGVybWFsLXNlbnNvcnMg
PSA8JnRzZW5zIElNWF9TQ19SX1NZU1RFTT47DQorCQkJdHJpcHMgew0KKwkJCQljcHVfYWxlcnQw
OiB0cmlwMCB7DQorCQkJCQl0ZW1wZXJhdHVyZSA9IDwxMDcwMDA+Ow0KKwkJCQkJaHlzdGVyZXNp
cyA9IDwyMDAwPjsNCisJCQkJCXR5cGUgPSAicGFzc2l2ZSI7DQorCQkJCX07DQorCQkJCWNwdV9j
cml0MDogdHJpcDEgew0KKwkJCQkJdGVtcGVyYXR1cmUgPSA8MTI3MDAwPjsNCisJCQkJCWh5c3Rl
cmVzaXMgPSA8MjAwMD47DQorCQkJCQl0eXBlID0gImNyaXRpY2FsIjsNCisJCQkJfTsNCisJCQl9
Ow0KKwkJCWNvb2xpbmctbWFwcyB7DQorCQkJCW1hcDAgew0KKwkJCQkJdHJpcCA9IDwmY3B1X2Fs
ZXJ0MD47DQorCQkJCQljb29saW5nLWRldmljZSA9DQorCQkJCQkJPCZBMzVfMCBUSEVSTUFMX05P
X0xJTUlUIFRIRVJNQUxfTk9fTElNSVQ+LA0KKwkJCQkJCTwmQTM1XzEgVEhFUk1BTF9OT19MSU1J
VCBUSEVSTUFMX05PX0xJTUlUPiwNCisJCQkJCQk8JkEzNV8yIFRIRVJNQUxfTk9fTElNSVQgVEhF
Uk1BTF9OT19MSU1JVD4sDQorCQkJCQkJPCZBMzVfMyBUSEVSTUFMX05PX0xJTUlUIFRIRVJNQUxf
Tk9fTElNSVQ+Ow0KKw0KKwkJCQl9Ow0KKwkJCX07DQorCQl9Ow0KKwl9Ow0KIH07DQotLSANCjIu
Ny40DQoNCg==

From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH] ARM: dts: imx6ul: add clock-frequency to CPU node
Date: Tue, 7 May 2019 03:02:45 +0000
Message-ID: <1557197868-6963-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

QWRkIGNsb2NrLWZyZXF1ZW5jeSBwcm9wZXJ0eSB0byBDUFUgbm9kZS4gQXZvaWRzIHdhcm5pbmdz
IGxpa2UNCiIvY3B1cy9jcHVAMCBtaXNzaW5nIGNsb2NrLWZyZXF1ZW5jeSBwcm9wZXJ0eSIgZm9y
ICJhcm0sY29ydGV4LWE3Ii4NCg0KU2lnbmVkLW9mZi1ieTogQW5zb24gSHVhbmcgPEFuc29uLkh1
YW5nQG54cC5jb20+DQotLS0NCiBhcmNoL2FybS9ib290L2R0cy9pbXg2dWwuZHRzaSAgfCAxICsN
CiBhcmNoL2FybS9ib290L2R0cy9pbXg2dWxsLmR0c2kgfCAxICsNCiAyIGZpbGVzIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKQ0KDQpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvaW14NnVs
LmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9pbXg2dWwuZHRzaQ0KaW5kZXggYmJmMDEwYy4uZmMz
ODhiOCAxMDA2NDQNCi0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDZ1bC5kdHNpDQorKysgYi9h
cmNoL2FybS9ib290L2R0cy9pbXg2dWwuZHRzaQ0KQEAgLTU5LDYgKzU5LDcgQEANCiAJCQljb21w
YXRpYmxlID0gImFybSxjb3J0ZXgtYTciOw0KIAkJCWRldmljZV90eXBlID0gImNwdSI7DQogCQkJ
cmVnID0gPDA+Ow0KKwkJCWNsb2NrLWZyZXF1ZW5jeSA9IDw2OTYwMDAwMDA+Ow0KIAkJCWNsb2Nr
LWxhdGVuY3kgPSA8NjEwMzY+OyAvKiB0d28gQ0xLMzIgcGVyaW9kcyAqLw0KIAkJCSNjb29saW5n
LWNlbGxzID0gPDI+Ow0KIAkJCW9wZXJhdGluZy1wb2ludHMgPSA8DQpkaWZmIC0tZ2l0IGEvYXJj
aC9hcm0vYm9vdC9kdHMvaW14NnVsbC5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMvaW14NnVsbC5k
dHNpDQppbmRleCAyMmU0YTMwLi43MjdiOTJmIDEwMDY0NA0KLS0tIGEvYXJjaC9hcm0vYm9vdC9k
dHMvaW14NnVsbC5kdHNpDQorKysgYi9hcmNoL2FybS9ib290L2R0cy9pbXg2dWxsLmR0c2kNCkBA
IC0xMiw2ICsxMiw3IEBADQogL2RlbGV0ZS1ub2RlLyAmY3J5cHRvOw0KIA0KICZjcHUwIHsNCisJ
Y2xvY2stZnJlcXVlbmN5ID0gPDkwMDAwMDAwMD47DQogCW9wZXJhdGluZy1wb2ludHMgPSA8DQog
CQkvKiBrSHoJdVYgKi8NCiAJCTkwMDAwMAkxMjc1MDAwDQotLSANCjIuNy40DQoNCg==

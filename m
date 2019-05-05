From: Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 4/4] arm64: dts: imx: add i.MX8QXP ocotp support
Date: Sun, 5 May 2019 13:28:29 +0000
Message-ID: <20190505134130.28071-4-peng.fan@nxp.com>
References: <20190505134130.28071-1-peng.fan@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190505134130.28071-1-peng.fan@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "srinivas.kandagatla@linaro.org" <srinivas.kandagatla@linaro.org>
Cc: dl-linux-imx <linux-imx@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "van.freenix@gmail.com" <van.freenix@gmail.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Peng Fan <peng.fan@nxp.com>, Mark Rutland <mark.rutland@arm.com>, Aisheng Dong <aisheng.dong@nxp.com>, Anson Huang <anson.huang@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>
List-Id: devicetree@vger.kernel.org

QWRkIGkuTVg4UVhQIG9jb3RwIG5vZGUNCg0KU2lnbmVkLW9mZi1ieTogUGVuZyBGYW4gPHBlbmcu
ZmFuQG54cC5jb20+DQpDYzogUm9iIEhlcnJpbmcgPHJvYmgrZHRAa2VybmVsLm9yZz4NCkNjOiBN
YXJrIFJ1dGxhbmQgPG1hcmsucnV0bGFuZEBhcm0uY29tPg0KQ2M6IFNoYXduIEd1byA8c2hhd25n
dW9Aa2VybmVsLm9yZz4NCkNjOiBTYXNjaGEgSGF1ZXIgPHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU+
DQpDYzogUGVuZ3V0cm9uaXggS2VybmVsIFRlYW0gPGtlcm5lbEBwZW5ndXRyb25peC5kZT4NCkNj
OiBGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+DQpDYzogTlhQIExpbnV4IFRlYW0g
PGxpbnV4LWlteEBueHAuY29tPg0KQ2M6IEFpc2hlbmcgRG9uZyA8YWlzaGVuZy5kb25nQG54cC5j
b20+DQpDYzogQW5zb24gSHVhbmcgPGFuc29uLmh1YW5nQG54cC5jb20+DQpDYzogRGFuaWVsIEJh
bHV0YSA8ZGFuaWVsLmJhbHV0YUBueHAuY29tPg0KQ2M6IGRldmljZXRyZWVAdmdlci5rZXJuZWwu
b3JnDQpDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnDQotLS0NCiBhcmNo
L2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4cXhwLmR0c2kgfCA2ICsrKysrKw0KIDEgZmls
ZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykNCg0KZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9v
dC9kdHMvZnJlZXNjYWxlL2lteDhxeHAuZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNj
YWxlL2lteDhxeHAuZHRzaQ0KaW5kZXggMDY4M2VlMmE0OGFlLi5mMjk5OThkNzI3NGEgMTAwNjQ0
DQotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4cXhwLmR0c2kNCisrKyBi
L2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhxeHAuZHRzaQ0KQEAgLTE0MSw2ICsx
NDEsMTIgQEANCiAJCQljb21wYXRpYmxlID0gImZzbCxpbXg4cXhwLWlvbXV4YyI7DQogCQl9Ow0K
IA0KKwkJb2NvdHA6IGlteDhxeC1vY290cCB7DQorCQkJI2FkZHJlc3MtY2VsbHMgPSA8MT47DQor
CQkJI3NpemUtY2VsbHMgPSA8MT47DQorCQkJY29tcGF0aWJsZSA9ICJmc2wsaW14OHF4cC1vY290
cCI7DQorCQl9Ow0KKw0KIAkJcGQ6IGlteDhxeC1wZCB7DQogCQkJY29tcGF0aWJsZSA9ICJmc2ws
aW14OHF4cC1zY3UtcGQiOw0KIAkJCSNwb3dlci1kb21haW4tY2VsbHMgPSA8MT47DQotLSANCjIu
MTYuNA0KDQo=

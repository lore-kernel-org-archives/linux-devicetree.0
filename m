From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH V2 2/4] arm64: dts: imx8qxp: Move watchdog node into scu node
Date: Sun, 28 Apr 2019 03:27:06 +0000
Message-ID: <1556421727-7401-2-git-send-email-Anson.Huang@nxp.com>
References: <1556421727-7401-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1556421727-7401-1-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "wim@linux-watchdog.org" <wim@linux-watchdog.org>, "linux@roeck-us.net" <linux@roeck-us.net>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, Aisheng Dong <aisheng.dong@nxp.com>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, Peng Fan <peng.fan@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm->
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

aS5NWCBzeXN0ZW0gY29udHJvbGxlciB3YXRjaGRvZyBoYXMgcHJldGltZW91dCBmdW5jdGlvbiB3
aGljaA0KZGVwZW5kcyBvbiBpLk1YIFNDVSBkcml2ZXIsIHNvIGl0IHNob3VsZCBiZSBhIHN1Ym5v
ZGUgb2YgU0NVLg0KDQpTaWduZWQtb2ZmLWJ5OiBBbnNvbiBIdWFuZyA8QW5zb24uSHVhbmdAbnhw
LmNvbT4NCi0tLQ0KTmV3IHBhdGNoLg0KLS0tDQogYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2Nh
bGUvaW14OHF4cC5kdHNpIHwgMTAgKysrKystLS0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2Vy
dGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3Qv
ZHRzL2ZyZWVzY2FsZS9pbXg4cXhwLmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2Fs
ZS9pbXg4cXhwLmR0c2kNCmluZGV4IDA2ODNlZTIuLmIxN2MyMmUgMTAwNjQ0DQotLS0gYS9hcmNo
L2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4cXhwLmR0c2kNCisrKyBiL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvZnJlZXNjYWxlL2lteDhxeHAuZHRzaQ0KQEAgLTE0OSw2ICsxNDksMTEgQEANCiAJ
CXJ0YzogcnRjIHsNCiAJCQljb21wYXRpYmxlID0gImZzbCxpbXg4cXhwLXNjLXJ0YyI7DQogCQl9
Ow0KKw0KKwkJd2F0Y2hkb2cgew0KKwkJCWNvbXBhdGlibGUgPSAiZnNsLGlteDhxeHAtc2Mtd2R0
IiwgImZzbCxpbXgtc2Mtd2R0IjsNCisJCQl0aW1lb3V0LXNlYyA9IDw2MD47DQorCQl9Ow0KIAl9
Ow0KIA0KIAl0aW1lciB7DQpAQCAtNTE3LDkgKzUyMiw0IEBADQogCQkJcG93ZXItZG9tYWlucyA9
IDwmcGQgSU1YX1NDX1JfR1BJT183PjsNCiAJCX07DQogCX07DQotDQotCXdhdGNoZG9nIHsNCi0J
CWNvbXBhdGlibGUgPSAiZnNsLGlteDhxeHAtc2Mtd2R0IiwgImZzbCxpbXgtc2Mtd2R0IjsNCi0J
CXRpbWVvdXQtc2VjID0gPDYwPjsNCi0JfTsNCiB9Ow0KLS0gDQoyLjcuNA0KDQo=

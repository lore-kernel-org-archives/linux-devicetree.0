From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH V7 3/4] arm64: dts: freescale: imx8qxp: enable scu general irq
 channel
Date: Tue, 9 Apr 2019 05:00:01 +0000
Message-ID: <1554785675-8090-3-git-send-email-Anson.Huang@nxp.com>
References: <1554785675-8090-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1554785675-8090-1-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "a.zummo@towertech.it" <a.zummo@towertech.it>, "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>, Aisheng Dong <aisheng.dong@nxp.com>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, "sboyd@kernel.org" <sboyd@kernel.org>, Peng Fan <peng.fan@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infra>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

T24gaS5NWDhRWFAsIFNDVSB1c2VzIE1VMSBnZW5lcmFsIGludGVycnVwdCBjaGFubmVsICMzIHRv
IG5vdGlmeQ0KdXNlciBmb3IgSVJRcyBvZiBSVEMgYWxhcm0sIHRoZXJtYWwgYWxhcm0gYW5kIFdE
T0cgZXRjLiwgbWFpbGJveA0KUlggZG9vcmJlbGwgbW9kZSBpcyB1c2VkIGZvciB0aGlzIGZ1bmN0
aW9uLCB0aGlzIHBhdGNoIGFkZHMNCnN1cHBvcnQgZm9yIGl0Lg0KDQpTaWduZWQtb2ZmLWJ5OiBB
bnNvbiBIdWFuZyA8QW5zb24uSHVhbmdAbnhwLmNvbT4NClJldmlld2VkLWJ5OiBEb25nIEFpc2hl
bmcgPGFpc2hlbmcuZG9uZ0BueHAuY29tPg0KLS0tDQpObyBjaGFuZ2VzLg0KLS0tDQogYXJjaC9h
cm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OHF4cC5kdHNpIHwgNyArKysrKy0tDQogMSBmaWxl
IGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBh
L2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhxeHAuZHRzaSBiL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvZnJlZXNjYWxlL2lteDhxeHAuZHRzaQ0KaW5kZXggMGNiOTM5OC4uNzBlZjNkYiAx
MDA2NDQNCi0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhxeHAuZHRzaQ0K
KysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OHF4cC5kdHNpDQpAQCAtMjEs
NiArMjEsNyBAQA0KIAkJbW1jMSA9ICZ1c2RoYzI7DQogCQltbWMyID0gJnVzZGhjMzsNCiAJCXNl
cmlhbDAgPSAmYWRtYV9scHVhcnQwOw0KKwkJbXUxID0gJmxzaW9fbXUxOw0KIAl9Ow0KIA0KIAlj
cHVzIHsNCkBAIC0xMTcsNyArMTE4LDggQEANCiAJc2N1IHsNCiAJCWNvbXBhdGlibGUgPSAiZnNs
LGlteC1zY3UiOw0KIAkJbWJveC1uYW1lcyA9ICJ0eDAiLCAidHgxIiwgInR4MiIsICJ0eDMiLA0K
LQkJCSAgICAgInJ4MCIsICJyeDEiLCAicngyIiwgInJ4MyI7DQorCQkJICAgICAicngwIiwgInJ4
MSIsICJyeDIiLCAicngzIiwNCisJCQkgICAgICJnaXAzIjsNCiAJCW1ib3hlcyA9IDwmbHNpb19t
dTEgMCAwDQogCQkJICAmbHNpb19tdTEgMCAxDQogCQkJICAmbHNpb19tdTEgMCAyDQpAQCAtMTI1
LDcgKzEyNyw4IEBADQogCQkJICAmbHNpb19tdTEgMSAwDQogCQkJICAmbHNpb19tdTEgMSAxDQog
CQkJICAmbHNpb19tdTEgMSAyDQotCQkJICAmbHNpb19tdTEgMSAzPjsNCisJCQkgICZsc2lvX211
MSAxIDMNCisJCQkgICZsc2lvX211MSAzIDM+Ow0KIA0KIAkJY2xrOiBjbG9jay1jb250cm9sbGVy
IHsNCiAJCQljb21wYXRpYmxlID0gImZzbCxpbXg4cXhwLWNsayI7DQotLSANCjIuNy40DQoNCg==

From: Philippe Schenker <philippe.schenker@toradex.com>
Subject: [PATCH v3 21/21] ARM: dts: imx7-colibri: Add UHS support to eval
 board
Date: Wed, 7 Aug 2019 08:26:49 +0000
Message-ID: <20190807082556.5013-22-philippe.schenker@toradex.com>
References: <20190807082556.5013-1-philippe.schenker@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190807082556.5013-1-philippe.schenker@toradex.com>
Content-Language: en-US
Content-ID: <F3139A4FF8FACE4784DFE15E9B07434E@eurprd05.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Max Krummenacher <max.krummenacher@toradex.com>, "stefan@agner.ch" <stefan@agner.ch>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Mark Rutland <mark.rutland@arm.com>, =?utf-8?B?TWljaGFsIFZva8OhxI0=?= <michal.vokac@ysoft.com>, Fabio Estevam <festevam@gmail.com>
Cc: Philippe Schenker <philippe.schenker@toradex.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>
List-Id: devicetree@vger.kernel.org

VGhpcyBjb21taXQgYWRkcyBVSFMgY2FwYWJpbGl0eSB0byBUb3JhZGV4IEV2YWwgQm9hcmRzDQoN
ClNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIFNjaGVua2VyIDxwaGlsaXBwZS5zY2hlbmtlckB0b3Jh
ZGV4LmNvbT4NCg0KLS0tDQoNCkNoYW5nZXMgaW4gdjM6DQotIE5ldyBwYXRjaCB0byBtYWtlIHVz
ZSBvZiBBUk06IGR0czogaW14Ny1jb2xpYnJpOiBmaXggMS44Vi9VSFMgc3VwcG9ydA0KDQpDaGFu
Z2VzIGluIHYyOiBOb25lDQoNCiBhcmNoL2FybS9ib290L2R0cy9pbXg3LWNvbGlicmktZXZhbC12
My5kdHNpIHwgMTEgKysrKysrKysrLS0NCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvaW14Ny1j
b2xpYnJpLWV2YWwtdjMuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDctY29saWJyaS1ldmFs
LXYzLmR0c2kNCmluZGV4IDU3NmRlYzlmZjgxYy4uOTAxMjFmYmU1NjFmIDEwMDY0NA0KLS0tIGEv
YXJjaC9hcm0vYm9vdC9kdHMvaW14Ny1jb2xpYnJpLWV2YWwtdjMuZHRzaQ0KKysrIGIvYXJjaC9h
cm0vYm9vdC9kdHMvaW14Ny1jb2xpYnJpLWV2YWwtdjMuZHRzaQ0KQEAgLTIxMCw5ICsyMTAsMTYg
QEANCiB9Ow0KIA0KICZ1c2RoYzEgew0KLQlrZWVwLXBvd2VyLWluLXN1c3BlbmQ7DQotCXdha2V1
cC1zb3VyY2U7DQorCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCIsICJzdGF0ZV8xMDBtaHoiLCAi
c3RhdGVfMjAwbWh6IjsNCisJcGluY3RybC0wID0gPCZwaW5jdHJsX3VzZGhjMSAmcGluY3RybF9j
ZF91c2RoYzE+Ow0KKwlwaW5jdHJsLTEgPSA8JnBpbmN0cmxfdXNkaGMxXzEwMG1oeiAmcGluY3Ry
bF9jZF91c2RoYzE+Ow0KKwlwaW5jdHJsLTIgPSA8JnBpbmN0cmxfdXNkaGMxXzIwMG1oeiAmcGlu
Y3RybF9jZF91c2RoYzE+Ow0KIAl2bW1jLXN1cHBseSA9IDwmcmVnXzN2Mz47DQorCXZxbW1jLXN1
cHBseSA9IDwmcmVnX0xETzI+Ow0KKwljZC1ncGlvcyA9IDwmZ3BpbzEgMCBHUElPX0FDVElWRV9M
T1c+Ow0KKwlkaXNhYmxlLXdwOw0KKwllbmFibGUtc2Rpby13YWtldXA7DQorCWtlZXAtcG93ZXIt
aW4tc3VzcGVuZDsNCiAJc3RhdHVzID0gIm9rYXkiOw0KIH07DQogDQotLSANCjIuMjIuMA0KDQo=

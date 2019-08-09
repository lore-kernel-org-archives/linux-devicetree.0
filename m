From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Subject: Re: [PATCH v3 18/21] ARM: dts: imx6ull-colibri: Add general wakeup
 key used on Colibri
Date: Fri, 9 Aug 2019 15:48:46 +0000
Message-ID: <a6f9f8d870fc6dfa408e3c3417bcc04e37ed2417.camel@toradex.com>
References: <20190807082556.5013-1-philippe.schenker@toradex.com>
         <20190807082556.5013-19-philippe.schenker@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190807082556.5013-19-philippe.schenker@toradex.com>
Content-Language: en-US
Content-ID: <07359E6F6703474DA5B286CB329F8648@eurprd05.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Max Krummenacher <max.krummenacher@toradex.com>, "stefan@agner.ch" <stefan@agner.ch>, Philippe Schenker <philippe.schenker@toradex.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "michal.vokac@ysoft.com" <michal.vokac@ysoft.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "festevam@gmail.com" <festevam@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-imx@nxp.com" <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

T24gV2VkLCAyMDE5LTA4LTA3IGF0IDA4OjI2ICswMDAwLCBQaGlsaXBwZSBTY2hlbmtlciB3cm90
ZToNCj4gVGhpcyBhZGRzIHRoZSBwb3NzaWJpbGl0eSB0byB3YWtlIHRoZSBtb2R1bGUgd2l0aCBh
biBleHRlcm5hbCBzaWduYWwNCj4gYXMgZGVmaW5lZCBpbiB0aGUgQ29saWJyaSBzdGFuZGFyZA0K
PiANCj4gU2lnbmVkLW9mZi1ieTogUGhpbGlwcGUgU2NoZW5rZXIgPHBoaWxpcHBlLnNjaGVua2Vy
QHRvcmFkZXguY29tPg0KDQpBY2tlZC1ieTogTWFyY2VsIFppc3dpbGVyIDxtYXJjZWwuemlzd2ls
ZXJAdG9yYWRleC5jb20+DQoNCj4gLS0tDQo+IA0KPiBDaGFuZ2VzIGluIHYzOiBOb25lDQo+IENo
YW5nZXMgaW4gdjI6IE5vbmUNCj4gDQo+ICBhcmNoL2FybS9ib290L2R0cy9pbXg2dWxsLWNvbGli
cmktZXZhbC12My5kdHNpIHwgMTQgKysrKysrKysrKysrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCAx
NCBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvaW14
NnVsbC1jb2xpYnJpLWV2YWwtdjMuZHRzaQ0KPiBiL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDZ1bGwt
Y29saWJyaS1ldmFsLXYzLmR0c2kNCj4gaW5kZXggM2JlZTM3Yzc1YWE2Li5kM2M0ODA5ZjE0MGUg
MTAwNjQ0DQo+IC0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDZ1bGwtY29saWJyaS1ldmFsLXYz
LmR0c2kNCj4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvaW14NnVsbC1jb2xpYnJpLWV2YWwtdjMu
ZHRzaQ0KPiBAQCAtOCw2ICs4LDIwIEBADQo+ICAJCXN0ZG91dC1wYXRoID0gInNlcmlhbDA6MTE1
MjAwbjgiOw0KPiAgCX07DQo+ICANCj4gKwlncGlvLWtleXMgew0KPiArCQljb21wYXRpYmxlID0g
ImdwaW8ta2V5cyI7DQo+ICsJCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7DQo+ICsJCXBpbmN0
cmwtMCA9IDwmcGluY3RybF9zbnZzX2dwaW9rZXlzPjsNCj4gKw0KPiArCQlwb3dlciB7DQo+ICsJ
CQlsYWJlbCA9ICJXYWtlLVVwIjsNCj4gKwkJCWdwaW9zID0gPCZncGlvNSAxIEdQSU9fQUNUSVZF
X0hJR0g+Ow0KPiArCQkJbGludXgsY29kZSA9IDxLRVlfV0FLRVVQPjsNCj4gKwkJCWRlYm91bmNl
LWludGVydmFsID0gPDEwPjsNCj4gKwkJCXdha2V1cC1zb3VyY2U7DQo+ICsJCX07DQo+ICsJfTsN
Cj4gKw0KPiAgCS8qIGZpeGVkIGNyeXN0YWwgZGVkaWNhdGVkIHRvIG1jcDI1MTUgKi8NCj4gIAlj
bGsxNm06IGNsazE2bSB7DQo+ICAJCWNvbXBhdGlibGUgPSAiZml4ZWQtY2xvY2siOw0K

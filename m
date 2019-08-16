From: Philippe Schenker <philippe.schenker@toradex.com>
Subject: Re: [PATCH v4 20/21] ARM: dts: imx7-colibri: Add UHS support to eval
 board
Date: Fri, 16 Aug 2019 06:44:35 +0000
Message-ID: <eda215fd7db7509ddfbe12d83e9ae70674ef1ba4.camel@toradex.com>
References: <20190812142105.1995-1-philippe.schenker@toradex.com>
         <20190812142105.1995-21-philippe.schenker@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190812142105.1995-21-philippe.schenker@toradex.com>
Content-Language: en-US
Content-ID: <F1BF490E43A2434C980DAF8C2479961D@eurprd05.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "stefan@agner.ch" <stefan@agner.ch>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Max Krummenacher <max.krummenacher@toradex.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "michal.vokac@ysoft.com" <michal.vokac@ysoft.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "festevam@gmail.com" <festevam@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-imx@nxp.com" <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

T24gTW9uLCAyMDE5LTA4LTEyIGF0IDE0OjIxICswMDAwLCBQaGlsaXBwZSBTY2hlbmtlciB3cm90
ZToNCj4gVGhpcyBjb21taXQgYWRkcyBVSFMgY2FwYWJpbGl0eSB0byBUb3JhZGV4IEV2YWwgQm9h
cmRzDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwZSBTY2hlbmtlciA8cGhpbGlwcGUuc2No
ZW5rZXJAdG9yYWRleC5jb20+DQoNClBsZWFzZSBpZ25vcmUgdGhpcyBwYXRjaC4gVGhlcmUgd2Fz
IGEgbWlzdW5kZXJzdGFuZGluZyBhbmQgdGhpcyBvbmUNCnNob3VsZG4ndCBnbyBpbnRvIG1haW5s
aW5lLiBTb3JyeSBmb3IgdGhhdCENCj4gDQo+IC0tLQ0KPiANCj4gQ2hhbmdlcyBpbiB2NDogTm9u
ZQ0KPiBDaGFuZ2VzIGluIHYzOg0KPiAtIE5ldyBwYXRjaCB0byBtYWtlIHVzZSBvZiBBUk06IGR0
czogaW14Ny1jb2xpYnJpOiBmaXggMS44Vi9VSFMNCj4gc3VwcG9ydA0KPiANCj4gQ2hhbmdlcyBp
biB2MjogTm9uZQ0KPiANCj4gIGFyY2gvYXJtL2Jvb3QvZHRzL2lteDctY29saWJyaS1ldmFsLXYz
LmR0c2kgfCAxMSArKysrKysrKystLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9p
bXg3LWNvbGlicmktZXZhbC12My5kdHNpDQo+IGIvYXJjaC9hcm0vYm9vdC9kdHMvaW14Ny1jb2xp
YnJpLWV2YWwtdjMuZHRzaQ0KPiBpbmRleCA1NzZkZWM5ZmY4MWMuLjkwMTIxZmJlNTYxZiAxMDA2
NDQNCj4gLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvaW14Ny1jb2xpYnJpLWV2YWwtdjMuZHRzaQ0K
PiArKysgYi9hcmNoL2FybS9ib290L2R0cy9pbXg3LWNvbGlicmktZXZhbC12My5kdHNpDQo+IEBA
IC0yMTAsOSArMjEwLDE2IEBADQo+ICB9Ow0KPiAgDQo+ICAmdXNkaGMxIHsNCj4gLQlrZWVwLXBv
d2VyLWluLXN1c3BlbmQ7DQo+IC0Jd2FrZXVwLXNvdXJjZTsNCj4gKwlwaW5jdHJsLW5hbWVzID0g
ImRlZmF1bHQiLCAic3RhdGVfMTAwbWh6IiwgInN0YXRlXzIwMG1oeiI7DQo+ICsJcGluY3RybC0w
ID0gPCZwaW5jdHJsX3VzZGhjMSAmcGluY3RybF9jZF91c2RoYzE+Ow0KPiArCXBpbmN0cmwtMSA9
IDwmcGluY3RybF91c2RoYzFfMTAwbWh6ICZwaW5jdHJsX2NkX3VzZGhjMT47DQo+ICsJcGluY3Ry
bC0yID0gPCZwaW5jdHJsX3VzZGhjMV8yMDBtaHogJnBpbmN0cmxfY2RfdXNkaGMxPjsNCj4gIAl2
bW1jLXN1cHBseSA9IDwmcmVnXzN2Mz47DQo+ICsJdnFtbWMtc3VwcGx5ID0gPCZyZWdfTERPMj47
DQo+ICsJY2QtZ3Bpb3MgPSA8JmdwaW8xIDAgR1BJT19BQ1RJVkVfTE9XPjsNCj4gKwlkaXNhYmxl
LXdwOw0KPiArCWVuYWJsZS1zZGlvLXdha2V1cDsNCj4gKwlrZWVwLXBvd2VyLWluLXN1c3BlbmQ7
DQo+ICAJc3RhdHVzID0gIm9rYXkiOw0KPiAgfTsNCj4gIA0K

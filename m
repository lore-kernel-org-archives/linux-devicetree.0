From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Subject: Re: [PATCH v3 04/21] ARM: dts: imx7-colibri: Add sleep mode to
 ethernet
Date: Fri, 9 Aug 2019 14:20:38 +0000
Message-ID: <fc209916b83968d019017efcf065b9a29e6e061f.camel@toradex.com>
References: <20190807082556.5013-1-philippe.schenker@toradex.com>
         <20190807082556.5013-5-philippe.schenker@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190807082556.5013-5-philippe.schenker@toradex.com>
Content-Language: en-US
Content-ID: <BA86C9A909602842B2DD0C11F584CD61@eurprd05.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Max Krummenacher <max.krummenacher@toradex.com>, "stefan@agner.ch" <stefan@agner.ch>, Philippe Schenker <philippe.schenker@toradex.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "michal.vokac@ysoft.com" <michal.vokac@ysoft.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "festevam@gmail.com" <festevam@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-imx@nxp.com" <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

T24gV2VkLCAyMDE5LTA4LTA3IGF0IDA4OjI2ICswMDAwLCBQaGlsaXBwZSBTY2hlbmtlciB3cm90
ZToNCj4gQWRkIHNsZWVwIHBpbm11eCB0byB0aGUgZmVjIHNvIGl0IGNhbiBwcm9wZXJseSBzbGVl
cC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIFNjaGVua2VyIDxwaGlsaXBwZS5zY2hl
bmtlckB0b3JhZGV4LmNvbT4NCg0KQWNrZWQtYnk6IE1hcmNlbCBaaXN3aWxlciA8bWFyY2VsLnpp
c3dpbGVyQHRvcmFkZXguY29tPg0KDQo+IC0tLQ0KPiANCj4gQ2hhbmdlcyBpbiB2MzogTm9uZQ0K
PiBDaGFuZ2VzIGluIHYyOiBOb25lDQo+IA0KPiAgYXJjaC9hcm0vYm9vdC9kdHMvaW14Ny1jb2xp
YnJpLmR0c2kgfCAxOSArKysrKysrKysrKysrKysrKystDQo+ICAxIGZpbGUgY2hhbmdlZCwgMTgg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJt
L2Jvb3QvZHRzL2lteDctY29saWJyaS5kdHNpDQo+IGIvYXJjaC9hcm0vYm9vdC9kdHMvaW14Ny1j
b2xpYnJpLmR0c2kNCj4gaW5kZXggNTIwNDYwODVjZTZmLi5hOGQ5OTJmM2U4OTcgMTAwNjQ0DQo+
IC0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDctY29saWJyaS5kdHNpDQo+ICsrKyBiL2FyY2gv
YXJtL2Jvb3QvZHRzL2lteDctY29saWJyaS5kdHNpDQo+IEBAIC0xMDEsOCArMTAxLDkgQEANCj4g
IH07DQo+ICANCj4gICZmZWMxIHsNCj4gLQlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOw0KPiAr
CXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCIsICJzbGVlcCI7DQo+ICAJcGluY3RybC0wID0gPCZw
aW5jdHJsX2VuZXQxPjsNCj4gKwlwaW5jdHJsLTEgPSA8JnBpbmN0cmxfZW5ldDFfc2xlZXA+Ow0K
PiAgCWNsb2NrcyA9IDwmY2xrcyBJTVg3RF9FTkVUX0FYSV9ST09UX0NMSz4sDQo+ICAJCTwmY2xr
cyBJTVg3RF9FTkVUX0FYSV9ST09UX0NMSz4sDQo+ICAJCTwmY2xrcyBJTVg3RF9FTkVUMV9USU1F
X1JPT1RfQ0xLPiwNCj4gQEAgLTQ2Myw2ICs0NjQsMjIgQEANCj4gIAkJPjsNCj4gIAl9Ow0KPiAg
DQo+ICsJcGluY3RybF9lbmV0MV9zbGVlcDogZW5ldDFzbGVlcGdycCB7DQo+ICsJCWZzbCxwaW5z
ID0gPA0KPiArCQkJTVg3RF9QQURfRU5FVDFfUkdNSUlfUlhfQ1RMX19HUElPN19JTzQJCQ0KPiAw
eDANCj4gKwkJCU1YN0RfUEFEX0VORVQxX1JHTUlJX1JEMF9fR1BJTzdfSU8wCQkNCj4gMHgwDQo+
ICsJCQlNWDdEX1BBRF9FTkVUMV9SR01JSV9SRDFfX0dQSU83X0lPMQkJDQo+IDB4MA0KPiArCQkJ
TVg3RF9QQURfRU5FVDFfUkdNSUlfUlhDX19HUElPN19JTzUJCQ0KPiAweDANCj4gKw0KPiArCQkJ
TVg3RF9QQURfRU5FVDFfUkdNSUlfVFhfQ1RMX19HUElPN19JTzEwCQkNCj4gMHgwDQo+ICsJCQlN
WDdEX1BBRF9FTkVUMV9SR01JSV9URDBfX0dQSU83X0lPNgkJDQo+IDB4MA0KPiArCQkJTVg3RF9Q
QURfRU5FVDFfUkdNSUlfVEQxX19HUElPN19JTzcJCQ0KPiAweDANCj4gKwkJCU1YN0RfUEFEX0dQ
SU8xX0lPMTJfX0dQSU8xX0lPMTIJCQkNCj4gMHgwDQo+ICsJCQlNWDdEX1BBRF9TRDJfQ0RfQl9f
R1BJTzVfSU85CQkJDQo+IDB4MA0KPiArCQkJTVg3RF9QQURfU0QyX1dQX19HUElPNV9JTzEwCQkJ
DQo+IDB4MA0KPiArCQk+Ow0KPiArCX07DQo+ICsNCj4gIAlwaW5jdHJsX2Vjc3BpM19jczogZWNz
cGkzLWNzLWdycCB7DQo+ICAJCWZzbCxwaW5zID0gPA0KPiAgCQkJTVg3RF9QQURfSTJDMl9TREFf
X0dQSU80X0lPMTEJCTB4MTQNCg==

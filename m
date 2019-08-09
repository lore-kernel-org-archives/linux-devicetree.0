From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Subject: Re: [PATCH v3 21/21] ARM: dts: imx7-colibri: Add UHS support to eval
 board
Date: Fri, 9 Aug 2019 15:56:32 +0000
Message-ID: <8e910a22de1ac80f60209c2a4b2031f41c3412b2.camel@toradex.com>
References: <20190807082556.5013-1-philippe.schenker@toradex.com>
         <20190807082556.5013-22-philippe.schenker@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190807082556.5013-22-philippe.schenker@toradex.com>
Content-Language: en-US
Content-ID: <AB385BDA23BF814FBB3A01FFBD7521FE@eurprd05.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Max Krummenacher <max.krummenacher@toradex.com>, "stefan@agner.ch" <stefan@agner.ch>, Philippe Schenker <philippe.schenker@toradex.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "michal.vokac@ysoft.com" <michal.vokac@ysoft.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "festevam@gmail.com" <festevam@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-imx@nxp.com" <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

SGkgUGhpbGlwcGUNCg0KT24gV2VkLCAyMDE5LTA4LTA3IGF0IDA4OjI2ICswMDAwLCBQaGlsaXBw
ZSBTY2hlbmtlciB3cm90ZToNCj4gVGhpcyBjb21taXQgYWRkcyBVSFMgY2FwYWJpbGl0eSB0byBU
b3JhZGV4IEV2YWwgQm9hcmRzDQoNCkhvdyBhYm91dCBhbnkgb3RoZXIgY2FycmllciBib2FyZD8N
Cg0KPiBTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwZSBTY2hlbmtlciA8cGhpbGlwcGUuc2NoZW5rZXJA
dG9yYWRleC5jb20+DQo+IA0KPiAtLS0NCj4gDQo+IENoYW5nZXMgaW4gdjM6DQo+IC0gTmV3IHBh
dGNoIHRvIG1ha2UgdXNlIG9mIEFSTTogZHRzOiBpbXg3LWNvbGlicmk6IGZpeCAxLjhWL1VIUw0K
PiBzdXBwb3J0DQo+IA0KPiBDaGFuZ2VzIGluIHYyOiBOb25lDQo+IA0KPiAgYXJjaC9hcm0vYm9v
dC9kdHMvaW14Ny1jb2xpYnJpLWV2YWwtdjMuZHRzaSB8IDExICsrKysrKysrKy0tDQo+ICAxIGZp
bGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAt
LWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDctY29saWJyaS1ldmFsLXYzLmR0c2kNCj4gYi9h
cmNoL2FybS9ib290L2R0cy9pbXg3LWNvbGlicmktZXZhbC12My5kdHNpDQo+IGluZGV4IDU3NmRl
YzlmZjgxYy4uOTAxMjFmYmU1NjFmIDEwMDY0NA0KPiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9p
bXg3LWNvbGlicmktZXZhbC12My5kdHNpDQo+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDct
Y29saWJyaS1ldmFsLXYzLmR0c2kNCj4gQEAgLTIxMCw5ICsyMTAsMTYgQEANCj4gIH07DQo+ICAN
Cj4gICZ1c2RoYzEgew0KPiAtCWtlZXAtcG93ZXItaW4tc3VzcGVuZDsNCj4gLQl3YWtldXAtc291
cmNlOw0KPiArCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCIsICJzdGF0ZV8xMDBtaHoiLCAic3Rh
dGVfMjAwbWh6IjsNCj4gKwlwaW5jdHJsLTAgPSA8JnBpbmN0cmxfdXNkaGMxICZwaW5jdHJsX2Nk
X3VzZGhjMT47DQo+ICsJcGluY3RybC0xID0gPCZwaW5jdHJsX3VzZGhjMV8xMDBtaHogJnBpbmN0
cmxfY2RfdXNkaGMxPjsNCj4gKwlwaW5jdHJsLTIgPSA8JnBpbmN0cmxfdXNkaGMxXzIwMG1oeiAm
cGluY3RybF9jZF91c2RoYzE+Ow0KPiAgCXZtbWMtc3VwcGx5ID0gPCZyZWdfM3YzPjsNCj4gKwl2
cW1tYy1zdXBwbHkgPSA8JnJlZ19MRE8yPjsNCj4gKwljZC1ncGlvcyA9IDwmZ3BpbzEgMCBHUElP
X0FDVElWRV9MT1c+Ow0KPiArCWRpc2FibGUtd3A7DQo+ICsJZW5hYmxlLXNkaW8td2FrZXVwOw0K
PiArCWtlZXAtcG93ZXItaW4tc3VzcGVuZDsNCj4gIAlzdGF0dXMgPSAib2theSI7DQo+ICB9Ow0K
PiAgDQo+IC0tIA0KPiAyLjIyLjANCg0KQ2hlZXJzDQoNCk1hcmNlbA0K

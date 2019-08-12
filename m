From: Philippe Schenker <philippe.schenker@toradex.com>
Subject: Re: [PATCH v3 19/21] ARM: dts: imx6/7-colibri: switch dr_mode to otg
Date: Mon, 12 Aug 2019 12:53:28 +0000
Message-ID: <e9a6dea440a646d19c18f3487427bc0f754a7da0.camel@toradex.com>
References: <20190807082556.5013-1-philippe.schenker@toradex.com>
         <20190807082556.5013-20-philippe.schenker@toradex.com>
         <6fdbd56b71c1192c67b2e28accd611ced92de555.camel@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <6fdbd56b71c1192c67b2e28accd611ced92de555.camel@toradex.com>
Content-Language: en-US
Content-ID: <7103F6984D8B004C9D2AA8AA0A4D7D7A@eurprd05.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "stefan@agner.ch" <stefan@agner.ch>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, "festevam@gmail.com" <festevam@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, Max Krummenacher <max.krummenacher@toradex.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "michal.vokac@ysoft.com" <michal.vokac@ysoft.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-imx@nxp.com" <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

T24gRnJpLCAyMDE5LTA4LTA5IGF0IDE1OjUwICswMDAwLCBNYXJjZWwgWmlzd2lsZXIgd3JvdGU6
DQo+IEhpIFBoaWxpcHBlDQo+IA0KPiBPbiBXZWQsIDIwMTktMDgtMDcgYXQgMDg6MjYgKzAwMDAs
IFBoaWxpcHBlIFNjaGVua2VyIHdyb3RlOg0KPiA+IEluIG9yZGVyIGZvciB0aGUgb3RnIHBvcnRz
LCB0aGF0IHRoZXNlIG1vZHVsZXMgc3VwcG9ydCwgaXQgaXMgbmVlZGVkDQo+ID4gdGhhdCBkcl9t
b2RlIGlzIG9uIG90Zy4gU3dpdGNoIHRvIHVzZSB0aGF0IGZlYXR1cmUuDQo+IA0KPiBJc24ndCBm
dXJ0aGVyIGV4dGNvbiBpbnRlZ3JhdGlvbiByZXF1aXJlZCBmb3IgdGhpcyB0byB0cnVseSB3b3Jr
Pw0KDQpZZXMsIEkgd2Fzbid0IGF3YXJlIG9mIHRoYXQuIEkgd2lsbCBkcm9wIHRoaXMgcGF0Y2gg
YXMgdGhpcyBpcyBhIHdob2xlDQpuZXcgdG9waWMgYW5kIHdpbGwgaG9wZWZ1bGx5IGJlIGEgd2hv
bGUgbmV3IHBhdGNoc2V0IHNvb24uDQoNClBoaWxpcHBlDQo+IA0KPiA+IFNpZ25lZC1vZmYtYnk6
IFBoaWxpcHBlIFNjaGVua2VyIDxwaGlsaXBwZS5zY2hlbmtlckB0b3JhZGV4LmNvbT4NCj4gPiAt
LS0NCj4gPiANCj4gPiBDaGFuZ2VzIGluIHYzOiBOb25lDQo+ID4gQ2hhbmdlcyBpbiB2MjogTm9u
ZQ0KPiA+IA0KPiA+ICBhcmNoL2FybS9ib290L2R0cy9pbXg2cWRsLWNvbGlicmkuZHRzaSB8IDIg
Ky0NCj4gPiAgYXJjaC9hcm0vYm9vdC9kdHMvaW14Ny1jb2xpYnJpLmR0c2kgICAgfCAyICstDQo+
ID4gIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+
IA0KPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9pbXg2cWRsLWNvbGlicmkuZHRz
aQ0KPiA+IGIvYXJjaC9hcm0vYm9vdC9kdHMvaW14NnFkbC1jb2xpYnJpLmR0c2kNCj4gPiBpbmRl
eCA5YTYzZGViYWIwYjUuLjY2NzQxOTgzNDZkMiAxMDA2NDQNCj4gPiAtLS0gYS9hcmNoL2FybS9i
b290L2R0cy9pbXg2cWRsLWNvbGlicmkuZHRzaQ0KPiA+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRz
L2lteDZxZGwtY29saWJyaS5kdHNpDQo+ID4gQEAgLTM4OCw3ICszODgsNyBAQA0KPiA+ICAmdXNi
b3RnIHsNCj4gPiAgCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7DQo+ID4gIAlkaXNhYmxlLW92
ZXItY3VycmVudDsNCj4gPiAtCWRyX21vZGUgPSAicGVyaXBoZXJhbCI7DQo+ID4gKwlkcl9tb2Rl
ID0gIm90ZyI7DQo+ID4gIAlzdGF0dXMgPSAiZGlzYWJsZWQiOw0KPiA+ICB9Ow0KPiA+ICANCj4g
PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvaW14Ny1jb2xpYnJpLmR0c2kNCj4gPiBi
L2FyY2gvYXJtL2Jvb3QvZHRzL2lteDctY29saWJyaS5kdHNpDQo+ID4gaW5kZXggNjdmNWUwYzg3
ZmRjLi40MjQ3OGYxYWExNDYgMTAwNjQ0DQo+ID4gLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvaW14
Ny1jb2xpYnJpLmR0c2kNCj4gPiArKysgYi9hcmNoL2FybS9ib290L2R0cy9pbXg3LWNvbGlicmku
ZHRzaQ0KPiA+IEBAIC0zMjAsNyArMzIwLDcgQEANCj4gPiAgfTsNCj4gPiAgDQo+ID4gICZ1c2Jv
dGcxIHsNCj4gPiAtCWRyX21vZGUgPSAiaG9zdCI7DQo+ID4gKwlkcl9tb2RlID0gIm90ZyI7DQo+
ID4gIH07DQo+ID4gIA0KPiA+ICAmdXNkaGMxIHsNCj4gDQo+IENoZWVycw0KPiANCj4gTWFyY2Vs
DQo=

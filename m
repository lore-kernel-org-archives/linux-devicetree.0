From: Philippe Schenker <philippe.schenker@toradex.com>
Subject: Re: [PATCH 1/3] regulator: fixed: add possibility to enable by clock
Date: Tue, 10 Sep 2019 06:14:36 +0000
Message-ID: <8304353c288dd924d31e5ddb5e0368b2c436b2fb.camel@toradex.com>
References: <20190903080336.32288-1-philippe.schenker@toradex.com>
         <20190903080336.32288-2-philippe.schenker@toradex.com>
         <20190905180615.GG4053@sirena.co.uk>
         <c44f33e7396c87afecec234975652c1445d7be9d.camel@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c44f33e7396c87afecec234975652c1445d7be9d.camel@toradex.com>
Content-Language: en-US
Content-ID: <4FC123D6148AD84E861B8D513AC51C44@eurprd05.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "broonie@kernel.org" <broonie@kernel.org>
Cc: Max Krummenacher <max.krummenacher@toradex.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Luka Pivk <luka.pivk@toradex.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Stefan Agner <stefan.agner@toradex.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

T24gVHVlLCAyMDE5LTA5LTEwIGF0IDA2OjA4ICswMDAwLCBQaGlsaXBwZSBTY2hlbmtlciB3cm90
ZToNCj4gT24gVGh1LCAyMDE5LTA5LTA1IGF0IDE5OjA2ICswMTAwLCBNYXJrIEJyb3duIHdyb3Rl
Og0KPiA+IE9uIFR1ZSwgU2VwIDAzLCAyMDE5IGF0IDA4OjAzOjQ2QU0gKzAwMDAsIFBoaWxpcHBl
IFNjaGVua2VyIHdyb3RlOg0KPiA+ID4gVGhpcyBjb21taXQgYWRkcyB0aGUgcG9zc2liaWxpdHkg
dG8gY2hvb3NlIHRoZSBjb21wYXRpYmxlDQo+ID4gPiAicmVndWxhdG9yLWZpeGVkLWNsb2NrIiBp
biBkZXZpY2V0cmVlLg0KPiA+ID4gDQo+ID4gPiBUaGlzIGlzIGEgc3BlY2lhbCByZWd1bGF0b3It
Zml4ZWQgdGhhdCBoYXMgdG8gaGF2ZSBhIGNsb2NrLCBmcm9tDQo+ID4gPiB3aGljaA0KPiA+ID4g
dGhlIHJlZ3VsYXRvciBnZXRzIHN3aXRjaGVkIG9uIGFuZCBvZmYuDQo+ID4gDQo+ID4gVGhpcyBz
ZWVtcyBjb25jZXB0dWFsbHkgZmluZS4gIE1pbm9yIGlzc3VlcyB0aG91Z2g6DQo+IA0KPiBUaGFu
a3MgZm9yIHlvdXIgY29tbWVudHMgYW5kIEknbSBnbGFkIHlvdSBsaWtlIGl0ISBJIHdpbGwgc2Vu
ZCBhIHYyDQo+IHNob3J0bHksIGFsc28gd2l0aCBSb2IncyBmaXhlcyBpbi4gQ2FuIEkgZXhwZWN0
IGl0IHRvIGJlIHB1bGxlZCBmb3INCj4gNS40Pw0KDQpJIG1lYW50IDUuNSBvZiBjb3Vyc2UuDQoN
Cj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gUGhpbGlwcGUNCj4gDQo+ID4gPiArc3RhdGljIGludCBy
ZWdfY2xvY2tfaXNfZW5hYmxlZChzdHJ1Y3QgcmVndWxhdG9yX2RldiAqcmRldikNCj4gPiA+ICt7
DQo+ID4gPiArCXN0cnVjdCBmaXhlZF92b2x0YWdlX2RhdGEgKnByaXYgPSByZGV2X2dldF9kcnZk
YXRhKHJkZXYpOw0KPiA+ID4gKw0KPiA+ID4gKwlpZiAocHJpdi0+Y2xrX2VuYWJsZV9jb3VudGVy
ID4gMCkNCj4gPiA+ICsJCXJldHVybiAxOw0KPiA+ID4gKw0KPiA+ID4gKwlyZXR1cm4gMDsNCj4g
PiA+ICt9DQo+ID4gDQo+ID4gVGhpcyBjb3VsZCBqdXN0IGJlIHJldHVybiBwcml2LT5jbGtfZW5h
YmxlX2NvdW50ZXIgPiAwIC0gaWRlYWxseSB0aGUNCj4gPiBjbG9jayBBUEkgd291bGQgbGV0IHVz
IHF1ZXJ5IGlmIHRoZSBjbG9jayBpcyBlbmFibGVkIGJ1dCB0aGF0IG1pZ2h0DQo+ID4gYmUNCj4g
PiBhDQo+ID4gYml0IGNvbmZ1c2VkIGFueXdheSBnaXZlbiB0aGF0IGl0J3MgcG9zc2libHkgc2hh
cmVkLg0K

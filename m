Return-Path: <SRS0=S1SN=WC=nxp.com=anson.huang@kernel.org>
From: Anson Huang <anson.huang@nxp.com>
Subject: RE: [PATCH V5 1/5] clocksource: imx-sysctr: Add internal clock
 divider handle
Date: Tue, 6 Aug 2019 01:55:32 +0000
Message-ID: 
 <DB3PR0402MB3916B06E8907604A71169063F5D50@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <20190710063056.35689-1-Anson.Huang@nxp.com>
In-Reply-To: <20190710063056.35689-1-Anson.Huang@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
To: "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will@kernel.org" <will@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, "tglx@linutronix.de" <tglx@linutronix.de>, Leonard Crestez <leonard.crestez@nxp.com>, Aisheng Dong <aisheng.dong@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, Jacky Bai <ping.bai@nxp.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, Abel Vesa <abel.vesa@nxp.com>, "andrew.smirnov@gmail.com" <andrew.smirnov@gmail.com>, "ccaione@baylibre.com" <ccaione@baylibre.com>, "angus@akkea.ca" <angus@akkea.ca>, "agx@sigxcpu.org" <agx@sigxcpu.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

R2VudGxlIHBpbmcuLi4NCg0KPiBGcm9tOiBBbnNvbiBIdWFuZyA8QW5zb24uSHVhbmdAbnhwLmNv
bT4NCj4gDQo+IFRoZSBzeXN0ZW0gY291bnRlciBibG9jayBndWlkZSBzdGF0ZXMgdGhhdCB0aGUg
YmFzZSBjbG9jayBpcyBpbnRlcm5hbGx5IGRpdmlkZWQNCj4gYnkgMyBiZWZvcmUgdXNlLCB0aGF0
IG1lYW5zIHRoZSBjbG9jayBpbnB1dCBvZiBzeXN0ZW0gY291bnRlciBkZWZpbmVkIGluIERUDQo+
IHNob3VsZCBiZSBiYXNlIGNsb2NrIHdoaWNoIGlzIG5vcm1hbGx5IGZyb20gT1NDLCBhbmQgdGhl
biBpbnRlcm5hbGx5IGRpdmlkZWQNCj4gYnkgMyBiZWZvcmUgdXNlLg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogQW5zb24gSHVhbmcgPEFuc29uLkh1YW5nQG54cC5jb20+DQo+IC0tLQ0KPiBDaGFuZ2Vz
IHNpbmNlIFY0Og0KPiAJLSB0byBzb2x2ZSB0aGUgY2xvY2sgZHJpdmVyIHByb2JlZCBhZnRlciBz
eXN0ZW0gY291bnRlciBkcml2ZXIgaXNzdWUsDQo+IG5vdyB3ZSBjYW4gZWFzaWx5IHN3aXRjaCB0
bw0KPiAJICB1c2UgZml4ZWQgY2xvY2sgZGVmaW5lZCBpbiBEVCBhbmQgZ2V0IGl0cyByYXRlLCB0
aGVuIGRpdmlkZWQgYnkgMyB0bw0KPiBnZXQgcmVhbCBjbG9jayByYXRlIGZvcg0KPiAJICBzeXN0
ZW0gY291bnRlciBkcml2ZXIsIG5vIG5lZWQgdG8gYWRkICJjbG9jay1mcmVxdWVuY3kiIHByb3Bl
cnR5IGluDQo+IERULg0KPiAtLS0NCj4gIGRyaXZlcnMvY2xvY2tzb3VyY2UvdGltZXItaW14LXN5
c2N0ci5jIHwgNSArKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQ0KPiAN
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xvY2tzb3VyY2UvdGltZXItaW14LXN5c2N0ci5jDQo+
IGIvZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1pbXgtc3lzY3RyLmMNCj4gaW5kZXggZmQ3ZDY4
MC4uYjdjODBhMyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1pbXgt
c3lzY3RyLmMNCj4gKysrIGIvZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1pbXgtc3lzY3RyLmMN
Cj4gQEAgLTIwLDYgKzIwLDggQEANCj4gICNkZWZpbmUgU1lTX0NUUl9FTgkJMHgxDQo+ICAjZGVm
aW5lIFNZU19DVFJfSVJRX01BU0sJMHgyDQo+IA0KPiArI2RlZmluZSBTWVNfQ1RSX0NMS19ESVYJ
CTB4Mw0KPiArDQo+ICBzdGF0aWMgdm9pZCBfX2lvbWVtICpzeXNfY3RyX2Jhc2U7DQo+ICBzdGF0
aWMgdTMyIGNtcGNyOw0KPiANCj4gQEAgLTEzNCw2ICsxMzYsOSBAQCBzdGF0aWMgaW50IF9faW5p
dCBzeXNjdHJfdGltZXJfaW5pdChzdHJ1Y3QgZGV2aWNlX25vZGUNCj4gKm5wKQ0KPiAgCWlmIChy
ZXQpDQo+ICAJCXJldHVybiByZXQ7DQo+IA0KPiArCS8qIHN5c3RlbSBjb3VudGVyIGNsb2NrIGlz
IGRpdmlkZWQgYnkgMyBpbnRlcm5hbGx5ICovDQo+ICsJdG9fc3lzY3RyLm9mX2Nsay5yYXRlIC89
IFNZU19DVFJfQ0xLX0RJVjsNCj4gKw0KPiAgCXN5c19jdHJfYmFzZSA9IHRpbWVyX29mX2Jhc2Uo
JnRvX3N5c2N0cik7DQo+ICAJY21wY3IgPSByZWFkbChzeXNfY3RyX2Jhc2UgKyBDTVBDUik7DQo+
ICAJY21wY3IgJj0gflNZU19DVFJfRU47DQo+IC0tDQo+IDIuNy40DQoNCg==

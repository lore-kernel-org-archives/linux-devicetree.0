Return-Path: <SRS0=dioO=WM=nxp.com=anson.huang@kernel.org>
From: Anson Huang <anson.huang@nxp.com>
Subject: RE: [PATCH V5 5/5] arm64: dts: imx8mm: Enable cpu-idle driver
Date: Fri, 16 Aug 2019 01:03:45 +0000
Message-ID: 
 <DB3PR0402MB39160C450FC99A359B2366BDF5AF0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <20190710063056.35689-1-Anson.Huang@nxp.com>
 <20190710063056.35689-5-Anson.Huang@nxp.com>
 <34c03d76-ae61-63b4-153f-3f9911cc962e@linaro.org>
In-Reply-To: <34c03d76-ae61-63b4-153f-3f9911cc962e@linaro.org>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
To: Daniel Lezcano <daniel.lezcano@linaro.org>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will@kernel.org" <will@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, "tglx@linutronix.de" <tglx@linutronix.de>, Leonard Crestez <leonard.crestez@nxp.com>, Aisheng Dong <aisheng.dong@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, Jacky Bai <ping.bai@nxp.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, Abel Vesa <abel.vesa@nxp.com>, "andrew.smirnov@gmail.com" <andrew.smirnov@gmail.com>, "ccaione@baylibre.com" <ccaione@baylibre.com>, "angus@akkea.ca" <angus@akkea.ca>, "agx@sigxcpu.org" <agx@sigxcpu.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

SGksIERhbmllbA0KDQo+IEhpIEFuc29uLA0KPiANCj4gc29ycnkgZm9yIHRoZSBsYXRlIHJldmll
dywgSSd2ZSBiZWVuIHByZXR0eSBidXN5Lg0KDQpUaGF0IGlzIE9LIGZvciBzdXJlLg0KDQo+IA0K
PiBJZiBTaGF3biBpcyBvaywgSSBjYW4gcGljayB0aGUgcGF0Y2hlcyAxLTQgaW4gbXkgdHJlZSBh
bmQgdGhlbiB0aGlzIG9uZSBhZnRlcg0KPiB5b3UgZml4IHRoZSBjb21tZW50cyBiZWxvdy4NCg0K
U2hhd24gc2hvdWxkIGJlIE9LIGZvciBpdCwgYW5kIGhlIGFscmVhZHkgdG9vayBwYXRjaCBbUEFU
Q0ggVjUgMi81XSBhcm02NDogRW5hYmxlIFRJTUVSX0lNWF9TWVNfQ1RSIGZvciBBUkNIX01YQyBw
bGF0Zm9ybXMNCnNpbmNlIEkgZXZlciBzZW50IGl0IGJlZm9yZSBpbiBvdGhlciBzZXJpZXMgd2hl
biBzeXN0ZW0gY291bnRlciBkcml2ZXIgaXMgTk9UIGxhbmRpbmcgb24gbWFpbiBsaW5lLCBub3cg
aXQgbGFuZGVkLCBTaGF3biBqdXN0IGFwcGx5DQp0aGF0IG9sZCBwYXRjaCwgc28gaW4gVjYgcGF0
Y2ggSSBqdXN0IHNlbnQsIEkgZGlkIE5PVCBpbmNsdWRlIHRoaXMgcGF0Y2gsIHlvdSBjYW4ganVz
dCBhcHBseSB0aGUgNCBwYXRjaGVzIGluIFY2Lg0KDQpIaSwgU2hhd24NCglEYW5pZWwgd2lsbCBw
aWNrIHRoaXMgd2hvbGUgcGF0Y2ggc2VyaWVzLCBwbGVhc2UgcmFpc2UgaWYgeW91IGhhdmUgYW55
IGNvbmNlcm4sIHRoYW5rcy4NCg0KPiANCj4gT24gMTAvMDcvMjAxOSAwODozMCwgQW5zb24uSHVh
bmdAbnhwLmNvbSB3cm90ZToNCj4gDQo+IFsgLi4uIF0NCj4gDQo+ID4gKwkJaWRsZS1zdGF0ZXMg
ew0KPiA+ICsJCQllbnRyeS1tZXRob2QgPSAicHNjaSI7DQo+ID4gKw0KPiA+ICsJCQljcHVfc2xl
ZXBfd2FpdDogY3B1LXNsZWVwLXdhaXQgew0KPiANCj4gSXMgdGhhdCBhIHJldGVudGlvbiBzdGF0
ZSBvciBhIHBvd2VyZG93bj8gSXQgaXMgcHJlZmVyYWJsZSB0byBjaGFuZ2UgdGhlIG5hbWUNCj4g
dG8gdGhlIGlkbGUgc3RhdGUgbmFtaW5nIGNvbnZlbnRpb24gZ2l2ZW4gaW4gdGhlIFBTQ0kgZG9j
dW1lbnRhdGlvbiBbMV0gcGFnZQ0KPiAxNi0xNw0KDQpUaGFua3MgZm9yIHlvdXIgZGV0YWlsIHJl
ZmVyZW5jZSwgaXQgaXMgYSBwb3dlciBkb3duIHN0YXRlIHdpdGggU29DIGVudGVyaW5nIFdBSVQg
bW9kZSwNCnNvIGluIFY2LCBJIGNoYW5nZSB0aGUgbmFtZSB0byAiY3B1X3BkX3dhaXQ6Y3B1LXBk
LXdhaXQiLg0KDQo+IA0KPiANCj4gPiArCQkJCWNvbXBhdGlibGUgPSAiYXJtLGlkbGUtc3RhdGUi
Ow0KPiA+ICsJCQkJYXJtLHBzY2ktc3VzcGVuZC1wYXJhbSA9IDwweDAwMTAwMzM+Ow0KPiA+ICsJ
CQkJbG9jYWwtdGltZXItc3RvcDsNCj4gPiArCQkJCWVudHJ5LWxhdGVuY3ktdXMgPSA8MTAwMD47
DQo+ID4gKwkJCQlleGl0LWxhdGVuY3ktdXMgPSA8NzAwPjsNCj4gPiArCQkJCW1pbi1yZXNpZGVu
Y3ktdXMgPSA8MjcwMD47DQo+ID4gKwkJCQl3YWtldXAtbGF0ZW5jeS11cyA9IDwxNTAwPjsNCj4g
DQo+IEl0IGlzIHBvaW50bGVzcyB0byBzcGVjaWZ5IHRoZSBlbnRyeSArIGV4aXQgKmFuZCogdGhl
IHdha2V1cC1sYXRlbmN5IFsyXS4NCg0KQWgsIHllcywgdGhpcyBpcyBuZXcgdG8gbWUsIEkgd2ls
bCBqdXN0IHJlbW92ZSB0aGUg4oCcd2FrZXVwLWxhdGVuY3ktdXPigJ0gcHJvcGVydHkuDQoNClRo
YW5rcywNCkFuc29uLg0KDQo=

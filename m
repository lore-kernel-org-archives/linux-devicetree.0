From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: RE: [PATCH 1/4] dt-binding: irq: imx-irqsteer: use irq number per
 channel instead of group number
Date: Fri, 18 Jan 2019 09:46:37 +0000
Message-ID: <AM0PR04MB42114D5B25B23C0D7FFF95BA809C0@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1547797668-30342-1-git-send-email-aisheng.dong@nxp.com>
 <1547797668-30342-2-git-send-email-aisheng.dong@nxp.com>
 <1547801291.2626.3.camel@pengutronix.de>
 <45c7e5b6-26bb-81b1-093b-96312a1788ec@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <45c7e5b6-26bb-81b1-093b-96312a1788ec@arm.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>, Lucas Stach <l.stach@pengutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>
List-Id: devicetree@vger.kernel.org

PiBGcm9tOiBNYXJjIFp5bmdpZXIgW21haWx0bzptYXJjLnp5bmdpZXJAYXJtLmNvbV0NCj4gU2Vu
dDogRnJpZGF5LCBKYW51YXJ5IDE4LCAyMDE5IDU6MzkgUE0NCj4gT24gMTgvMDEvMjAxOSAwODo0
OCwgTHVjYXMgU3RhY2ggd3JvdGU6DQo+ID4gQW0gRnJlaXRhZywgZGVuIDE4LjAxLjIwMTksIDA3
OjUzICswMDAwIHNjaHJpZWIgQWlzaGVuZyBEb25nOg0KPiA+PiBOb3QgYWxsIDY0IGludGVycnVw
dHMgbWF5IGJlIHVzZWQgaW4gb25lIGdyb3VwLiBlLmcuIG1vc3QgaXJxc3RlZXIgaW4NCj4gPj4g
aW14OHF4cCBhbmQgaW14OHFtIHN1YnN5c3RlbXMgc3VwcG9ydHMgb25seSAzMiBpbnRlcnJ1cHRz
Lg0KPiA+Pg0KPiA+PiBBcyB0aGUgSVAgaW50ZWdyYXRpb24gcGFyYW1ldGVycyBhcmUgQ2hhbm5l
bCBudW1iZXIgYW5kIGludGVycnVwdHMNCj4gPj4gbnVtYmVyLCBsZXQncyB1c2UgZnNsLGlycXMt
cGVyLWNoYW4gdG8gcmVwcmVzZW50cyBob3cgbWFueSBpbnRlcnJ1cHRzDQo+ID4+IHN1cHBvcnRl
ZCBieSB0aGlzIGlycXN0ZWVyIGNoYW5uZWwuDQo+ID4NCj4gPiBTb3JyeSwgYnV0IHRvdGFsIE5B
Q0suIEkndmUgZ290IHRvIGdyZWF0IGxlbmd0aHMgd2l0aCBkdW1waW5nIHRoZQ0KPiA+IGFjdHVh
bGx5IGltcGxlbWVudGVkIHJlZ2lzdGVyIGxheW91dCBvbiBpLk1YOE0gYW5kIEFGQUlDUyB0aGUg
SVJRcyBhcmUNCj4gPiBhbHdheXMgbWFuYWdlZCBpbiBncm91cHMgb2YgNjQgSVJRcywgZXZlbiBp
ZiBsZXNzIHRoYW4gdGhhdCBhcmUNCj4gPiBjb25uZWN0ZWQgYXMgaW5wdXQgSVJRcy4gVGhpcyBp
cyB3aGF0IHRoZSBhY3R1YWxseSBwcmVzZW50IHJlZ2lzdGVyDQo+ID4gc2V0IG9uIGkuTVg4TSB0
ZWxscyB1cy4NCj4gDQo+IEFsc28sIEknZCByZWFsbHkgbGlrZSB0aGUgRFQgYmluZGluZ3Mgbm90
IHRvIGNoYW5nZSBhdCBldmVyeSByZWxlYXNlLiBTbyB3aGF0ZXZlcg0KPiBjaGFuZ2UgKGlmIGFu
eSkgaGFzIHRvIGJlIGRvbmUgZm9yIHRoaXMgZHJpdmVyIHRvIHN1cHBvcnQgZXhpc3RpbmcgSFcs
IHBsZWFzZQ0KPiBtYWtlIHN1cmUgdGhhdCB0aGUgRFQgYmluZGluZ3MgYXJlIGtlcHQgYXMgc3Rh
YmxlIGFzIHBvc3NpYmxlLg0KPiANCg0KU29ycnkgSSBzaG91bGQgY2xhcmlmeSBpdCBhIGJpdC4N
ClRoZXJlJ3Mgc3RpbGwgbm8gdXNlcnMgaW4gRGV2aWNldHJlZS4NClNvIEkgZ3Vlc3Mgd2UgY2Fu
IHVwZGF0ZSBpdCwgcmlnaHQ/IE9yIG5vdD8NCg0KUmVnYXJkcw0KRG9uZyBBaXNoZW5nDQoNCj4g
VGhhbmtzLA0KPiANCj4gCU0uDQo+IC0tDQo+IEphenogaXMgbm90IGRlYWQuIEl0IGp1c3Qgc21l
bGxzIGZ1bm55Li4uDQo=

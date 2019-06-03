From: Leo Li <leoyang.li@nxp.com>
Subject: RE: [PATCH v3 0/6] soc/fsl/qe: cleanups and new DT binding
Date: Mon, 3 Jun 2019 19:55:51 +0000
Message-ID: <VE1PR04MB6687FF805430978ED307EA2D8F140@VE1PR04MB6687.eurprd04.prod.outlook.com>
References: <20190501092841.9026-1-rasmus.villemoes@prevas.dk>
 <20190513111442.25724-1-rasmus.villemoes@prevas.dk>
 <e11c1e55-1e11-7ce3-3c0f-0b723ab260aa@prevas.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e11c1e55-1e11-7ce3-3c0f-0b723ab260aa@prevas.se>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rasmus Villemoes <Rasmus.Villemoes@prevas.se>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Scott Wood <oss@buserror.net>, Christophe Leroy <christophe.leroy@c-s.fr>, Mark Rutland <mark.rutland@arm.com>, "jocke@infinera.com" <joakim.tjernlund@infinera.com>
List-Id: devicetree@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmFzbXVzIFZpbGxlbW9l
cyA8UmFzbXVzLlZpbGxlbW9lc0BwcmV2YXMuc2U+DQo+IFNlbnQ6IE1vbmRheSwgSnVuZSAzLCAy
MDE5IDI6NTQgUE0NCj4gVG86IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBRaWFuZyBaaGFv
IDxxaWFuZy56aGFvQG54cC5jb20+OyBMZW8gTGkNCj4gPGxlb3lhbmcubGlAbnhwLmNvbT4NCj4g
Q2M6IGxpbnV4cHBjLWRldkBsaXN0cy5vemxhYnMub3JnOyBsaW51eC1hcm0ta2VybmVsQGxpc3Rz
LmluZnJhZGVhZC5vcmc7DQo+IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IFJvYiBIZXJy
aW5nIDxyb2JoK2R0QGtlcm5lbC5vcmc+OyBTY290dA0KPiBXb29kIDxvc3NAYnVzZXJyb3IubmV0
PjsgQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjLXMuZnI+Ow0KPiBNYXJrIFJ1
dGxhbmQgPG1hcmsucnV0bGFuZEBhcm0uY29tPjsgam9ja2VAaW5maW5lcmEuY29tDQo+IDxqb2Fr
aW0udGplcm5sdW5kQGluZmluZXJhLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyAwLzZd
IHNvYy9mc2wvcWU6IGNsZWFudXBzIGFuZCBuZXcgRFQgYmluZGluZw0KPiANCj4gT24gMTMvMDUv
MjAxOSAxMy4xNCwgUmFzbXVzIFZpbGxlbW9lcyB3cm90ZToNCj4gPiBUaGlzIHNtYWxsIHNlcmll
cyBjb25zaXN0cyBvZiBzb21lIHNtYWxsIGNsZWFudXBzIGFuZCBzaW1wbGlmaWNhdGlvbnMNCj4g
PiBvZiB0aGUgUVVJQ0MgZW5naW5lIGRyaXZlciwgYW5kIGludHJvZHVjZXMgYSBuZXcgRFQgYmlu
ZGluZyB0aGF0IG1ha2VzDQo+ID4gaXQgbXVjaCBlYXNpZXIgdG8gc3VwcG9ydCBvdGhlciB2YXJp
YW50cyBvZiB0aGUgUVVJQ0MgZW5naW5lIElQIGJsb2NrDQo+ID4gdGhhdCBhcHBlYXJzIGluIHRo
ZSB3aWxkOiBUaGVyZSdzIG5vIHJlYXNvbiB0byBleHBlY3QgaW4gZ2VuZXJhbCB0aGF0DQo+ID4g
dGhlIG51bWJlciBvZiB2YWxpZCBTTlVNcyB1bmlxdWVseSBkZXRlcm1pbmVzIHRoZSBzZXQgb2Yg
c3VjaCwgc28gaXQncw0KPiA+IGJldHRlciB0byBzaW1wbHkgbGV0IHRoZSBkZXZpY2UgdHJlZSBz
cGVjaWZ5IHRoZSB2YWx1ZXMgKGFuZCwNCj4gPiBpbXBsaWNpdGx5IHZpYSB0aGUgYXJyYXkgbGVu
Z3RoLCBhbHNvIHRoZSBjb3VudCkuDQo+ID4NCj4gPiBXaGljaCB0cmVlIHNob3VsZCB0aGlzIGdv
IHRocm91Z2g/DQo+IA0KPiBQaW5nPyBUaGVzZSBwYXRjaGVzIHNob3VsZCBiZSByZWFkeSB0byBn
byBpbiwgYnV0IEkgZG9uJ3Qga25vdyB3aG8gaXMNCj4gc3VwcG9zZWQgdG8gcGljayB0aGVtIHVw
Lg0KDQpJIGNhbiBwaWNrIHRoZW0gdXAgdGhyb3VnaCB0aGUgc29jL2ZzbCB0cmVlLg0KDQpSZWdh
cmRzLA0KTGVvDQo=

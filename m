From: Anson Huang <anson.huang@nxp.com>
Subject: RE: [PATCH 1/3] clocksource/drivers/sysctr: Add an optional property
Date: Sun, 23 Jun 2019 12:05:55 +0000
Message-ID: <DB3PR0402MB39168010C09BDAE2BF27123CF5E10@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <20190621082838.12630-1-Anson.Huang@nxp.com>
 <alpine.DEB.2.21.1906231232520.32342@nanos.tec.linutronix.de>
 <DB3PR0402MB3916B3B871FDEA9BFC960C67F5E10@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <alpine.DEB.2.21.1906231331390.32342@nanos.tec.linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.21.1906231331390.32342@nanos.tec.linutronix.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, Abel Vesa <abel.vesa@nxp.com>, "ccaione@baylibre.com" <ccaione@baylibre.com>, "angus@akkea.ca" <angus@akkea.ca>, "andrew.smirnov@gmail.com" <andrew.smirnov@gmail.com>, "agx@sigxcpu.org" <agx@sigxcpu.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kern>
List-Id: devicetree@vger.kernel.org

SGksIFRob21hcw0KDQo+IEFuc29uLA0KPiANCj4gQTogQmVjYXVzZSBpdCBtZXNzZXMgdXAgdGhl
IG9yZGVyIGluIHdoaWNoIHBlb3BsZSBub3JtYWxseSByZWFkIHRleHQuDQo+IFE6IFdoeSBpcyB0
b3AtcG9zdGluZyBzdWNoIGEgYmFkIHRoaW5nPw0KPiBBOiBUb3AtcG9zdGluZy4NCj4gUTogV2hh
dCBpcyB0aGUgbW9zdCBhbm5veWluZyB0aGluZyBpbiBlLW1haWw/DQo+IA0KPiBBOiBOby4NCj4g
UTogU2hvdWxkIEkgaW5jbHVkZSBxdW90YXRpb25zIGFmdGVyIG15IHJlcGx5Pw0KPiANCj4gaHR0
cHM6Ly9ldXIwMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHAlM0El
MkYlMkZkYXJpbmdmDQo+IGlyZWJhbGwubmV0JTJGMjAwNyUyRjA3JTJGb25fdG9wJmFtcDtkYXRh
PTAyJTdDMDElN0NhbnNvbi5odWFuZw0KPiAlNDBueHAuY29tJTdDNjU4ZDEyZTBkNjVhNDAxMDM0
ZDIwOGQ2ZjdjZWNjODYlN0M2ODZlYTFkM2JjMmI0YzYNCj4gZmE5MmNkOTljNWMzMDE2MzUlN0Mw
JTdDMSU3QzYzNjk2ODg2NDkwODMzODIzNiZhbXA7c2RhdGE9JTJGMCUNCj4gMkI5RElUMkhWdVZG
Z0x2aFc3UUZGTkFYclJxYmNUaTklMkJKY2FzZ092MDglM0QmYW1wO3Jlc2VydmVkPTANCj4gDQoN
ClRoYW5rcyBmb3IgdGhlc2UgaW5mby4NCg0KPiBPbiBTdW4sIDIzIEp1biAyMDE5LCBBbnNvbiBI
dWFuZyB3cm90ZToNCj4gDQo+ID4gSGksIFRob21hcw0KPiA+IAlUaGFua3MgZm9yIHRoZSB1c2Vm
dWwgY29tbWVudCwgSSB3aWxsIHJlc2VuZCB0aGUgcGF0Y2ggd2l0aA0KPiBpbXByb3ZlbWVudC4N
Cj4gPg0KPiA+IEFuc29uLg0KPiA+IA0KPiBBbHNvIHBsZWFzZSBmaXggeW91ciBtYWlsZXIgdG8g
Tk9UIGNvcHkgdGhlIGZ1bGwgbWFpbCBoZWFkZXIgaW50byB0aGUgcmVwbHkuDQo+IFRoYXQncyBh
YnNvbHV0ZWx5IHVzZWxlc3MuDQoNClN1cmUsIHRoYW5rcyBmb3IgcmVtaW5kZXIuDQoNCj4gDQo+
ID4gPg0KPiA+ID4gQW5zb24sDQo+ID4gPg0KPiA+ID4gT24gRnJpLCAyMSBKdW4gMjAxOSwgQW5z
b24uSHVhbmdAbnhwLmNvbSB3cm90ZToNCj4gPiA+DQo+ID4gPiA+IFN1YmplY3QgOiBbUEFUQ0gg
MS8zXSBjbG9ja3NvdXJjZS9kcml2ZXJzL3N5c2N0cjogQWRkIGFuIG9wdGlvbmFsDQo+ID4gPiA+
IHByb3BlcnR5DQo+IA0KPiBBbmQgZmluYWxseSBwbGVhc2UgdHJpbSB5b3VyIHJlcGxpZXMsIHNv
IHRoZSB1bmludGVyZXN0aW5nIHBhcnRzIGFyZSBnb25lLg0KPg0KDQpPSy4NCg0KVGhhbmtzLA0K
QW5zb24uDQogDQo+IFRoYW5rcywNCj4gDQo+IAl0Z2x4DQo=

From: Anson Huang <anson.huang@nxp.com>
Subject: RE: [PATCH RESEND V2 1/3] clocksource/drivers/sysctr: Add optional
 clock-frequency property
Date: Thu, 27 Jun 2019 00:43:30 +0000
Message-ID: <DB3PR0402MB3916ED4AB17B6DDD2248DD44F5FD0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <20190623123850.22584-1-Anson.Huang@nxp.com>
 <55abafbd-c010-32b5-6d76-26040830d5b0@linaro.org>
 <DB3PR0402MB3916AB9F2260B0E46CCDDEC0F5E20@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <9c017ba9-ac6b-480b-d1f3-120289343101@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9c017ba9-ac6b-480b-d1f3-120289343101@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, Abel Vesa <abel.vesa@nxp.com>, "ccaione@baylibre.com" <ccaione@baylibre.com>, "angus@akkea.ca" <angus@akkea.ca>, "andrew.smirnov@gmail.com" <andrew.smirnov@gmail.com>, "agx@sigxcpu.org" <agx@sigxcpu.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-arm-kernel@lists.i
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

SGksIERhbmllbA0KDQo+IE9uIDI2LzA2LzIwMTkgMDM6NDIsIEFuc29uIEh1YW5nIHdyb3RlOg0K
PiA+IEhpLCBEYW5pZWwNCj4gPg0KPiA+PiBPbiAyMy8wNi8yMDE5IDE0OjM4LCBBbnNvbi5IdWFu
Z0BueHAuY29tIHdyb3RlOg0KPiA+Pj4gRnJvbTogQW5zb24gSHVhbmcgPEFuc29uLkh1YW5nQG54
cC5jb20+DQo+ID4+Pg0KPiA+Pj4gU3lzdGVtcyB3aGljaCB1c2UgcGxhdGZvcm0gZHJpdmVyIG1v
ZGVsIGZvciBjbG9jayBkcml2ZXIgcmVxdWlyZSB0aGUNCj4gPj4+IGNsb2NrIGZyZXF1ZW5jeSB0
byBiZSBzdXBwbGllZCB2aWEgZGV2aWNlIHRyZWUgd2hlbiBzeXN0ZW0gY291bnRlcg0KPiA+Pj4g
ZHJpdmVyIGlzIGVuYWJsZWQuDQo+ID4+Pg0KPiA+Pj4gVGhpcyBpcyBuZWNlc3NhcnkgYXMgaW4g
dGhlIHBsYXRmb3JtIGRyaXZlciBtb2RlbCB0aGUgb2ZfY2xrDQo+ID4+PiBvcGVyYXRpb25zIGRv
IG5vdCB3b3JrIGNvcnJlY3RseSBiZWNhdXNlIHN5c3RlbSBjb3VudGVyIGRyaXZlciBpcw0KPiA+
Pj4gaW5pdGlhbGl6ZWQgaW4gZWFybHkgcGhhc2Ugb2Ygc3lzdGVtIGJvb3QgdXAsIGFuZCBjbG9j
ayBkcml2ZXIgdXNpbmcNCj4gPj4+IHBsYXRmb3JtIGRyaXZlciBtb2RlbCBpcyBOT1QgcmVhZHkg
YXQgdGhhdCB0aW1lLCBpdCB3aWxsIGNhdXNlDQo+ID4+PiBzeXN0ZW0gY291bnRlciBkcml2ZXIg
aW5pdGlhbGl6YXRpb24gZmFpbGVkLg0KPiA+Pj4NCj4gPj4+IEFkZCB0aGUgb3B0aW5hbCBjbG9j
ay1mcmVxdWVuY3kgdG8gdGhlIGRldmljZSB0cmVlIGJpbmRpbmdzIG9mIHRoZQ0KPiA+Pj4gTlhQ
IHN5c3RlbSBjb3VudGVyLCBzbyB0aGUgZnJlcXVlbmN5IGNhbiBiZSBoYW5kZWQgaW4gYW5kIHRo
ZSBvZl9jbGsNCj4gPj4+IG9wZXJhdGlvbnMgY2FuIGJlIHNraXBwZWQuDQo+ID4+DQo+ID4+IElz
bid0IGl0IHBvc3NpYmxlIHRvIGNyZWF0ZSBhIGZpeGVkLWNsb2NrIGFuZCByZWZlciB0byBpdD8g
U28gbm8gbmVlZA0KPiA+PiB0byBjcmVhdGUgYSBzcGVjaWZpYyBhY3Rpb24gYmVmb3JlIGNhbGxp
bmcgdGltZXJfb2ZfaW5pdCgpID8NCj4gPj4NCj4gPg0KPiA+IEFzIHRoZSBjbG9jayBtdXN0IGJl
IHJlYWR5IGJlZm9yZSB0aGUgVElNRVJfT0ZfREVDTEFSRSwgc28gYWRkaW5nIGENCj4gPiBDTEtf
T0ZfREVDTEFSRV9EUklWRVIgaW4gY2xvY2sgZHJpdmVyIHRvIE9OTFkgcmVnaXN0ZXIgYSBmaXhl
ZC1jbG9jaz8NCj4gPiBUaGUgc3lzdGVtIGNvdW50ZXIncyBmcmVxdWVuY3kgYXJlIGRpZmZlcmVu
dCBvbiBkaWZmZXJlbnQgcGxhdGZvcm1zLA0KPiA+IHNvIGFkZGluZyBmaXhlZCBjbG9jayBpbiBz
eXN0ZW0gY291bnRlciBkcml2ZXIgaXMgTk9UIGEgZ29vZCBpZGVhLA0KPiA+IE9OTFkgdGhlIERU
IG5vZGUgb3IgdGhlIGNsb2NrIGRyaXZlciBjYW4gY3JlYXRlIHRoaXMgZml4ZWQgY2xvY2sgYWNj
b3JkaW5nIHRvDQo+IHBsYXRmb3JtcywgY2FuIHlvdSBhZHZpc2Ugd2hlcmUgdG8gY3JlYXRlIHRo
aXMgZml4ZWQgY2xvY2sgaXMgYmV0dGVyPw0KPiANCj4gQ2FuIHlvdSBwb2ludCBtZSB0byBhIERU
IHdpdGggdGhlICJueHAsc3lzY3RyLXRpbWVyIiA/DQoNClRoZSBEVCBub2RlIG9mIHN5c3RlbSBj
b3VudGVyIGlzIG5ldyBhZGRlZCBpbiAzLzMgb2YgdGhpcyBwYXRjaCBzZXJpZXMsIGFsc28gY2Fu
IGJlIGZvdW5kDQpmcm9tIGJlbG93IGxpbms6DQpodHRwczovL3BhdGNod29yay5rZXJuZWwub3Jn
L3BhdGNoLzExMDExNzAzLw0KDQp0aGFua3MsDQpBbnNvbg0KDQo=

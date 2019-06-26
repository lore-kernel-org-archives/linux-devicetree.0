From: Anson Huang <anson.huang@nxp.com>
Subject: RE: [PATCH RESEND V2 1/3] clocksource/drivers/sysctr: Add optional
 clock-frequency property
Date: Wed, 26 Jun 2019 01:42:48 +0000
Message-ID: <DB3PR0402MB3916AB9F2260B0E46CCDDEC0F5E20@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <20190623123850.22584-1-Anson.Huang@nxp.com>
 <55abafbd-c010-32b5-6d76-26040830d5b0@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <55abafbd-c010-32b5-6d76-26040830d5b0@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, Abel Vesa <abel.vesa@nxp.com>, "ccaione@baylibre.com" <ccaione@baylibre.com>, "angus@akkea.ca" <angus@akkea.ca>, "andrew.smirnov@gmail.com" <andrew.smirnov@gmail.com>, "agx@sigxcpu.org" <agx@sigxcpu.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-arm-kernel@lists.i
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

SGksIERhbmllbA0KDQo+IE9uIDIzLzA2LzIwMTkgMTQ6MzgsIEFuc29uLkh1YW5nQG54cC5jb20g
d3JvdGU6DQo+ID4gRnJvbTogQW5zb24gSHVhbmcgPEFuc29uLkh1YW5nQG54cC5jb20+DQo+ID4N
Cj4gPiBTeXN0ZW1zIHdoaWNoIHVzZSBwbGF0Zm9ybSBkcml2ZXIgbW9kZWwgZm9yIGNsb2NrIGRy
aXZlciByZXF1aXJlIHRoZQ0KPiA+IGNsb2NrIGZyZXF1ZW5jeSB0byBiZSBzdXBwbGllZCB2aWEg
ZGV2aWNlIHRyZWUgd2hlbiBzeXN0ZW0gY291bnRlcg0KPiA+IGRyaXZlciBpcyBlbmFibGVkLg0K
PiA+DQo+ID4gVGhpcyBpcyBuZWNlc3NhcnkgYXMgaW4gdGhlIHBsYXRmb3JtIGRyaXZlciBtb2Rl
bCB0aGUgb2ZfY2xrDQo+ID4gb3BlcmF0aW9ucyBkbyBub3Qgd29yayBjb3JyZWN0bHkgYmVjYXVz
ZSBzeXN0ZW0gY291bnRlciBkcml2ZXIgaXMNCj4gPiBpbml0aWFsaXplZCBpbiBlYXJseSBwaGFz
ZSBvZiBzeXN0ZW0gYm9vdCB1cCwgYW5kIGNsb2NrIGRyaXZlciB1c2luZw0KPiA+IHBsYXRmb3Jt
IGRyaXZlciBtb2RlbCBpcyBOT1QgcmVhZHkgYXQgdGhhdCB0aW1lLCBpdCB3aWxsIGNhdXNlIHN5
c3RlbQ0KPiA+IGNvdW50ZXIgZHJpdmVyIGluaXRpYWxpemF0aW9uIGZhaWxlZC4NCj4gPg0KPiA+
IEFkZCB0aGUgb3B0aW5hbCBjbG9jay1mcmVxdWVuY3kgdG8gdGhlIGRldmljZSB0cmVlIGJpbmRp
bmdzIG9mIHRoZSBOWFANCj4gPiBzeXN0ZW0gY291bnRlciwgc28gdGhlIGZyZXF1ZW5jeSBjYW4g
YmUgaGFuZGVkIGluIGFuZCB0aGUgb2ZfY2xrDQo+ID4gb3BlcmF0aW9ucyBjYW4gYmUgc2tpcHBl
ZC4NCj4gDQo+IElzbid0IGl0IHBvc3NpYmxlIHRvIGNyZWF0ZSBhIGZpeGVkLWNsb2NrIGFuZCBy
ZWZlciB0byBpdD8gU28gbm8gbmVlZCB0byBjcmVhdGUgYQ0KPiBzcGVjaWZpYyBhY3Rpb24gYmVm
b3JlIGNhbGxpbmcgdGltZXJfb2ZfaW5pdCgpID8NCj4gDQoNCkFzIHRoZSBjbG9jayBtdXN0IGJl
IHJlYWR5IGJlZm9yZSB0aGUgVElNRVJfT0ZfREVDTEFSRSwgc28gYWRkaW5nIGEgQ0xLX09GX0RF
Q0xBUkVfRFJJVkVSIGluDQpjbG9jayBkcml2ZXIgdG8gT05MWSByZWdpc3RlciBhIGZpeGVkLWNs
b2NrPyBUaGUgc3lzdGVtIGNvdW50ZXIncyBmcmVxdWVuY3kgYXJlIGRpZmZlcmVudCBvbiBkaWZm
ZXJlbnQNCnBsYXRmb3Jtcywgc28gYWRkaW5nIGZpeGVkIGNsb2NrIGluIHN5c3RlbSBjb3VudGVy
IGRyaXZlciBpcyBOT1QgYSBnb29kIGlkZWEsIE9OTFkgdGhlIERUIG5vZGUgb3IgdGhlDQpjbG9j
ayBkcml2ZXIgY2FuIGNyZWF0ZSB0aGlzIGZpeGVkIGNsb2NrIGFjY29yZGluZyB0byBwbGF0Zm9y
bXMsIGNhbiB5b3UgYWR2aXNlIHdoZXJlIHRvIGNyZWF0ZSB0aGlzIGZpeGVkDQpjbG9jayBpcyBi
ZXR0ZXI/DQoNClRoYW5rcywNCkFuc29uIA0KDQo=

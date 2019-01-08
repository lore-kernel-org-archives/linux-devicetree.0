From: Jacky Bai <ping.bai@nxp.com>
Subject: RE: [PATCH v2 2/2] driver: clocksource: Add nxp system counter timer
 driver support
Date: Tue, 8 Jan 2019 09:33:18 +0000
Message-ID: <VI1PR0402MB3519AF0CEF41F24867B10986878A0@VI1PR0402MB3519.eurprd04.prod.outlook.com>
References: <1544592770-19996-1-git-send-email-ping.bai@nxp.com>
 <1544592770-19996-2-git-send-email-ping.bai@nxp.com>
 <dbe836ff-cd29-a693-4d83-a2fee419b424@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <dbe836ff-cd29-a693-4d83-a2fee419b424@infradead.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>, "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, Aisheng Dong <aisheng.dong@nxp.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDIvMl0gZHJpdmVyOiBjbG9ja3NvdXJjZTogQWRkIG54
cCBzeXN0ZW0gY291bnRlciB0aW1lcg0KPiBkcml2ZXIgc3VwcG9ydA0KPiANCj4gSGksDQo+IA0K
PiBPbiAxMi8xMS8xOCA5OjI4IFBNLCBKYWNreSBCYWkgd3JvdGU6DQo+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvY2xvY2tzb3VyY2UvS2NvbmZpZyBiL2RyaXZlcnMvY2xvY2tzb3VyY2UvS2NvbmZp
Zw0KPiA+IGluZGV4IGM1N2IxNTYuLjdlNWYyZGUgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9j
bG9ja3NvdXJjZS9LY29uZmlnDQo+ID4gKysrIGIvZHJpdmVycy9jbG9ja3NvdXJjZS9LY29uZmln
DQo+ID4gQEAgLTU3OSw2ICs1NzksMTQgQEAgY29uZmlnIENMS1NSQ19JTVhfVFBNDQo+ID4gIAkg
IEVuYWJsZSB0aGlzIG9wdGlvbiB0byB1c2UgSU1YIFRpbWVyL1BXTSBNb2R1bGUgKFRQTSkgdGlt
ZXIgYXMNCj4gPiAgCSAgY2xvY2tzb3VyY2UuDQo+ID4NCj4gPiArY29uZmlnIENMS1NSQ19JTVhf
U1lTX0NUUg0KPiA+ICsJYm9vbCAiQ2xvY2tzb3VyY2UgdXNpbmcgaS5NWCBzeXN0ZW0gY291bnRl
ciIgaWYgQ09NUElMRV9URVNUDQo+IA0KPiBMb29rcyBsaWtlIGEgIm1ha2UgKmNvbmZpZyIgdXNl
ciBvbmx5IGdldHMgdGhpcyBwcm9tcHQgaWYgQ09NUElMRV9URVNUIGlzIHNldC4NCj4gDQo+IElm
IENPTVBJTEVfVEVTVCBpcyBub3Qgc2V0LCBob3cgZG9lcyB0aGlzIGRyaXZlciBiZWNvbWUgZW5h
YmxlZC9zZXQ/DQo+IA0KPiANCg0KU29ycnkgZm9yIHJlcGx5IHRvIHlvdSBzbyBsYXRlci4gdGhp
cyBkcml2ZXIgbmVlZCB0byBiZSBlbmFibGUgZXhwbGljaXRseSB3aGVuIElNWCBzb2MgaXMgYnVp
bHQuDQoNCkJSDQo+ID4gKwlkZXBlbmRzIG9uIChBUk0gfHwgQVJNNjQpICYmIENMS0RFVl9MT09L
VVANCj4gPiArCXNlbGVjdCBDTEtTUkNfTU1JTw0KPiA+ICsJaGVscA0KPiA+ICsJICBFbmFibGUg
dGhpcyBvcHRpb24gdG8gdXNlIElNWCBzeXN0ZW0gY291bnRlciB0aW1lciBhcw0KPiA+ICsJICBj
bG9ja3NvdXJjZS4NCj4gPiArDQo+ID4gIGNvbmZpZyBDTEtTUkNfU1RfTFBDDQo+ID4gIAlib29s
ICJMb3cgcG93ZXIgY2xvY2tzb3VyY2UgZm91bmQgaW4gdGhlIExQQyIgaWYgQ09NUElMRV9URVNU
DQo+ID4gIAlzZWxlY3QgVElNRVJfT0YgaWYgT0YNCj4gDQo+IHRoYW5rcywNCj4gLS0NCj4gflJh
bmR5DQo=

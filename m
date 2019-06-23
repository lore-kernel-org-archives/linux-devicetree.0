From: Anson Huang <anson.huang@nxp.com>
Subject: RE: [PATCH 3/3] arm64: dts: imx8mq: Add system counter node
Date: Sun, 23 Jun 2019 11:24:44 +0000
Message-ID: <DB3PR0402MB39167752236F0DD5316F4AACF5E10@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <20190621082838.12630-1-Anson.Huang@nxp.com>
 <20190621082838.12630-3-Anson.Huang@nxp.com>
 <6c632476-9ecd-d6cc-b543-a28576c06a0c@posteo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <6c632476-9ecd-d6cc-b543-a28576c06a0c@posteo.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Kepplinger <martink@posteo.de>, "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, Abel Vesa <abel.vesa@nxp.com>, "ccaione@baylibre.com" <ccaione@baylibre.com>, "angus@akkea.ca" <angus@akkea.ca>, "andrew.smirnov@gmail.com" <andrew.smirnov@gmail.com>, "agx@sigxcpu.org" <agx@sigxcpu.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>"devicetree@vger.kernel.org" <de>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

SGksIE1hcnRpbg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE1hcnRp
biBLZXBwbGluZ2VyIDxtYXJ0aW5rQHBvc3Rlby5kZT4NCj4gU2VudDogU2F0dXJkYXksIEp1bmUg
MjIsIDIwMTkgMTA6MTYgUE0NCj4gVG86IEFuc29uIEh1YW5nIDxhbnNvbi5odWFuZ0BueHAuY29t
PjsgZGFuaWVsLmxlemNhbm9AbGluYXJvLm9yZzsNCj4gdGdseEBsaW51dHJvbml4LmRlOyByb2Jo
K2R0QGtlcm5lbC5vcmc7IG1hcmsucnV0bGFuZEBhcm0uY29tOw0KPiBzaGF3bmd1b0BrZXJuZWwu
b3JnOyBzLmhhdWVyQHBlbmd1dHJvbml4LmRlOyBrZXJuZWxAcGVuZ3V0cm9uaXguZGU7DQo+IGZl
c3RldmFtQGdtYWlsLmNvbTsgbC5zdGFjaEBwZW5ndXRyb25peC5kZTsgQWJlbCBWZXNhDQo+IDxh
YmVsLnZlc2FAbnhwLmNvbT47IGNjYWlvbmVAYmF5bGlicmUuY29tOyBhbmd1c0Bha2tlYS5jYTsN
Cj4gYW5kcmV3LnNtaXJub3ZAZ21haWwuY29tOyBhZ3hAc2lneGNwdS5vcmc7IGxpbnV4LQ0KPiBr
ZXJuZWxAdmdlci5rZXJuZWwub3JnOyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgbGludXgt
YXJtLQ0KPiBrZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPiBDYzogZGwtbGludXgtaW14IDxs
aW51eC1pbXhAbnhwLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCAzLzNdIGFybTY0OiBkdHM6
IGlteDhtcTogQWRkIHN5c3RlbSBjb3VudGVyIG5vZGUNCj4gDQo+IE9uIDIxLjA2LjE5IDEwOjI4
LCBBbnNvbi5IdWFuZ0BueHAuY29tIHdyb3RlOg0KPiA+IEZyb206IEFuc29uIEh1YW5nIDxBbnNv
bi5IdWFuZ0BueHAuY29tPg0KPiA+DQo+ID4gQWRkIGkuTVg4TVEgc3lzdGVtIGNvdW50ZXIgbm9k
ZSB0byBlbmFibGUgdGltZXItaW14LXN5c2N0ciBicm9hZGNhc3QNCj4gPiB0aW1lciBkcml2ZXIu
DQo+IA0KPiB3aXRoIHRoZXNlIGNoYW5nZXMgYW5kIFRJTUVSX0lNWF9TWVNfQ1RSIHNlbGVjdGVk
LCBJIGRvbid0IHNlZSBjcHVpZGxlDQo+IHdvcmtpbmcgeWV0ICh3aGljaCBpcyB3aGF0IEkgd2Fu
dCB0byBhY2hpZXZlIG9uIGlteDhtcSkuIE1pZ2h0IHRoZXJlIGJlIGENCj4gc3lzdGVtIGNvdW50
ZXIgY2xvY2sgZGVmaW5pdGlvbiBvciBhbnl0aGluZyBlbHNlIG1pc3Npbmc/DQoNCmkuTVg4TVEg
aXMgZGlmZmVyZW50IGFib3V0IHN5c3RlbSBjb3VudGVyIGVuYWJsZW1lbnQsIHdpdGggdGhpcyBw
YXRjaCBzZXJpZXMsDQpubyBuZWVkIHRvIGhhdmUgc3lzdGVtIGNvdW50ZXIgY2xvY2sgZGVmaW5p
dGlvbiwgdGhpcyBwYXRjaCBpcyBqdXN0IHRvIGVuYWJsZSB0aGUNCnN5c3RlbSBjb3VudGVyIGFz
IGJyb2FkY2FzdCB0aW1lciwgaXQgaXMgbmVjZXNzYXJ5IGZvciBmdXJ0aGVyIHN1cHBvcnQgb2Yg
Y3B1LWlkbGUsDQp0byBlbmFibGUgY3B1LWlkbGUsIGFub3RoZXIgRFQgcGF0Y2ggaXMgbmVlZGVk
IHRvIGFkZCBpZGxlIG5vZGUsIGJ1dCBhcyBmYXIgYXMgIEkNCmtub3csIEFiZWwgaXMgd29ya2lu
ZyBvbiB0aGUgd29ya2Fyb3VuZCBvZiB0aGUgaS5NWDhNUSBjcHUtaWRsZSwgSSBkb24ndCBrbm93
DQppZiBpdCBpcyBwaWNrZWQgdXAgb3IgTk9ULCBzbyBJIGJlbGlldmUgdGhlIGNwdS1pZGxlIHdp
bGwgYmUgZW5hYmxlZCBsYXRlciBmb3IgaS5NWDhNUQ0KYnkgQWJlbC4NCg0KVGhhbmtzLA0KQW5z
b24uDQoNCj4gDQo+IHRoYW5rcywNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtYXJ0
aW4NCj4gDQoNCg==

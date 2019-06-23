Return-Path: <SRS0=nc6M=UW=nxp.com=anson.huang@kernel.org>
From: Anson Huang <anson.huang@nxp.com>
Subject: RE: [PATCH 4/4] arm64: dts: imx8mm: Add system counter node
Date: Sun, 23 Jun 2019 11:20:34 +0000
Message-ID: 
 <DB3PR0402MB39164587E2F6F56DBB47BCE2F5E10@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <20190621070720.12395-1-Anson.Huang@nxp.com>
 <20190621070720.12395-4-Anson.Huang@nxp.com>
 <9f411a1c-50d2-e26b-a4e6-83e02b626378@posteo.de>
In-Reply-To: <9f411a1c-50d2-e26b-a4e6-83e02b626378@posteo.de>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
To: Martin Kepplinger <martink@posteo.de>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will@kernel.org" <will@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>, Leonard Crestez <leonard.crestez@nxp.com>, Aisheng Dong <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, Peng Fan <peng.fan@nxp.com>, Abel Vesa <abel.vesa@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

SGksIE1hcnRpbg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE1hcnRp
biBLZXBwbGluZ2VyIDxtYXJ0aW5rQHBvc3Rlby5kZT4NCj4gU2VudDogU2F0dXJkYXksIEp1bmUg
MjIsIDIwMTkgODoxMCBQTQ0KPiBUbzogQW5zb24gSHVhbmcgPGFuc29uLmh1YW5nQG54cC5jb20+
OyBjYXRhbGluLm1hcmluYXNAYXJtLmNvbTsNCj4gd2lsbEBrZXJuZWwub3JnOyByb2JoK2R0QGtl
cm5lbC5vcmc7IG1hcmsucnV0bGFuZEBhcm0uY29tOw0KPiBzaGF3bmd1b0BrZXJuZWwub3JnOyBz
LmhhdWVyQHBlbmd1dHJvbml4LmRlOyBrZXJuZWxAcGVuZ3V0cm9uaXguZGU7DQo+IGZlc3RldmFt
QGdtYWlsLmNvbTsgbXR1cnF1ZXR0ZUBiYXlsaWJyZS5jb207IHNib3lkQGtlcm5lbC5vcmc7DQo+
IExlb25hcmQgQ3Jlc3RleiA8bGVvbmFyZC5jcmVzdGV6QG54cC5jb20+OyBBaXNoZW5nIERvbmcN
Cj4gPGFpc2hlbmcuZG9uZ0BueHAuY29tPjsgSmFja3kgQmFpIDxwaW5nLmJhaUBueHAuY29tPjsg
RGFuaWVsIEJhbHV0YQ0KPiA8ZGFuaWVsLmJhbHV0YUBueHAuY29tPjsgUGVuZyBGYW4gPHBlbmcu
ZmFuQG54cC5jb20+OyBBYmVsIFZlc2ENCj4gPGFiZWwudmVzYUBueHAuY29tPjsgbGludXgtYXJt
LWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBsaW51eC0NCj4ga2VybmVsQHZnZXIua2VybmVs
Lm9yZzsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LQ0KPiBjbGtAdmdlci5rZXJu
ZWwub3JnDQo+IENjOiBkbC1saW51eC1pbXggPGxpbnV4LWlteEBueHAuY29tPg0KPiBTdWJqZWN0
OiBSZTogW1BBVENIIDQvNF0gYXJtNjQ6IGR0czogaW14OG1tOiBBZGQgc3lzdGVtIGNvdW50ZXIg
bm9kZQ0KPiANCj4gT24gMjEuMDYuMTkgMDk6MDcsIEFuc29uLkh1YW5nQG54cC5jb20gd3JvdGU6
DQo+ID4gRnJvbTogQW5zb24gSHVhbmcgPEFuc29uLkh1YW5nQG54cC5jb20+DQo+ID4NCj4gPiBB
ZGQgaS5NWDhNTSBzeXN0ZW0gY291bnRlciBub2RlIHRvIGVuYWJsZSB0aW1lci1pbXgtc3lzY3Ry
IGJyb2FkY2FzdA0KPiA+IHRpbWVyIGRyaXZlci4NCj4gPg0KPiANCj4gDQo+IGRvIHdlIG5lZWQg
c2ltaWxhciBhZGRpdGlvbnMgdG8gaW14OG1xPyBJZiBzbywgSSB0aGluayB0aGVzZSB3b3VsZCBm
aXQgaW4gaGVyZQ0KPiB0b28uDQoNCmkuTVg4TVEgaGFzIHNvbWV0aGluZyBkaWZmZXJlbnQgYWJv
dXQgc3lzdGVtIGNvdW50ZXIgZHJpdmVyIGVuYWJsZW1lbnQsIEkgZGlkDQppdCBpbiBhbm90aGVy
IHBhdGNoIHNlcmllcy4NCg0KQW5zb24uDQoNCj4gDQo+IHRoYW5rcywNCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBtYXJ0aW4NCg0K

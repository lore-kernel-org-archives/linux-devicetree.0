Return-Path: <SRS0=cT4u=UX=nxp.com=anson.huang@kernel.org>
From: Anson Huang <anson.huang@nxp.com>
Subject: RE: [PATCH V15 1/5] dt-bindings: fsl: scu: add thermal binding
Date: Mon, 24 Jun 2019 08:04:22 +0000
Message-ID: 
 <DB3PR0402MB39162C5B5AF828B127DD871EF5E00@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <20190618021820.14885-1-Anson.Huang@nxp.com>
In-Reply-To: <20190618021820.14885-1-Anson.Huang@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
To: Anson Huang <anson.huang@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "corbet@lwn.net" <corbet@lwn.net>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "rui.zhang@intel.com" <rui.zhang@intel.com>, "edubezval@gmail.com" <edubezval@gmail.com>, "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, Aisheng Dong <aisheng.dong@nxp.com>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, Peng Fan <peng.fan@nxp.com>, "mchehab+samsung@kernel.org" <mchehab+samsung@kernel.org>, "linux@roeck-us.net" <linux@roeck-us.net>, Daniel Baluta <daniel.baluta@nxp.com>, "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "olof@lixom.net" <olof@lixom.net>, "jagan@amarulasolutions.com" <jagan@amarulasolutions.com>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, Leonard Crestez <leonard.crestez@nxp.com>, "dinguyen@kernel.org" <dinguyen@kernel.org>, "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

SGksIERhbmllbC9SdWkvRWR1YXJkbw0KCUNvdWxkIHlvdSBwbGVhc2UgdGFrZSBhIGxvb2sgYXQg
dGhpcyBwYXRjaCBzZXJpZXM/IA0KDQpBbnNvbg0KDQo+IEZyb206IEFuc29uIEh1YW5nIDxBbnNv
bi5IdWFuZ0BueHAuY29tPg0KPiANCj4gTlhQIGkuTVg4UVhQIGlzIGFuIEFSTXY4IFNvQyB3aXRo
IGEgQ29ydGV4LU00IGNvcmUgaW5zaWRlIGFzIHN5c3RlbQ0KPiBjb250cm9sbGVyLCB0aGUgc3lz
dGVtIGNvbnRyb2xsZXIgaXMgaW4gY2hhcmdlIG9mIHN5c3RlbSBwb3dlciwgY2xvY2sgYW5kDQo+
IHRoZXJtYWwgc2Vuc29ycyBldGMuIG1hbmFnZW1lbnQsIExpbnV4IGtlcm5lbCBoYXMgdG8gY29t
bXVuaWNhdGUgd2l0aA0KPiBzeXN0ZW0gY29udHJvbGxlciB2aWEgTVUgKG1lc3NhZ2UgdW5pdCkg
SVBDIHRvIGdldCB0ZW1wZXJhdHVyZSBmcm9tIHRoZXJtYWwNCj4gc2Vuc29ycywgdGhpcyBwYXRj
aCBhZGRzIGJpbmRpbmcgZG9jIGZvciBpLk1YIHN5c3RlbSBjb250cm9sbGVyIHRoZXJtYWwNCj4g
ZHJpdmVyLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQW5zb24gSHVhbmcgPEFuc29uLkh1YW5nQG54
cC5jb20+DQo+IFJldmlld2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPg0KPiBS
ZXZpZXdlZC1ieTogRG9uZyBBaXNoZW5nIDxhaXNoZW5nLmRvbmdAbnhwLmNvbT4NCj4gLS0tDQo+
IE5vIGNoYW5nZS4NCj4gLS0tDQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vZnJlZXNj
YWxlL2ZzbCxzY3UudHh0ICAgICAgICB8IDE2ICsrKysrKysrKysrKysrKysNCj4gIDEgZmlsZSBj
aGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9mcmVlc2NhbGUvZnNsLHNjdS50eHQNCj4gYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2ZyZWVzY2FsZS9mc2wsc2N1LnR4dA0K
PiBpbmRleCBhNTc1ZTQyLi5mYzM4NDRlIDEwMDY0NA0KPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvYXJtL2ZyZWVzY2FsZS9mc2wsc2N1LnR4dA0KPiArKysgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2ZyZWVzY2FsZS9mc2wsc2N1LnR4dA0K
PiBAQCAtMTU1LDYgKzE1NSwxNyBAQCBSZXF1aXJlZCBwcm9wZXJ0aWVzOg0KPiAgT3B0aW9uYWwg
cHJvcGVydGllczoNCj4gIC0gdGltZW91dC1zZWM6IGNvbnRhaW5zIHRoZSB3YXRjaGRvZyB0aW1l
b3V0IGluIHNlY29uZHMuDQo+IA0KPiArVGhlcm1hbCBiaW5kaW5ncyBiYXNlZCBvbiBTQ1UgTWVz
c2FnZSBQcm90b2NvbA0KPiArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICsNCj4gK1JlcXVpcmVkIHByb3BlcnRpZXM6DQo+ICst
IGNvbXBhdGlibGU6CQkJU2hvdWxkIGJlIDoNCj4gKwkJCQkgICJmc2wsaW14OHF4cC1zYy10aGVy
bWFsIg0KPiArCQkJCWZvbGxvd2VkIGJ5ICJmc2wsaW14LXNjLXRoZXJtYWwiOw0KPiArDQo+ICst
ICN0aGVybWFsLXNlbnNvci1jZWxsczoJU2VlDQo+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy90aGVybWFsL3RoZXJtYWwudHh0DQo+ICsJCQkJZm9yIGEgZGVzY3JpcHRpb24uDQo+
ICsNCj4gIEV4YW1wbGUgKGlteDhxeHApOg0KPiAgLS0tLS0tLS0tLS0tLQ0KPiAgYWxpYXNlcyB7
DQo+IEBAIC0yMjIsNiArMjMzLDExIEBAIGZpcm13YXJlIHsNCj4gIAkJCWNvbXBhdGlibGUgPSAi
ZnNsLGlteDhxeHAtc2Mtd2R0IiwgImZzbCxpbXgtc2Mtd2R0IjsNCj4gIAkJCXRpbWVvdXQtc2Vj
ID0gPDYwPjsNCj4gIAkJfTsNCj4gKw0KPiArCQl0c2VuczogdGhlcm1hbC1zZW5zb3Igew0KPiAr
CQkJY29tcGF0aWJsZSA9ICJmc2wsaW14OHF4cC1zYy10aGVybWFsIiwgImZzbCxpbXgtc2MtDQo+
IHRoZXJtYWwiOw0KPiArCQkJI3RoZXJtYWwtc2Vuc29yLWNlbGxzID0gPDE+Ow0KPiArCQl9Ow0K
PiAgCX07DQo+ICB9Ow0KPiANCj4gLS0NCj4gMi43LjQNCg0K

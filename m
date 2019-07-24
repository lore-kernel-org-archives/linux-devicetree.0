Return-Path: <SRS0=igU2=VV=nxp.com=anson.huang@kernel.org>
From: Anson Huang <anson.huang@nxp.com>
Subject: RE: [PATCH V15 1/5] dt-bindings: fsl: scu: add thermal binding
Date: Wed, 24 Jul 2019 03:16:59 +0000
Message-ID: 
 <DB3PR0402MB39162EB555CD7AE75D58C582F5C60@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <20190618021820.14885-1-Anson.Huang@nxp.com>
 <DB3PR0402MB39162C5B5AF828B127DD871EF5E00@DB3PR0402MB3916.eurprd04.prod.outlook.com>
In-Reply-To: 
 <DB3PR0402MB39162C5B5AF828B127DD871EF5E00@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
To: Anson Huang <anson.huang@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "corbet@lwn.net" <corbet@lwn.net>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "rui.zhang@intel.com" <rui.zhang@intel.com>, "edubezval@gmail.com" <edubezval@gmail.com>, "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, Aisheng Dong <aisheng.dong@nxp.com>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, Peng Fan <peng.fan@nxp.com>, "mchehab+samsung@kernel.org" <mchehab+samsung@kernel.org>, "linux@roeck-us.net" <linux@roeck-us.net>, Daniel Baluta <daniel.baluta@nxp.com>, "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "olof@lixom.net" <olof@lixom.net>, "jagan@amarulasolutions.com" <jagan@amarulasolutions.com>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, Leonard Crestez <leonard.crestez@nxp.com>, "dinguyen@kernel.org" <dinguyen@kernel.org>, "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

UGluZy4uLg0KDQo+IEhpLCBEYW5pZWwvUnVpL0VkdWFyZG8NCj4gCUNvdWxkIHlvdSBwbGVhc2Ug
dGFrZSBhIGxvb2sgYXQgdGhpcyBwYXRjaCBzZXJpZXM/DQo+IA0KPiBBbnNvbg0KPiANCj4gPiBG
cm9tOiBBbnNvbiBIdWFuZyA8QW5zb24uSHVhbmdAbnhwLmNvbT4NCj4gPg0KPiA+IE5YUCBpLk1Y
OFFYUCBpcyBhbiBBUk12OCBTb0Mgd2l0aCBhIENvcnRleC1NNCBjb3JlIGluc2lkZSBhcyBzeXN0
ZW0NCj4gPiBjb250cm9sbGVyLCB0aGUgc3lzdGVtIGNvbnRyb2xsZXIgaXMgaW4gY2hhcmdlIG9m
IHN5c3RlbSBwb3dlciwgY2xvY2sNCj4gPiBhbmQgdGhlcm1hbCBzZW5zb3JzIGV0Yy4gbWFuYWdl
bWVudCwgTGludXgga2VybmVsIGhhcyB0byBjb21tdW5pY2F0ZQ0KPiA+IHdpdGggc3lzdGVtIGNv
bnRyb2xsZXIgdmlhIE1VIChtZXNzYWdlIHVuaXQpIElQQyB0byBnZXQgdGVtcGVyYXR1cmUNCj4g
PiBmcm9tIHRoZXJtYWwgc2Vuc29ycywgdGhpcyBwYXRjaCBhZGRzIGJpbmRpbmcgZG9jIGZvciBp
Lk1YIHN5c3RlbQ0KPiA+IGNvbnRyb2xsZXIgdGhlcm1hbCBkcml2ZXIuDQo+ID4NCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBBbnNvbiBIdWFuZyA8QW5zb24uSHVhbmdAbnhwLmNvbT4NCj4gPiBSZXZpZXdl
ZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4NCj4gPiBSZXZpZXdlZC1ieTogRG9u
ZyBBaXNoZW5nIDxhaXNoZW5nLmRvbmdAbnhwLmNvbT4NCj4gPiAtLS0NCj4gPiBObyBjaGFuZ2Uu
DQo+ID4gLS0tDQo+ID4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9mcmVlc2NhbGUvZnNs
LHNjdS50eHQgICAgICAgIHwgMTYNCj4gKysrKysrKysrKysrKysrKw0KPiA+ICAxIGZpbGUgY2hh
bmdlZCwgMTYgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdA0KPiA+IGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9mcmVlc2NhbGUvZnNsLHNjdS50eHQNCj4g
PiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vZnJlZXNjYWxlL2ZzbCxz
Y3UudHh0DQo+ID4gaW5kZXggYTU3NWU0Mi4uZmMzODQ0ZSAxMDA2NDQNCj4gPiAtLS0gYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2ZyZWVzY2FsZS9mc2wsc2N1LnR4dA0K
PiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vZnJlZXNjYWxl
L2ZzbCxzY3UudHh0DQo+ID4gQEAgLTE1NSw2ICsxNTUsMTcgQEAgUmVxdWlyZWQgcHJvcGVydGll
czoNCj4gPiAgT3B0aW9uYWwgcHJvcGVydGllczoNCj4gPiAgLSB0aW1lb3V0LXNlYzogY29udGFp
bnMgdGhlIHdhdGNoZG9nIHRpbWVvdXQgaW4gc2Vjb25kcy4NCj4gPg0KPiA+ICtUaGVybWFsIGJp
bmRpbmdzIGJhc2VkIG9uIFNDVSBNZXNzYWdlIFByb3RvY29sDQo+ID4gKy0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+ICsNCj4g
PiArUmVxdWlyZWQgcHJvcGVydGllczoNCj4gPiArLSBjb21wYXRpYmxlOgkJCVNob3VsZCBiZSA6
DQo+ID4gKwkJCQkgICJmc2wsaW14OHF4cC1zYy10aGVybWFsIg0KPiA+ICsJCQkJZm9sbG93ZWQg
YnkgImZzbCxpbXgtc2MtdGhlcm1hbCI7DQo+ID4gKw0KPiA+ICstICN0aGVybWFsLXNlbnNvci1j
ZWxsczoJU2VlDQo+ID4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3RoZXJtYWwv
dGhlcm1hbC50eHQNCj4gPiArCQkJCWZvciBhIGRlc2NyaXB0aW9uLg0KPiA+ICsNCj4gPiAgRXhh
bXBsZSAoaW14OHF4cCk6DQo+ID4gIC0tLS0tLS0tLS0tLS0NCj4gPiAgYWxpYXNlcyB7DQo+ID4g
QEAgLTIyMiw2ICsyMzMsMTEgQEAgZmlybXdhcmUgew0KPiA+ICAJCQljb21wYXRpYmxlID0gImZz
bCxpbXg4cXhwLXNjLXdkdCIsICJmc2wsaW14LXNjLXdkdCI7DQo+ID4gIAkJCXRpbWVvdXQtc2Vj
ID0gPDYwPjsNCj4gPiAgCQl9Ow0KPiA+ICsNCj4gPiArCQl0c2VuczogdGhlcm1hbC1zZW5zb3Ig
ew0KPiA+ICsJCQljb21wYXRpYmxlID0gImZzbCxpbXg4cXhwLXNjLXRoZXJtYWwiLCAiZnNsLGlt
eC1zYy0NCj4gPiB0aGVybWFsIjsNCj4gPiArCQkJI3RoZXJtYWwtc2Vuc29yLWNlbGxzID0gPDE+
Ow0KPiA+ICsJCX07DQo+ID4gIAl9Ow0KPiA+ICB9Ow0KPiA+DQo+ID4gLS0NCj4gPiAyLjcuNA0K
DQo=

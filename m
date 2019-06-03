Return-Path: <SRS0=P4Im=UC=nxp.com=anson.huang@kernel.org>
From: Anson Huang <anson.huang@nxp.com>
Subject: RE: [PATCH V2 2/3] clk: imx: Add support for i.MX8MN clock driver
Date: Mon, 3 Jun 2019 09:01:33 +0000
Message-ID: 
 <DB3PR0402MB39162498C890AB92D9722595F5140@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <20190603013503.40626-1-Anson.Huang@nxp.com>
 <20190603013503.40626-2-Anson.Huang@nxp.com>
 <VI1PR04MB5055D6EB38E84E370E881425EE140@VI1PR04MB5055.eurprd04.prod.outlook.com>
In-Reply-To: 
 <VI1PR04MB5055D6EB38E84E370E881425EE140@VI1PR04MB5055.eurprd04.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
To: Leonard Crestez <leonard.crestez@nxp.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>, "olof@lixom.net" <olof@lixom.net>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "jagan@amarulasolutions.com" <jagan@amarulasolutions.com>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "dinguyen@kernel.org" <dinguyen@kernel.org>, "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>, Aisheng Dong <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, Abel Vesa <abel.vesa@nxp.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGVvbmFyZCBDcmVzdGV6
DQo+IFNlbnQ6IE1vbmRheSwgSnVuZSAzLCAyMDE5IDQ6NDUgUE0NCj4gVG86IEFuc29uIEh1YW5n
IDxhbnNvbi5odWFuZ0BueHAuY29tPjsgbXR1cnF1ZXR0ZUBiYXlsaWJyZS5jb207DQo+IHNib3lk
QGtlcm5lbC5vcmc7IHJvYmgrZHRAa2VybmVsLm9yZzsgbWFyay5ydXRsYW5kQGFybS5jb207DQo+
IHNoYXduZ3VvQGtlcm5lbC5vcmc7IHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU7IGtlcm5lbEBwZW5n
dXRyb25peC5kZTsNCj4gZmVzdGV2YW1AZ21haWwuY29tOyBjYXRhbGluLm1hcmluYXNAYXJtLmNv
bTsgd2lsbC5kZWFjb25AYXJtLmNvbTsNCj4gbWF4aW1lLnJpcGFyZEBib290bGluLmNvbTsgb2xv
ZkBsaXhvbS5uZXQ7IGhvcm1zK3JlbmVzYXNAdmVyZ2UubmV0LmF1Ow0KPiBqYWdhbkBhbWFydWxh
c29sdXRpb25zLmNvbTsgYmpvcm4uYW5kZXJzc29uQGxpbmFyby5vcmc7DQo+IGRpbmd1eWVuQGtl
cm5lbC5vcmc7IGVucmljLmJhbGxldGJvQGNvbGxhYm9yYS5jb207IEFpc2hlbmcgRG9uZw0KPiA8
YWlzaGVuZy5kb25nQG54cC5jb20+OyBKYWNreSBCYWkgPHBpbmcuYmFpQG54cC5jb20+OyBBYmVs
IFZlc2ENCj4gPGFiZWwudmVzYUBueHAuY29tPjsgbC5zdGFjaEBwZW5ndXRyb25peC5kZTsgbGlu
dXgtY2xrQHZnZXIua2VybmVsLm9yZzsNCj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxp
bnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgtDQo+IGtlcm5lbEB2Z2Vy
Lmtlcm5lbC5vcmcNCj4gQ2M6IGRsLWxpbnV4LWlteCA8bGludXgtaW14QG54cC5jb20+DQo+IFN1
YmplY3Q6IFJlOiBbUEFUQ0ggVjIgMi8zXSBjbGs6IGlteDogQWRkIHN1cHBvcnQgZm9yIGkuTVg4
TU4gY2xvY2sgZHJpdmVyDQo+IA0KPiBPbiA2LzMvMjAxOSA0OjMzIEFNLCBBbnNvbi5IdWFuZ0Bu
eHAuY29tIHdyb3RlOg0KPiA+IEZyb206IEFuc29uIEh1YW5nIDxBbnNvbi5IdWFuZ0BueHAuY29t
Pg0KPiA+DQo+ID4gVGhpcyBwYXRjaCBhZGRzIGkuTVg4TU4gY2xvY2sgZHJpdmVyIHN1cHBvcnQu
DQo+IA0KPiA+ICsjaW5jbHVkZSAiY2xrLmgiDQo+ID4gKw0KPiA+ICsjZGVmaW5lIFBMTF8xNDE2
WF9SQVRFKF9yYXRlLCBfbSwgX3AsIF9zKQkJXA0KPiA+ICsJewkJCQkJCVwNCj4gPiArCQkucmF0
ZQk9CShfcmF0ZSksCQlcDQo+ID4gKwkJLm1kaXYJPQkoX20pLAkJCVwNCj4gPiArCQkucGRpdgk9
CShfcCksCQkJXA0KPiA+ICsJCS5zZGl2CT0JKF9zKSwJCQlcDQo+ID4gKwl9DQo+ID4gKw0KPiA+
ICsjZGVmaW5lIFBMTF8xNDQzWF9SQVRFKF9yYXRlLCBfbSwgX3AsIF9zLCBfaykJCVwNCj4gPiAr
CXsJCQkJCQlcDQo+ID4gKwkJLnJhdGUJPQkoX3JhdGUpLAkJXA0KPiA+ICsJCS5tZGl2CT0JKF9t
KSwJCQlcDQo+ID4gKwkJLnBkaXYJPQkoX3ApLAkJCVwNCj4gPiArCQkuc2Rpdgk9CShfcyksCQkJ
XA0KPiA+ICsJCS5rZGl2CT0JKF9rKSwJCQlcDQo+ID4gKwl9DQo+IA0KPiBUaGVzZSBtYWNyb3Mg
YXJlIHNoYXJlZCB3aXRoIGNsay1pbXg4bW0gKGFuZCBwZXJoYXBzIHNvbWUgZnV0dXJlIGNoaXBz
KQ0KPiBzbyB0aGV5IHNob3VsZCBiZSBtb3ZlZCB0byBkcml2ZXIvY2xrL2lteC9jbGsuaA0KDQpP
Sywgd2lsbCBtb3ZlIHRoZW0gaW50byBjbGsuaCBpbiBWMy4NCg0KQW5zb24uDQo=

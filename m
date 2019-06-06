From: Anson Huang <anson.huang@nxp.com>
Subject: RE: [PATCH V3 1/4] dt-bindings: imx: Add clock binding doc for
 i.MX8MN
Date: Thu, 6 Jun 2019 01:14:33 +0000
Message-ID: <DB3PR0402MB39165AC38B4F45CE74F57EE7F5170@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <20190604015928.23157-1-Anson.Huang@nxp.com>
 <20190605233319.06CE62083E@mail.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190605233319.06CE62083E@mail.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abel.vesa@nxp.com>, Aisheng Dong <aisheng.dong@nxp.com>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "dinguyen@kernel.org" <dinguyen@kernel.org>, "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>, "festevam@gmail.com" <festevam@gmail.com>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "jagan@amarulasolutions.com" <jagan@amarulasolutions.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, Leonard Crestez <leonard.crestez@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-clk@v
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

SGksIFN0ZXBoZW4NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVw
aGVuIEJveWQgPHNib3lkQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IFRodXJzZGF5LCBKdW5lIDYsIDIw
MTkgNzozMyBBTQ0KPiBUbzogQW5zb24gSHVhbmcgPGFuc29uLmh1YW5nQG54cC5jb20+OyBBYmVs
IFZlc2ENCj4gPGFiZWwudmVzYUBueHAuY29tPjsgQWlzaGVuZyBEb25nIDxhaXNoZW5nLmRvbmdA
bnhwLmNvbT47DQo+IGJqb3JuLmFuZGVyc3NvbkBsaW5hcm8ub3JnOyBjYXRhbGluLm1hcmluYXNA
YXJtLmNvbTsNCj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGRpbmd1eWVuQGtlcm5lbC5v
cmc7DQo+IGVucmljLmJhbGxldGJvQGNvbGxhYm9yYS5jb207IGZlc3RldmFtQGdtYWlsLmNvbTsN
Cj4gaG9ybXMrcmVuZXNhc0B2ZXJnZS5uZXQuYXU7IGphZ2FuQGFtYXJ1bGFzb2x1dGlvbnMuY29t
Ow0KPiBrZXJuZWxAcGVuZ3V0cm9uaXguZGU7IGwuc3RhY2hAcGVuZ3V0cm9uaXguZGU7IExlb25h
cmQgQ3Jlc3Rleg0KPiA8bGVvbmFyZC5jcmVzdGV6QG54cC5jb20+OyBsaW51eC1hcm0ta2VybmVs
QGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4LQ0KPiBjbGtAdmdlci5rZXJuZWwub3JnOyBsaW51
eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBtYXJrLnJ1dGxhbmRAYXJtLmNvbTsNCj4gbWF4aW1l
LnJpcGFyZEBib290bGluLmNvbTsgbXR1cnF1ZXR0ZUBiYXlsaWJyZS5jb207IG9sb2ZAbGl4b20u
bmV0Ow0KPiBKYWNreSBCYWkgPHBpbmcuYmFpQG54cC5jb20+OyByb2JoK2R0QGtlcm5lbC5vcmc7
DQo+IHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU7IHNoYXduZ3VvQGtlcm5lbC5vcmc7IHdpbGwuZGVh
Y29uQGFybS5jb20NCj4gQ2M6IGRsLWxpbnV4LWlteCA8bGludXgtaW14QG54cC5jb20+DQo+IFN1
YmplY3Q6IFJlOiBbUEFUQ0ggVjMgMS80XSBkdC1iaW5kaW5nczogaW14OiBBZGQgY2xvY2sgYmlu
ZGluZyBkb2MgZm9yDQo+IGkuTVg4TU4NCj4gDQo+IFF1b3RpbmcgQW5zb24uSHVhbmdAbnhwLmNv
bSAoMjAxOS0wNi0wMyAxODo1OToyNSkNCj4gPiBGcm9tOiBBbnNvbiBIdWFuZyA8QW5zb24uSHVh
bmdAbnhwLmNvbT4NCj4gPg0KPiA+IEFkZCB0aGUgY2xvY2sgYmluZGluZyBkb2MgZm9yIGkuTVg4
TU4uDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBBbnNvbiBIdWFuZyA8QW5zb24uSHVhbmdAbnhw
LmNvbT4NCj4gPiAtLS0NCj4gPiBObyBjaGFuZ2VzLg0KPiA+IC0tLQ0KPiA+ICAuLi4vZGV2aWNl
dHJlZS9iaW5kaW5ncy9jbG9jay9pbXg4bW4tY2xvY2sudHh0ICAgICB8ICAyOSArKysNCj4gDQo+
IENhbiB0aGlzIGJlIHlhbWw/DQoNCk9LLCBJIHdpbGwgdHJ5IHRvIHVzZSB5YW1sIGluIFY0Lg0K
DQpUaGFua3MsDQpBbnNvbi4NCg0KPiANCj4gPiAgaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9p
bXg4bW4tY2xvY2suaCAgICAgICAgICAgfCAyMTUNCj4gKysrKysrKysrKysrKysrKysrKysrDQo+
ID4gIDIgZmlsZXMgY2hhbmdlZCwgMjQ0IGluc2VydGlvbnMoKykNCj4gPiAgY3JlYXRlIG1vZGUg
MTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay9pbXg4bW4tDQo+
IGNsb2NrLnR4dA0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9kdC1iaW5kaW5ncy9j
bG9jay9pbXg4bW4tY2xvY2suaA0KPiA+DQo=

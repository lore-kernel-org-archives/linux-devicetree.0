From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: RE: [PATCH 4/4] arm64: dts: imx: add i.MX8QXP ocotp support
Date: Mon, 6 May 2019 08:42:54 +0000
Message-ID: <AM0PR04MB421175C951494A6F8E83917980300@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <20190505134130.28071-1-peng.fan@nxp.com>
 <20190505134130.28071-4-peng.fan@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190505134130.28071-4-peng.fan@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Peng Fan <peng.fan@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "srinivas.kandagatla@linaro.org" <srinivas.kandagatla@linaro.org>
Cc: dl-linux-imx <linux-imx@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "van.freenix@gmail.com" <van.freenix@gmail.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Mark Rutland <mark.rutland@arm.com>, Anson Huang <anson.huang@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>
List-Id: devicetree@vger.kernel.org

PiBGcm9tOiBQZW5nIEZhbg0KPiBTZW50OiBTdW5kYXksIE1heSA1LCAyMDE5IDk6MjggUE0NCj4g
U3ViamVjdDogW1BBVENIIDQvNF0gYXJtNjQ6IGR0czogaW14OiBhZGQgaS5NWDhRWFAgb2NvdHAg
c3VwcG9ydA0KPiANCj4gQWRkIGkuTVg4UVhQIG9jb3RwIG5vZGUNCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IFBlbmcgRmFuIDxwZW5nLmZhbkBueHAuY29tPg0KPiBDYzogUm9iIEhlcnJpbmcgPHJvYmgr
ZHRAa2VybmVsLm9yZz4NCj4gQ2M6IE1hcmsgUnV0bGFuZCA8bWFyay5ydXRsYW5kQGFybS5jb20+
DQo+IENjOiBTaGF3biBHdW8gPHNoYXduZ3VvQGtlcm5lbC5vcmc+DQo+IENjOiBTYXNjaGEgSGF1
ZXIgPHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU+DQo+IENjOiBQZW5ndXRyb25peCBLZXJuZWwgVGVh
bSA8a2VybmVsQHBlbmd1dHJvbml4LmRlPg0KPiBDYzogRmFiaW8gRXN0ZXZhbSA8ZmVzdGV2YW1A
Z21haWwuY29tPg0KPiBDYzogTlhQIExpbnV4IFRlYW0gPGxpbnV4LWlteEBueHAuY29tPg0KPiBD
YzogQWlzaGVuZyBEb25nIDxhaXNoZW5nLmRvbmdAbnhwLmNvbT4NCj4gQ2M6IEFuc29uIEh1YW5n
IDxhbnNvbi5odWFuZ0BueHAuY29tPg0KPiBDYzogRGFuaWVsIEJhbHV0YSA8ZGFuaWVsLmJhbHV0
YUBueHAuY29tPg0KPiBDYzogZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcNCj4gQ2M6IGxpbnV4
LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPiAtLS0NCj4gIGFyY2gvYXJtNjQvYm9v
dC9kdHMvZnJlZXNjYWxlL2lteDhxeHAuZHRzaSB8IDYgKysrKysrDQo+ICAxIGZpbGUgY2hhbmdl
ZCwgNiBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0
cy9mcmVlc2NhbGUvaW14OHF4cC5kdHNpDQo+IGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2Nh
bGUvaW14OHF4cC5kdHNpDQo+IGluZGV4IDA2ODNlZTJhNDhhZS4uZjI5OTk4ZDcyNzRhIDEwMDY0
NA0KPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4cXhwLmR0c2kNCj4g
KysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OHF4cC5kdHNpDQo+IEBAIC0x
NDEsNiArMTQxLDEyIEBADQo+ICAJCQljb21wYXRpYmxlID0gImZzbCxpbXg4cXhwLWlvbXV4YyI7
DQo+ICAJCX07DQo+IA0KPiArCQlvY290cDogaW14OHF4LW9jb3RwIHsNCj4gKwkJCSNhZGRyZXNz
LWNlbGxzID0gPDE+Ow0KPiArCQkJI3NpemUtY2VsbHMgPSA8MT47DQo+ICsJCQljb21wYXRpYmxl
ID0gImZzbCxpbXg4cXhwLW9jb3RwIjsNCj4gKwkJfTsNCg0KU2VlIG15IHJlcGx5IG9uIFBhdGNo
IFsxLzRdDQoNClJlZ2FyZHMNCkRvbmcgQWlzaGVuZw0KDQo+ICsNCj4gIAkJcGQ6IGlteDhxeC1w
ZCB7DQo+ICAJCQljb21wYXRpYmxlID0gImZzbCxpbXg4cXhwLXNjdS1wZCI7DQo+ICAJCQkjcG93
ZXItZG9tYWluLWNlbGxzID0gPDE+Ow0KPiAtLQ0KPiAyLjE2LjQNCg0K

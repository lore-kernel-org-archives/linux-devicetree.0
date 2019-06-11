From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: RE: [PATCH 1/3] dt-bindings: imx: Add pinctrl binding doc for i.MX8MN
Date: Tue, 11 Jun 2019 10:00:36 +0000
Message-ID: <AM0PR04MB421171336B9206D02FF6514080ED0@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <20190530030546.9224-1-Anson.Huang@nxp.com>
 <CACRpkdY-35o378Ka+4bgeSPjmq6P8DM872sgTxq2X3dDP9XZHQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdY-35o378Ka+4bgeSPjmq6P8DM872sgTxq2X3dDP9XZHQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Anson Huang <anson.huang@nxp.com>, Rob Herring <robh+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Stefan Agner <stefan@agner.ch>, Sascha Hauer <kernel@pengutronix.de>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Olof Johansson <olof@lixom.net>, Simon Horman <horms+renesas@verge.net.au>, Jagan Teki <jagan@amarulasolutions.com>, Leonard Crestez <leonard.crestez@nxp.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Dinh Nguyen <dinguyen@kernel.org>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

PiBGcm9tOiBMaW51cyBXYWxsZWlqIFttYWlsdG86bGludXMud2FsbGVpakBsaW5hcm8ub3JnXQ0K
PiBTZW50OiBTYXR1cmRheSwgSnVuZSA4LCAyMDE5IDU6MDQgQU0NCj4gDQo+IE9uIFRodSwgTWF5
IDMwLCAyMDE5IGF0IDU6MDQgQU0gPEFuc29uLkh1YW5nQG54cC5jb20+IHdyb3RlOg0KPiANCj4g
PiBGcm9tOiBBbnNvbiBIdWFuZyA8QW5zb24uSHVhbmdAbnhwLmNvbT4NCj4gPg0KPiA+IEFkZCBi
aW5kaW5nIGRvYyBmb3IgaS5NWDhNTiBwaW5jdHJsIGRyaXZlci4NCj4gPg0KPiA+IFNpZ25lZC1v
ZmYtYnk6IEFuc29uIEh1YW5nIDxBbnNvbi5IdWFuZ0BueHAuY29tPg0KPiANCj4gTG9va3MgbW9z
dGx5IE9LIHRvIG1lLCBidXQgSSdkIGxpa2UgdGhlIG1haW50YWluZXJzIHRvIHJldmlldywgc28g
RG9uZyBldCBhbA0KPiBwbGVhc2UgbG9vayBhdCB0aGlzIQ0KPiANCj4gPiArUmVxdWlyZWQgcHJv
cGVydGllczoNCj4gPiArLSBjb21wYXRpYmxlOiAiZnNsLGlteDhtbi1pb211eGMiDQo+IA0KPiBT
byBzaG91bGQgdGhpcyBub3QgYmUgIm54cCxpbXg4bW4taW9tdXhjIg0KPiBvciAibnhwLGZyZWVz
Y2FsZS1pbXg4bW4taW9tdXhjIiBvciBzb21ldGhpbmcgdGhlc2UgZGF5cz8gVGhlIHZlbmRvciBu
YW1lDQo+IGlzIG54cCBpcyBpdCBub3QuDQo+IA0KPiBJIHdhcyBjb21wbGFpbmluZyB0byB0aGUg
RFQgbWFpbnRhaW5lcnMgYXQgb25lIHBvaW50IHRoYXQgdGhlc2UgY29tcGFuaWVzDQo+IHNlZW0g
dG8gYnV5IGVhY2ggb3RoZXIgbGVmdCBhbmQgcmlnaHQgc28gdGhpcyB2ZW5kb3Igbm9tZW5jbGF0
dXJlIGlzIGR1YmlvdXMsDQo+IGJ1dCBJIGd1ZXNzIGF0IGxlYXN0IGl0IHNob3VsZCByZWZsZWN0
IHRoZSB2ZW5kb3IgdGhhdCBwcm9kdWNlZCB0aGUgY2hpcCBvcg0KPiBzb21ldGhpbmcuDQo+IA0K
PiBJZiBldmVyeW9uZSBpcyBoYXBweSB3aXRoICJmc2wsKiIgSSB3aWxsIG5vdCBjb21wbGFpbiB0
aG91Z2guDQo+IChpLmUuIGlmIHRoZSBtYWludGFpbmVycyBBQ0sgaXQuKQ0KDQpXZSBwcmVmZXJy
ZWQgdG8ga2VlcCAiZnNsLCoiIGZvciBGcmVlc2NhbGUgaS5NWCBwcm9kdWN0IGxpbmUgYWNjb3Jk
aW5nIHRvIGxhc3QgZGlzY3Vzc2lvbi4NCkFuZCB3ZSBhbHJlYWR5IGRpZCB0aGlzIHdheSBmb3Ig
bW9zdCBpLk1YIGRldmljZXMuDQoNClNvOg0KQWNrZWQtYnk6IERvbmcgQWlzaGVuZyA8YWlzaGVu
Zy5kb25nQG54cC5jb20+DQoNCihSb2IsIHBsZWFzZSBsZXQgdXMga25vdyBpZiB5b3UgaGF2ZSBk
aWZmZXJlbnQgaWRlYSkNCg0KUmVnYXJkcw0KRG9uZyBBaXNoZW5nDQoNCj4gDQo+IFlvdXJzLA0K
PiBMaW51cyBXYWxsZWlqDQo=

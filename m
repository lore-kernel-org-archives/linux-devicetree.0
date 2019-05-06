From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: RE: [PATCH 3/4] defconfig: arm64: enable i.MX8 nvmem driver
Date: Mon, 6 May 2019 08:38:56 +0000
Message-ID: <AM0PR04MB4211B499C58E61723BE35DA780300@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <20190505134130.28071-1-peng.fan@nxp.com>
 <20190505134130.28071-3-peng.fan@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190505134130.28071-3-peng.fan@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Peng Fan <peng.fan@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "srinivas.kandagatla@linaro.org" <srinivas.kandagatla@linaro.org>
Cc: dl-linux-imx <linux-imx@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "van.freenix@gmail.com" <van.freenix@gmail.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Shawn Guo <shawn.guo@linaro.org>, Andy Gross <andy.gross@linaro.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Olof Johansson <olof@lixom.net>, Jagan Teki <jagan@amarulasolutions.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Leonard Crestez <leonard.crestez@nxp.com>, Marc Gonzalez <marc.w.gonzalez@free.fr>, Enric Balletbo i Serra <enric.b>
List-Id: devicetree@vger.kernel.org

PiBGcm9tOiBQZW5nIEZhbg0KPiBTZW50OiBTdW5kYXksIE1heSA1LCAyMDE5IDk6MjggUE0NCj4g
U3ViamVjdDogW1BBVENIIDMvNF0gZGVmY29uZmlnOiBhcm02NDogZW5hYmxlIGkuTVg4IG52bWVt
IGRyaXZlcg0KPiANCj4gQnVpbGQgaW4gQ09ORklHX05WTUVNX0lNWF9PQ09UUF9TQ1UuDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBQZW5nIEZhbiA8cGVuZy5mYW5AbnhwLmNvbT4NCg0KZGVmY29uZmln
OiBhcm02NDogZW5hYmxlIGkuTVg4IFNDVSBvY3RvcCBkcml2ZXINCg0Kb3RoZXJ3aXNlOg0KUmV2
aWV3ZWQtYnk6IERvbmcgQWlzaGVuZyA8YWlzaGVuZy5kb25nQG54cC5jb20+DQoNClJlZ2FyZHMN
CkRvbmcgQWlzaGVuZw0KDQo+IENjOiBDYXRhbGluIE1hcmluYXMgPGNhdGFsaW4ubWFyaW5hc0Bh
cm0uY29tPg0KPiBDYzogV2lsbCBEZWFjb24gPHdpbGwuZGVhY29uQGFybS5jb20+DQo+IENjOiBT
aGF3biBHdW8gPHNoYXduLmd1b0BsaW5hcm8ub3JnPg0KPiBDYzogQW5keSBHcm9zcyA8YW5keS5n
cm9zc0BsaW5hcm8ub3JnPg0KPiBDYzogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBib290
bGluLmNvbT4NCj4gQ2M6IE9sb2YgSm9oYW5zc29uIDxvbG9mQGxpeG9tLm5ldD4NCj4gQ2M6IEph
Z2FuIFRla2kgPGphZ2FuQGFtYXJ1bGFzb2x1dGlvbnMuY29tPg0KPiBDYzogQmpvcm4gQW5kZXJz
c29uIDxiam9ybi5hbmRlcnNzb25AbGluYXJvLm9yZz4NCj4gQ2M6IExlb25hcmQgQ3Jlc3RleiA8
bGVvbmFyZC5jcmVzdGV6QG54cC5jb20+DQo+IENjOiBNYXJjIEdvbnphbGV6IDxtYXJjLncuZ29u
emFsZXpAZnJlZS5mcj4NCj4gQ2M6IEVucmljIEJhbGxldGJvIGkgU2VycmEgPGVucmljLmJhbGxl
dGJvQGNvbGxhYm9yYS5jb20+DQo+IENjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVh
ZC5vcmcNCj4gLS0tDQo+ICBhcmNoL2FybTY0L2NvbmZpZ3MvZGVmY29uZmlnIHwgMSArDQo+ICAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL2Fy
bTY0L2NvbmZpZ3MvZGVmY29uZmlnIGIvYXJjaC9hcm02NC9jb25maWdzL2RlZmNvbmZpZw0KPiBp
bmRleCBlYjMxYzIwZTk5MTQuLjlkOGE1MTJmYzNkNSAxMDA2NDQNCj4gLS0tIGEvYXJjaC9hcm02
NC9jb25maWdzL2RlZmNvbmZpZw0KPiArKysgYi9hcmNoL2FybTY0L2NvbmZpZ3MvZGVmY29uZmln
DQo+IEBAIC03NDgsNiArNzQ4LDcgQEAgQ09ORklHX0hJU0lfUE1VPXkNCj4gIENPTkZJR19RQ09N
X0wyX1BNVT15DQo+ICBDT05GSUdfUUNPTV9MM19QTVU9eQ0KPiAgQ09ORklHX05WTUVNX0lNWF9P
Q09UUD15DQo+ICtDT05GSUdfTlZNRU1fSU1YX09DT1RQX1NDVT15DQo+ICBDT05GSUdfUUNPTV9R
RlBST009eQ0KPiAgQ09ORklHX1JPQ0tDSElQX0VGVVNFPXkNCj4gIENPTkZJR19VTklQSElFUl9F
RlVTRT15DQo+IC0tDQo+IDIuMTYuNA0KDQo=

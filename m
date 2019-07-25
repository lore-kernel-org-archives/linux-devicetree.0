From: Anson Huang <anson.huang@nxp.com>
Subject: RE: [PATCH V5 1/5] dt-bindings: imx: Add clock binding doc for
 i.MX8MN
Date: Thu, 25 Jul 2019 02:17:07 +0000
Message-ID: <DB3PR0402MB3916A6EF2B9A34FB798120F3F5C10@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <20190619055247.35771-1-Anson.Huang@nxp.com>
 <20190722015043.GP3738@dragon>
 <CAL_JsqKv39XdFABuRvxwiXg6qQpHSuykwgqTwsGw1g+D2wA1+w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqKv39XdFABuRvxwiXg6qQpHSuykwgqTwsGw1g+D2wA1+w@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Olof Johansson <olof@lixom.net>, Simon Horman <horms+renesas@verge.net.au>, Jagan Teki <jagan@amarulasolutions.com>, Leonard Crestez <leonard.crestez@nxp.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Dinh Nguyen <dinguyen@kernel.org>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Aisheng Dong <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, Abel Vesa <abel.vesa@nxp.com>, Lucas
List-Id: devicetree@vger.kernel.org

DQoNCj4gT24gU3VuLCBKdWwgMjEsIDIwMTkgYXQgNzo1MSBQTSBTaGF3biBHdW8gPHNoYXduZ3Vv
QGtlcm5lbC5vcmc+IHdyb3RlOg0KPiA+DQo+ID4gT24gV2VkLCBKdW4gMTksIDIwMTkgYXQgMDE6
NTI6NDNQTSArMDgwMCwgQW5zb24uSHVhbmdAbnhwLmNvbSB3cm90ZToNCj4gPiA+IEZyb206IEFu
c29uIEh1YW5nIDxBbnNvbi5IdWFuZ0BueHAuY29tPg0KPiA+ID4NCj4gPiA+IEFkZCB0aGUgY2xv
Y2sgYmluZGluZyBkb2MgZm9yIGkuTVg4TU4uDQo+ID4gPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTog
QW5zb24gSHVhbmcgPEFuc29uLkh1YW5nQG54cC5jb20+DQo+ID4gPiBSZXZpZXdlZC1ieTogTWF4
aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBib290bGluLmNvbT4NCj4gPg0KPiA+IEFwcGxpZWQg
YWxsLCB0aGFua3MuDQo+IA0KPiBUaGlzIGJyZWFrcyBidWlsZGluZyBvZiAnZHRfYmluZGluZ19j
aGVjaycuIExvb2tzIGxpa2UgdGhlcmUgYXJlIHRhYnMgaW4gdGhlIGZpbGUNCj4gd2hpY2ggZG9l
c24ndCBtaXggd2l0aCBZQU1MLiBQbGVhc2UgZml4Lg0KDQpBaCwgeWVzLCB0aGVyZSBpcyBhIHRh
YiBpbiBmaWxlIGFuZCBicmVhayB0aGUgWUFNTCBmb3JtYXQsIEkgaGF2ZSBzZW5kIG91dCBhIHBh
dGNoIHRvDQpmaXggaXQsIGFuZCBZQU1MIGZpbGUgY2hlY2sgbm93IGNhbiBwYXNzLiBTb3JyeSBm
b3IgaXQuDQoNCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTEwNTc4MTUvDQoN
Ci0gICAgICAgY2xvY2stb3V0cHV0LW5hbWVzID0gIm9zY18zMmsiOw0KKyAgICAgICAgY2xvY2st
b3V0cHV0LW5hbWVzID0gIm9zY18zMmsiOw0KICAgICB9Ow0KDQpUaGFua3MsDQpBbnNvbg0K

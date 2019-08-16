From: Anson Huang <anson.huang@nxp.com>
Subject: RE: [PATCH V6 4/4] arm64: dts: imx8mm: Enable cpu-idle driver
Date: Fri, 16 Aug 2019 10:08:44 +0000
Message-ID: <DB3PR0402MB3916E469219C7CC68D55C90AF5AF0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1565915925-21009-1-git-send-email-Anson.Huang@nxp.com>
 <1565915925-21009-4-git-send-email-Anson.Huang@nxp.com>
 <e62d26b9-8c9b-644f-d2b3-485586e07e35@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e62d26b9-8c9b-644f-d2b3-485586e07e35@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "tglx@linutronix.de" <tglx@linutronix.de>, Leonard Crestez <leonard.crestez@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, Jacky Bai <ping.bai@nxp.com>, Jun Li <jun.li@nxp.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, Abel Vesa <abel.vesa@nxp.com>, "ccaione@baylibre.com" <ccaione@baylibre.com>, "andrew.smirnov@gmail.com" <andrew.smirnov@gmail.com>, "angus@akkea.ca" <angus@akkea.ca>, "agx@sigxcpu.org" <agx@sigxcpu.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

SGksIERhbmllbC9TaGF3bg0KDQo+IE9uIDE2LzA4LzIwMTkgMDI6MzgsIEFuc29uIEh1YW5nIHdy
b3RlOg0KPiA+IEVuYWJsZSBpLk1YOE1NIGNwdS1pZGxlIHVzaW5nIGdlbmVyaWMgQVJNIGNwdS1p
ZGxlIGRyaXZlciwgMiBzdGF0ZXMNCj4gPiBhcmUgc3VwcG9ydGVkLCBkZXRhaWxzIGFzIGJlbG93
Og0KPiA+DQo+ID4gcm9vdEBpbXg4bW1ldms6fiMgY2F0DQo+IC9zeXMvZGV2aWNlcy9zeXN0ZW0v
Y3B1L2NwdTAvY3B1aWRsZS9zdGF0ZTAvbmFtZQ0KPiA+IFdGSQ0KPiA+IHJvb3RAaW14OG1tZXZr
On4jIGNhdA0KPiA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdTAvY3B1aWRsZS9zdGF0ZTAv
dXNhZ2UNCj4gPiAzOTczDQo+ID4gcm9vdEBpbXg4bW1ldms6fiMgY2F0DQo+IC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L2NwdTAvY3B1aWRsZS9zdGF0ZTEvbmFtZQ0KPiA+IGNwdS1wZC13YWl0DQo+
ID4gcm9vdEBpbXg4bW1ldms6fiMgY2F0DQo+ID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1
MC9jcHVpZGxlL3N0YXRlMS91c2FnZQ0KPiA+IDY2NDcNCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6
IEFuc29uIEh1YW5nIDxBbnNvbi5IdWFuZ0BueHAuY29tPg0KPiANCj4gSGkgQW5zb24sDQo+IA0K
PiBJJ3ZlIGFwcGxpZWQgdGhlIHBhdGNoZXMgMS0zIGJ1dCB0aGlzIG9uZSBkb2VzIG5vdCBhcHBs
eS4NCg0KVGhhbmtzLg0KDQo+IA0KPiBZb3UgY2FuIGVpdGhlciByZXNwaW4gaXQgYWdhaW5zdCB0
aXAvdGltZXJzL2NvcmUgYW5kIHRha2UgaXQgdGhyb3VnaCBTaGF3bidzDQo+IHRyZWUuIElmIHRo
ZSBsYXRlciwgeW91IGNhbiBhZGQgbXkgQWNrZWQtYnkuDQoNCkhpLCBTaGF3bg0KCUNhbiB5b3Ug
dGFrZSB0aGlzIHBhdGNoIGFuZCBhZGQgYmVsb3cgQWNrZWQtYnk/IEl0IHNob3VsZCBjYW4gYmUg
YXBwbGllZCB0byB5b3VyIHRyZWUgZGlyZWN0bHkuDQoNCglBY2tlZC1ieTogRGFuaWVsIExlemNh
bm8gPGRhbmllbC5sZXpjYW5vQGxpbmFyby5vcmc+DQoNClRoYW5rcywNCkFuc29uDQoNCg0K

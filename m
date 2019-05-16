Return-Path: <SRS0=b22e=TQ=nxp.com=aisheng.dong@kernel.org>
From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: RE: [PATCH V12 3/5] thermal: imx_sc: add i.MX system controller
 thermal support
Date: Thu, 16 May 2019 10:39:34 +0000
Message-ID: 
 <AM0PR04MB4211EF0D257E502C3BF917D0800A0@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1555384609-7030-1-git-send-email-Anson.Huang@nxp.com>
 <1555384609-7030-3-git-send-email-Anson.Huang@nxp.com>
 <AM0PR04MB421105BBF1B9A90B255D1F7A80250@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <DB3PR0402MB39163877C25E5BE7E10C96B7F5250@DB3PR0402MB3916.eurprd04.prod.outlook.com>
In-Reply-To: 
 <DB3PR0402MB39163877C25E5BE7E10C96B7F5250@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
To: Anson Huang <anson.huang@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "rui.zhang@intel.com" <rui.zhang@intel.com>, "edubezval@gmail.com" <edubezval@gmail.com>, "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, Daniel Baluta <daniel.baluta@nxp.com>, Peng Fan <peng.fan@nxp.com>, "heiko@sntech.de" <heiko@sntech.de>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "agross@kernel.org" <agross@kernel.org>, "olof@lixom.net" <olof@lixom.net>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "jagan@amarulasolutions.com" <jagan@amarulasolutions.com>, "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>, "marc.w.gonzalez@free.fr" <marc.w.gonzalez@free.fr>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

Wy4uLl0NCg0KPiA+ID4gKwkJaWYgKCFzZW5zb3IpDQo+ID4gPiArCQkJcmV0dXJuIC1FTk9NRU07
DQo+ID4gPiArDQo+ID4gPiArCQlyZXQgPSB0aGVybWFsX3pvbmVfb2ZfZ2V0X3NlbnNvcl9pZChj
aGlsZCwNCj4gPiA+ICsJCQkJCQkgICAgJnNlbnNvcl9zcGVjcywNCj4gPg0KPiA+IEl0IGxvb2tz
IGEgYml0IHN0cmFuZ2Ugd2h5IG5lZWQgc2Vuc29yX3NwZWNzIGFzIHlvdSBldmVuIGRpZCBub3Qg
dXNlIGl0Lg0KPiANCj4gSXQgaXMgYmVjYXVzZSBwYXJzaW5nIHRoZSBwaGFuZGxlIGFyZ3VtZW50
cyBuZWVkcyBpdCwgc3VjaCBhcyB0aGUNCj4gdGhlcm1hbF96b25lX29mX3NlbnNvcl9yZWdpc3Rl
cigpIGZ1bmN0aW9uIG5lZWRzIHRoaXMgcG9pbnRlciB0byBiZSBwYXNzZWQNCj4gYmFjayB0byBj
aGVjayB0aGUgZWxlbWVudHMgYXJlIHZhbGlkIG9yIE5PVCwgc28gdGhlIEFQSSBkb2VzIE5PVCBk
ZWZpbmUgaXQgYXMNCj4gbG9jYWwgc3RydWN0dXJlLiBUaGUgQVBJIE5PVCBqdXN0IHJldHVybiB0
aGUgc2Vuc29yIGlkLCBidXQgYWxzbyB0aGUNCj4gb2ZfcGhhbmRsZV9hcmdzIGFkZHJlc3MsIGFs
dGhvdWdoIHdlIGRvIE5PVCBuZWVkIGl0IGF0IGFsbCBoZXJlLg0KDQpUaGUgbWFpbiBwcm9ibGVt
IGlzIHRoaXMgb25lIGludHJvZHVjZWQgaW4gMi81IHdoaWNoIG5lZWRzIGdldCBhY2sgZnJvbSBt
YWludGFpbmVyLg0KRm9yIG1lLCBJIHdvdWxkIHN1Z2dlc3QgdG8gbWFrZSBzZW5zb3Jfc3BlY3Mg
dHJhbnNwYXJlbnQgdG8gdXNlciBpZg0KaXQncyByZWFsbHkgbm90IG5lZWRlZCBieSB1c2Vycy4N
Cg0KUGxlYXNlIHRyeSB0byBtYWtlIGl0IGVpdGhlciBvcHRpb25hbCBvciBoaWRlIHRvIGNvcmUg
dXNlcnMgYXMgd2VsbC4NCkFuZCBJIGd1ZXNzIHRoZSBsYXRlciBvbmUgaXMgZG9hYmxlIGFmdGVy
IGEgZ2xhbmNlIGF0IHRoZSBjb3JlIGNvZGUuDQoNClJlZ2FyZHMNCkRvbmcgQWlzaGVuZw0K

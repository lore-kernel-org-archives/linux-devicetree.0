From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: RE: [PATCH V6 4/4] rtc: imx-sc: add rtc alarm support
Date: Tue, 9 Apr 2019 03:35:59 +0000
Message-ID: <AM0PR04MB4211677CFB66218EEAC0DE20802D0@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1554777487-31075-1-git-send-email-Anson.Huang@nxp.com>
 <1554777487-31075-4-git-send-email-Anson.Huang@nxp.com>
 <AM0PR04MB4211CEA77AB034B5DCF71FE2802D0@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <DB3PR0402MB3916E7D387D5FA74CFB719C6F52D0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <DB3PR0402MB3916E7D387D5FA74CFB719C6F52D0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "a.zummo@towertech.it" <a.zummo@towertech.it>, "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, "sboyd@kernel.org" <sboyd@kernel.org>, Peng Fan <peng.fan@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infrade>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Wy4uLl0NCg0KPiA+ID4gK3N0YXRpYyBpbnQgaW14X3NjX3J0Y19hbGFybV9pcnFfZW5hYmxlKHN0
cnVjdCBkZXZpY2UgKmRldiwgdW5zaWduZWQNCj4gPiA+ICtpbnQNCj4gPiA+ICtlbmFibGUpIHsN
Cj4gPiA+ICsJaW14X3NjdV9pcnFfZW5hYmxlKFNDX0lSUV9HUk9VUF9SVEMsIFNDX0lSUV9SVEMs
IGVuYWJsZSk7DQo+ID4gPiArDQo+ID4gPiArCXJldHVybiAwOw0KPiA+ID4gK30NCj4gPiA+ICsN
Cj4gPiA+ICtzdGF0aWMgaW50IGlteF9zY19ydGNfcmVhZF9hbGFybShzdHJ1Y3QgZGV2aWNlICpk
ZXYsIHN0cnVjdA0KPiA+ID4gK3J0Y193a2Fscm0NCj4gPiA+ICsqYWxybSkgew0KPiA+DQo+ID4g
SSBzdGlsbCB0aGluayBoZXJlIG5lZWRzIGEgZG9jIGV4cGxhaW4gd2h5IG5lZWRzIHRoaXMgYW5k
IHdoeSBpdCdzDQo+ID4gc2FmZSB0byBkbyB0aGF0Lg0KPiANCj4gSSB3aWxsIGFkZCBhIGNvbW1l
bnQgaGVyZSwgZm9yIHRoZSBkb2MsIGl0IHNob3VsZCBiZSBhbm90aGVyIHRvcGljIG9mIFJUQw0K
PiBmcmFtZXdvcmssIHdlIGNhbiBkbyBpdCBsYXRlci4NCg0KSSdtIGZpbmUgd2l0aCBpdC4NCkJU
VywgZG9uJ3QgbWlzcyB0aGUgbmV4dCBtaW5vciBjb21tZW50cyB3aGVuIHlvdSByZXNlbmQuDQoN
ClJlZ2FyZHMNCkRvbmcgQWlzaGVuZw0KDQo+ID4gPiArCS5zZXRfYWxhcm0gPSBpbXhfc2NfcnRj
X3NldF9hbGFybSwNCj4gPiA+ICsJLmFsYXJtX2lycV9lbmFibGUgPSBpbXhfc2NfcnRjX2FsYXJt
X2lycV9lbmFibGUsIH07DQo+ID4gPiArDQo+ID4gPiArc3RhdGljIGludCBpbXhfc2NfcnRjX2Fs
YXJtX3NjX25vdGlmeShzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgKm5iLA0KPiA+ID4gKwkJCQkJdW5z
aWduZWQgbG9uZyBldmVudCwgdm9pZCAqZ3JvdXApDQo+ID4NCj4gPiBOb3QgbmVjZXNzYXJ5IHRv
IGhhdmUgc3VjaCBhIGxvbmcgZnVuY3Rpb24gbmFtZS4NCj4gPiBJbXhfc2NfcnRjX2FsYXJtX25v
dGlmeSgpIHNob3VsZCBiZSBvaw0KPiA+DQoNCg==

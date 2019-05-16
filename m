Return-Path: <SRS0=6Y+9=TQ=nxp.com=anson.huang@kernel.org>
From: Anson Huang <anson.huang@nxp.com>
Subject: RE: [PATCH V12 3/5] thermal: imx_sc: add i.MX system controller
 thermal support
Date: Thu, 16 May 2019 10:46:33 +0000
Message-ID: 
 <DB3PR0402MB3916ABB2E6B07C3AE8AAA9FAF50A0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1555384609-7030-1-git-send-email-Anson.Huang@nxp.com>
 <1555384609-7030-3-git-send-email-Anson.Huang@nxp.com>
 <AM0PR04MB421105BBF1B9A90B255D1F7A80250@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <DB3PR0402MB39163877C25E5BE7E10C96B7F5250@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <AM0PR04MB4211EF0D257E502C3BF917D0800A0@AM0PR04MB4211.eurprd04.prod.outlook.com>
In-Reply-To: 
 <AM0PR04MB4211EF0D257E502C3BF917D0800A0@AM0PR04MB4211.eurprd04.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
To: Aisheng Dong <aisheng.dong@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "rui.zhang@intel.com" <rui.zhang@intel.com>, "edubezval@gmail.com" <edubezval@gmail.com>, "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, Daniel Baluta <daniel.baluta@nxp.com>, Peng Fan <peng.fan@nxp.com>, "heiko@sntech.de" <heiko@sntech.de>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "agross@kernel.org" <agross@kernel.org>, "olof@lixom.net" <olof@lixom.net>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "jagan@amarulasolutions.com" <jagan@amarulasolutions.com>, "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>, "marc.w.gonzalez@free.fr" <marc.w.gonzalez@free.fr>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQWlzaGVuZyBEb25nDQo+
IFNlbnQ6IFRodXJzZGF5LCBNYXkgMTYsIDIwMTkgNjo0MCBQTQ0KPiBUbzogQW5zb24gSHVhbmcg
PGFuc29uLmh1YW5nQG54cC5jb20+OyByb2JoK2R0QGtlcm5lbC5vcmc7DQo+IG1hcmsucnV0bGFu
ZEBhcm0uY29tOyBzaGF3bmd1b0BrZXJuZWwub3JnOyBzLmhhdWVyQHBlbmd1dHJvbml4LmRlOw0K
PiBrZXJuZWxAcGVuZ3V0cm9uaXguZGU7IGZlc3RldmFtQGdtYWlsLmNvbTsgY2F0YWxpbi5tYXJp
bmFzQGFybS5jb207DQo+IHdpbGwuZGVhY29uQGFybS5jb207IHJ1aS56aGFuZ0BpbnRlbC5jb207
IGVkdWJlenZhbEBnbWFpbC5jb207DQo+IGRhbmllbC5sZXpjYW5vQGxpbmFyby5vcmc7IHVsZi5o
YW5zc29uQGxpbmFyby5vcmc7IERhbmllbCBCYWx1dGENCj4gPGRhbmllbC5iYWx1dGFAbnhwLmNv
bT47IFBlbmcgRmFuIDxwZW5nLmZhbkBueHAuY29tPjsNCj4gaGVpa29Ac250ZWNoLmRlOyBob3Jt
cytyZW5lc2FzQHZlcmdlLm5ldC5hdTsgYWdyb3NzQGtlcm5lbC5vcmc7DQo+IG9sb2ZAbGl4b20u
bmV0OyBiam9ybi5hbmRlcnNzb25AbGluYXJvLm9yZzsgamFnYW5AYW1hcnVsYXNvbHV0aW9ucy5j
b207DQo+IGVucmljLmJhbGxldGJvQGNvbGxhYm9yYS5jb207IG1hcmMudy5nb256YWxlekBmcmVl
LmZyOw0KPiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2Vy
bmVsLm9yZzsgbGludXgtYXJtLQ0KPiBrZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgt
cG1Admdlci5rZXJuZWwub3JnDQo+IENjOiBkbC1saW51eC1pbXggPGxpbnV4LWlteEBueHAuY29t
Pg0KPiBTdWJqZWN0OiBSRTogW1BBVENIIFYxMiAzLzVdIHRoZXJtYWw6IGlteF9zYzogYWRkIGku
TVggc3lzdGVtIGNvbnRyb2xsZXINCj4gdGhlcm1hbCBzdXBwb3J0DQo+IA0KPiBbLi4uXQ0KPiAN
Cj4gPiA+ID4gKwkJaWYgKCFzZW5zb3IpDQo+ID4gPiA+ICsJCQlyZXR1cm4gLUVOT01FTTsNCj4g
PiA+ID4gKw0KPiA+ID4gPiArCQlyZXQgPSB0aGVybWFsX3pvbmVfb2ZfZ2V0X3NlbnNvcl9pZChj
aGlsZCwNCj4gPiA+ID4gKwkJCQkJCSAgICAmc2Vuc29yX3NwZWNzLA0KPiA+ID4NCj4gPiA+IEl0
IGxvb2tzIGEgYml0IHN0cmFuZ2Ugd2h5IG5lZWQgc2Vuc29yX3NwZWNzIGFzIHlvdSBldmVuIGRp
ZCBub3QgdXNlIGl0Lg0KPiA+DQo+ID4gSXQgaXMgYmVjYXVzZSBwYXJzaW5nIHRoZSBwaGFuZGxl
IGFyZ3VtZW50cyBuZWVkcyBpdCwgc3VjaCBhcyB0aGUNCj4gPiB0aGVybWFsX3pvbmVfb2Zfc2Vu
c29yX3JlZ2lzdGVyKCkgZnVuY3Rpb24gbmVlZHMgdGhpcyBwb2ludGVyIHRvIGJlDQo+ID4gcGFz
c2VkIGJhY2sgdG8gY2hlY2sgdGhlIGVsZW1lbnRzIGFyZSB2YWxpZCBvciBOT1QsIHNvIHRoZSBB
UEkgZG9lcw0KPiA+IE5PVCBkZWZpbmUgaXQgYXMgbG9jYWwgc3RydWN0dXJlLiBUaGUgQVBJIE5P
VCBqdXN0IHJldHVybiB0aGUgc2Vuc29yDQo+ID4gaWQsIGJ1dCBhbHNvIHRoZSBvZl9waGFuZGxl
X2FyZ3MgYWRkcmVzcywgYWx0aG91Z2ggd2UgZG8gTk9UIG5lZWQgaXQgYXQgYWxsDQo+IGhlcmUu
DQo+IA0KPiBUaGUgbWFpbiBwcm9ibGVtIGlzIHRoaXMgb25lIGludHJvZHVjZWQgaW4gMi81IHdo
aWNoIG5lZWRzIGdldCBhY2sgZnJvbQ0KPiBtYWludGFpbmVyLg0KPiBGb3IgbWUsIEkgd291bGQg
c3VnZ2VzdCB0byBtYWtlIHNlbnNvcl9zcGVjcyB0cmFuc3BhcmVudCB0byB1c2VyIGlmIGl0J3MN
Cj4gcmVhbGx5IG5vdCBuZWVkZWQgYnkgdXNlcnMuDQo+IA0KPiBQbGVhc2UgdHJ5IHRvIG1ha2Ug
aXQgZWl0aGVyIG9wdGlvbmFsIG9yIGhpZGUgdG8gY29yZSB1c2VycyBhcyB3ZWxsLg0KPiBBbmQg
SSBndWVzcyB0aGUgbGF0ZXIgb25lIGlzIGRvYWJsZSBhZnRlciBhIGdsYW5jZSBhdCB0aGUgY29y
ZSBjb2RlLg0KDQpPSywgSSB3aWxsIGhpZGUgaXQgdG8gdXNlciBpZiBubyBvdGhlciBkaWZmZXJl
bnQgY29tbWVudHMuDQoNCkFuc29uLg0KDQo+IA0KPiBSZWdhcmRzDQo+IERvbmcgQWlzaGVuZw0K

From: Anson Huang <anson.huang@nxp.com>
Subject: RE: [PATCH 4/4] ARM64: dts: imx: add i.MX8QXP system controller RTC
 support
Date: Wed, 28 Nov 2018 09:06:27 +0000
Message-ID: <DB3PR0402MB3916FFD700313BF684CF32AAF5D10@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1543311334-8807-1-git-send-email-Anson.Huang@nxp.com>
        <1543311334-8807-5-git-send-email-Anson.Huang@nxp.com>
 <20181128100420.0c9a721a@karo-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181128100420.0c9a721a@karo-electronics.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?B?TG90aGFyIFdhw59tYW5u?= <LW@KARO-electronics.de>
Cc: "a.zummo@towertech.it" <a.zummo@towertech.it>, "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, Aisheng DONG <aisheng.dong@nxp.com>, Andy Gross <andy.gross@linaro.org>, "arnd@arndb.de" <arnd@arndb.de>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "heiko@sntech.de" <heiko@sntech.de>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>, "amit.kucheria@linaro.org" <amit.kucheria@linaro.org>, "ezequiel@collabora.com" <ezequiel@collabora.com>, "olof@lixom.net" <olof@lixom.net>sh
List-Id: devicetree@vger.kernel.org

SGksIExvdGhhcg0KDQpCZXN0IFJlZ2FyZHMhDQpBbnNvbiBIdWFuZw0KDQo+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IExvdGhhciBXYcOfbWFubiBbbWFpbHRvOkxXQEtBUk8t
ZWxlY3Ryb25pY3MuZGVdDQo+IFNlbnQ6IDIwMTjlubQxMeaciDI45pelIDE3OjA0DQo+IFRvOiBB
bnNvbiBIdWFuZyA8YW5zb24uaHVhbmdAbnhwLmNvbT4NCj4gQ2M6IGEuenVtbW9AdG93ZXJ0ZWNo
Lml0OyBhbGV4YW5kcmUuYmVsbG9uaUBib290bGluLmNvbTsNCj4gcm9iaCtkdEBrZXJuZWwub3Jn
OyBtYXJrLnJ1dGxhbmRAYXJtLmNvbTsgY2F0YWxpbi5tYXJpbmFzQGFybS5jb207DQo+IHdpbGwu
ZGVhY29uQGFybS5jb207IEFpc2hlbmcgRE9ORyA8YWlzaGVuZy5kb25nQG54cC5jb20+OyBBbmR5
IEdyb3NzDQo+IDxhbmR5Lmdyb3NzQGxpbmFyby5vcmc+OyBhcm5kQGFybmRiLmRlOyBob3Jtcyty
ZW5lc2FzQHZlcmdlLm5ldC5hdTsNCj4gaGVpa29Ac250ZWNoLmRlOyBiam9ybi5hbmRlcnNzb25A
bGluYXJvLm9yZzsgZW5yaWMuYmFsbGV0Ym9AY29sbGFib3JhLmNvbTsNCj4gYW1pdC5rdWNoZXJp
YUBsaW5hcm8ub3JnOyBlemVxdWllbEBjb2xsYWJvcmEuY29tOyBvbG9mQGxpeG9tLm5ldDsNCj4g
c2hhd25ndW9Aa2VybmVsLm9yZzsgbGludXgtcnRjQHZnZXIua2VybmVsLm9yZzsgZGV2aWNldHJl
ZUB2Z2VyLmtlcm5lbC5vcmc7DQo+IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4
LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsNCj4gZGwtbGludXgtaW14IDxsaW51eC1p
bXhAbnhwLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCA0LzRdIEFSTTY0OiBkdHM6IGlteDog
YWRkIGkuTVg4UVhQIHN5c3RlbSBjb250cm9sbGVyDQo+IFJUQyBzdXBwb3J0DQo+IA0KPiBIaSwN
Cj4gDQo+IE9uIFR1ZSwgMjcgTm92IDIwMTggMDk6NDE6NDYgKzAwMDAgQW5zb24gSHVhbmcgd3Jv
dGU6DQo+ID4gQWRkIGkuTVg4UVhQIHN5c3RlbSBjb250cm9sbGVyIFJUQyBzdXBwb3J0Lg0KPiA+
DQo+ID4gU2lnbmVkLW9mZi1ieTogQW5zb24gSHVhbmcgPEFuc29uLkh1YW5nQG54cC5jb20+DQo+
ID4gLS0tDQo+ID4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhxeHAuZHRzaSB8
IDQgKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBk
aWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OHF4cC5kdHNpDQo+
IGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OHF4cC5kdHNpDQo+ID4gaW5kZXgg
OTE1NWQ0NS4uZWY1N2RiNiAxMDA2NDQNCj4gPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2Zy
ZWVzY2FsZS9pbXg4cXhwLmR0c2kNCj4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVz
Y2FsZS9pbXg4cXhwLmR0c2kNCj4gPiBAQCAtNDMzLDQgKzQzMyw4IEBADQo+ID4gIAkJI3NpemUt
Y2VsbHMgPSA8MT47DQo+ID4gIAkJcmFuZ2VzID0gPDB4NWYwMDAwMDAgMHgwIDB4NWYwMDAwMDAg
MHgxMDAwMDAwPjsNCj4gPiAgCX07DQo+ID4gKw0KPiA+ICsJcnRjOiBydGMgew0KPiA+ICsJCWNv
bXBhdGlibGUgPSAibnhwLGlteDhxeHAtc2MtcnRjIjsNCj4gPiArCX07DQo+ID4gIH07DQo+IElN
TyB0aGlzIHNob3VsZCBiZSBkaXNhYmxlZCBieSBkZWZhdWx0Lg0KDQpUaGlzIG1vZHVsZSBpcyBO
T1QgZGVwZW5kaW5nIG9uIGFueSBib2FyZCBkZXNpZ24sIHNob3VsZCBpdCBiZSBlbmFibGVkIGJ5
IGRlZmF1bHQgaW4gc29jIGR0c2k/DQpMaWtlIHdkb2cgZXRjLi4NCg0KQW5zb24uDQoNCj4gDQo+
IA0KPiBMb3RoYXIgV2HDn21hbm4NCg==

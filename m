From: Anson Huang <anson.huang@nxp.com>
Subject: RE: [PATCH 1/3] opp: of: Support multiple suspend OPPs defined in DT
Date: Tue, 9 Jul 2019 07:54:12 +0000
Message-ID: <AM6PR0402MB3911CB4D54A71EB69E8E7544F5F10@AM6PR0402MB3911.eurprd04.prod.outlook.com>
References: <20190709071056.26361-1-Anson.Huang@nxp.com>
 <20190709075119.rg6ktsg7nwdadsmd@vireshk-i7>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190709075119.rg6ktsg7nwdadsmd@vireshk-i7>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "vireshk@kernel.org" <vireshk@kernel.org>, "nm@ti.com" <nm@ti.com>, "sboyd@kernel.org" <sboyd@kernel.org>, Leonard Crestez <leonard.crestez@nxp.com>, Aisheng Dong <aisheng.dong@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, Jacky Bai <ping.bai@nxp.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, Abel Vesa <abel.vesa@nxp.com>, "ccaione@baylibre.com" <ccaione@baylibre.com>, "angus@akkea.ca" <angus@akkea.ca>, "andrew.smirnov@gmail.com" <andrew.smirnov@gmail.com>, agx@si
List-Id: devicetree@vger.kernel.org

SGksIFZpcmVzaA0KDQo+IE9uIDA5LTA3LTE5LCAxNToxMCwgQW5zb24uSHVhbmdAbnhwLmNvbSB3
cm90ZToNCj4gPiBGcm9tOiBBbnNvbiBIdWFuZyA8QW5zb24uSHVhbmdAbnhwLmNvbT4NCj4gPg0K
PiA+IFdpdGggcHJvcGVydHkgIm9wcC1zdXBwb3J0ZWQtaHciIGludHJvZHVjZWQsIHRoZSBPUFAg
dGFibGUgaW4gRFQgY291bGQNCj4gPiBiZSBhIGxhcmdlIE9QUCB0YWJsZSBhbmQgT05MWSBhIHN1
YnNldCBvZiBPUFBzIGFyZSBhdmFpbGFibGUsIGJhc2VkIG9uDQo+ID4gdGhlIHZlcnNpb24gb2Yg
dGhlIGhhcmR3YXJlIHJ1bm5pbmcgb24uIFRoYXQgaW50cm9kdWNlcyByZXN0cmljdGlvbiBvZg0K
PiA+IHVzaW5nICJvcHAtc3VzcGVuZCINCj4gPiBwcm9wZXJ0eSB0byBkZWZpbmUgdGhlIHN1c3Bl
bmQgT1BQLCBhcyB3ZSBhcmUgTk9UIHN1cmUgaWYgdGhlIE9QUA0KPiA+IGNvbnRhaW5pbmcgIm9w
cC1zdXNwZW5kIiBwcm9wZXJ0eSBpcyBhdmFpbGFibGUgZm9yIHRoZSBoYXJkd2FyZQ0KPiA+IHJ1
bm5pbmcgb24sIGFuZCB0aGUgb2Ygb3BwIGNvcmUgZG9lcyBOT1QgYWxsb3cgbXVsdGlwbGUgc3Vz
cGVuZCBPUFBzDQo+ID4gZGVmaW5lZCBpbiBEVCBPUFAgdGFibGUuDQo+ID4NCj4gPiBUbyBlbGlt
aW5hdGUgdGhpcyByZXN0cml0aW9uLCBtYWtlIG9mIG9wcCBjb3JlIGFsbG93IG11bHRpcGxlIHN1
c3BlbmQNCj4gPiBPUFBzIGRlZmluZWQgaW4gRFQsIGFuZCBwaWNrIHRoZSBPUFAgd2l0aCBoaWdo
ZXN0IHJhdGUgYW5kIHdpdGgNCj4gPiAib3BwLXN1c3BlbmQiIHByb3BlcnR5IHByZXNlbnQgdG8g
YmUgc3VzcGVuZCBPUFAsIGl0IGNhbiBzcGVlZCB1cCB0aGUNCj4gPiBzdXNwZW5kL3Jlc3VtZSBw
cm9jZXNzLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQW5zb24gSHVhbmcgPEFuc29uLkh1YW5n
QG54cC5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvb3BwL29mLmMgfCA5ICsrKysrKy0tLQ0K
PiA+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiAN
Cj4gUGxlYXNlIHVwZGF0ZSB0aGUgRFQgYmluZGluZ3MgZmlyc3QuDQoNCk9LLCB3aWxsIHNlbmQg
YSBWMiBjb250YWluaW5nIERUIGJpbmRpbmcgY2hhbmdlcy4NCg0KPiANCj4gRldJVywgYWxsIHRo
cmVlIHBhdGNoZXMgbG9vayBmaW5lIG90aGVyd2lzZS4NCg0KVGhhbmsgeW91IQ0KDQpBbnNvbi4N
Cg==

From: Anson Huang <anson.huang@nxp.com>
Subject: RE: [PATCH V3 3/4] clk: imx: Add support for i.MX8MN clock driver
Date: Fri, 7 Jun 2019 00:50:28 +0000
Message-ID: <DB3PR0402MB391625A0B3D838CE88C53E33F5100@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <20190604015928.23157-1-Anson.Huang@nxp.com>
 <20190604015928.23157-3-Anson.Huang@nxp.com>
 <20190606162543.EFFB820645@mail.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190606162543.EFFB820645@mail.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abel.vesa@nxp.com>, Aisheng Dong <aisheng.dong@nxp.com>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "dinguyen@kernel.org" <dinguyen@kernel.org>, "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>, "festevam@gmail.com" <festevam@gmail.com>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "jagan@amarulasolutions.com" <jagan@amarulasolutions.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, Leonard Crestez <leonard.crestez@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-clk@v
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

SGksIFN0ZXBoZW4NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVw
aGVuIEJveWQgPHNib3lkQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IEZyaWRheSwgSnVuZSA3LCAyMDE5
IDEyOjI2IEFNDQo+IFRvOiBBbnNvbiBIdWFuZyA8YW5zb24uaHVhbmdAbnhwLmNvbT47IEFiZWwg
VmVzYQ0KPiA8YWJlbC52ZXNhQG54cC5jb20+OyBBaXNoZW5nIERvbmcgPGFpc2hlbmcuZG9uZ0Bu
eHAuY29tPjsNCj4gYmpvcm4uYW5kZXJzc29uQGxpbmFyby5vcmc7IGNhdGFsaW4ubWFyaW5hc0Bh
cm0uY29tOw0KPiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgZGluZ3V5ZW5Aa2VybmVsLm9y
ZzsNCj4gZW5yaWMuYmFsbGV0Ym9AY29sbGFib3JhLmNvbTsgZmVzdGV2YW1AZ21haWwuY29tOw0K
PiBob3JtcytyZW5lc2FzQHZlcmdlLm5ldC5hdTsgamFnYW5AYW1hcnVsYXNvbHV0aW9ucy5jb207
DQo+IGtlcm5lbEBwZW5ndXRyb25peC5kZTsgbC5zdGFjaEBwZW5ndXRyb25peC5kZTsgTGVvbmFy
ZCBDcmVzdGV6DQo+IDxsZW9uYXJkLmNyZXN0ZXpAbnhwLmNvbT47IGxpbnV4LWFybS1rZXJuZWxA
bGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgtDQo+IGNsa0B2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4
LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IG1hcmsucnV0bGFuZEBhcm0uY29tOw0KPiBtYXhpbWUu
cmlwYXJkQGJvb3RsaW4uY29tOyBtdHVycXVldHRlQGJheWxpYnJlLmNvbTsgb2xvZkBsaXhvbS5u
ZXQ7DQo+IEphY2t5IEJhaSA8cGluZy5iYWlAbnhwLmNvbT47IHJvYmgrZHRAa2VybmVsLm9yZzsN
Cj4gcy5oYXVlckBwZW5ndXRyb25peC5kZTsgc2hhd25ndW9Aa2VybmVsLm9yZzsgd2lsbC5kZWFj
b25AYXJtLmNvbQ0KPiBDYzogZGwtbGludXgtaW14IDxsaW51eC1pbXhAbnhwLmNvbT4NCj4gU3Vi
amVjdDogUmU6IFtQQVRDSCBWMyAzLzRdIGNsazogaW14OiBBZGQgc3VwcG9ydCBmb3IgaS5NWDhN
TiBjbG9jayBkcml2ZXINCj4gDQo+IFF1b3RpbmcgQW5zb24uSHVhbmdAbnhwLmNvbSAoMjAxOS0w
Ni0wMyAxODo1OToyNykNCj4gPiBGcm9tOiBBbnNvbiBIdWFuZyA8QW5zb24uSHVhbmdAbnhwLmNv
bT4NCj4gPg0KPiA+IFRoaXMgcGF0Y2ggYWRkcyBpLk1YOE1OIGNsb2NrIGRyaXZlciBzdXBwb3J0
Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQW5zb24gSHVhbmcgPEFuc29uLkh1YW5nQG54cC5j
b20+DQo+ID4gLS0tDQo+ID4gQ2hhbmdlcyBzaW5jZSBWMjoNCj4gPiAgICAgICAgIC0gdXNlIHBs
YXRmb3JtIGRyaXZlciBtb2RlbCBmb3IgdGhpcyBjbG9jayBkcml2ZXI7DQo+IA0KPiBDYW4geW91
IGFsc28gdXNlIHBsYXRmb3JtIGRldmljZSBBUElzIGxpa2UgcGxhdGZvcm1fKigpLA0KPiBkZXZt
X2lvcmVtYXBfcmVzb3VyY2UoKSBhbmQgZGV2bWlmaWVkIGNsayByZWdpc3RyYXRpb24/DQoNCkkg
d2lsbCB1c2UgZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlKCkgaW5zdGVhZCBvZiBpb3Jl
bWFwKCksDQphbmQgY2FuIHlvdSBiZSBtb3JlIHNwZWNpZmljIGFib3V0IGRldm1pZmllZCBjbGsg
cmVnaXN0cmF0aW9uPw0KDQpUaGFua3MsDQpBbnNvbg0K

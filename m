From: Anson Huang <anson.huang@nxp.com>
Subject: RE: [PATCH V4 2/2] clk: imx: scu: add cpu frequency scaling support
Date: Sat, 16 Feb 2019 00:41:24 +0000
Message-ID: <DB3PR0402MB3916D80AEC3CEEC6F6A8C394F5610@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1550108915-574-1-git-send-email-Anson.Huang@nxp.com>
 <1550108915-574-2-git-send-email-Anson.Huang@nxp.com>
 <155027509324.115909.9001648696808985832@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <155027509324.115909.9001648696808985832@swboyd.mtv.corp.google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "festevam@gmail.com" <festevam@gmail.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "viresh.kumar@linaro.org" <viresh.kumar@linaro.org>, Aisheng Dong <aisheng.dong@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

SGksIFN0ZXBoZW4NCg0KQmVzdCBSZWdhcmRzIQ0KQW5zb24gSHVhbmcNCg0KPiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVwaGVuIEJveWQgW21haWx0bzpzYm95ZEBrZXJu
ZWwub3JnXQ0KPiBTZW50OiAyMDE55bm0MuaciDE25pelIDc6NTgNCj4gVG86IGRldmljZXRyZWVA
dmdlci5rZXJuZWwub3JnOyBmZXN0ZXZhbUBnbWFpbC5jb207DQo+IGtlcm5lbEBwZW5ndXRyb25p
eC5kZTsgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBsaW51eC0NCj4gY2xr
QHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgbWFyay5ydXRs
YW5kQGFybS5jb207DQo+IG10dXJxdWV0dGVAYmF5bGlicmUuY29tOyByb2JoK2R0QGtlcm5lbC5v
cmc7IHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU7DQo+IHNoYXduZ3VvQGtlcm5lbC5vcmc7IHZpcmVz
aC5rdW1hckBsaW5hcm8ub3JnOyBBaXNoZW5nIERvbmcNCj4gPGFpc2hlbmcuZG9uZ0BueHAuY29t
PjsgQW5zb24gSHVhbmcgPGFuc29uLmh1YW5nQG54cC5jb20+OyBEYW5pZWwNCj4gQmFsdXRhIDxk
YW5pZWwuYmFsdXRhQG54cC5jb20+DQo+IENjOiBkbC1saW51eC1pbXggPGxpbnV4LWlteEBueHAu
Y29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIFY0IDIvMl0gY2xrOiBpbXg6IHNjdTogYWRkIGNw
dSBmcmVxdWVuY3kgc2NhbGluZyBzdXBwb3J0DQo+IA0KPiBRdW90aW5nIEFuc29uIEh1YW5nICgy
MDE5LTAyLTEzIDE3OjU0OjA4KQ0KPiA+IE9uIE5YUCdzIGkuTVggU29DcyB3aXRoIHN5c3RlbSBj
b250cm9sbGVyIGluc2lkZSwgQ1BVIGZyZXF1ZW5jeQ0KPiA+IHNjYWxpbmcgY2FuIE9OTFkgYmUg
ZG9uZSBieSBzeXN0ZW0gY29udHJvbGxlciBmaXJtd2FyZSwgYW5kIGl0IGNhbg0KPiA+IE9OTFkg
YmUgcmVxdWVzdGVkIGZyb20gc2VjdXJlIG1vZGUsIHNvIExpbnV4IGtlcm5lbCBoYXMgdG8gY2Fs
bCBBUk0NCj4gPiBTTUMgdG8gdHJhcCB0byBBUk0tVHJ1c3RlZC1GaXJtd2FyZSB0byByZXF1ZXN0
IHN5c3RlbSBjb250cm9sbGVyDQo+ID4gZmlybXdhcmUgdG8gZG8gQ1BVIGZyZXF1ZW5jeSBzY2Fs
aW5nLg0KPiA+DQo+ID4gVGhpcyBwYXRjaCBhZGRzIGkuTVggc3lzdGVtIGNvbnRyb2xsZXIgQ1BV
IGZyZXF1ZW5jeSBzY2FsaW5nIHN1cHBvcnQsDQo+ID4gaXQgcmV1c2VzIGNwdWZyZXEtZHQgZHJp
dmVyIGFuZCBpbXBsZW1lbnQgdGhlIENQVSBmcmVxdWVuY3kgc2NhbGluZw0KPiA+IGluc2lkZSBT
Q1UgY2xvY2sgZHJpdmVyLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQW5zb24gSHVhbmcgPEFu
c29uLkh1YW5nQG54cC5jb20+DQo+ID4gLS0tDQo+IA0KPiBBY2tlZC1ieTogU3RlcGhlbiBCb3lk
IDxzYm95ZEBrZXJuZWwub3JnPg0KPiANCj4gVW5sZXNzIHlvdSB3YW50ZWQgbWUgdG8gcGljayB0
aGlzIHBhdGNoIHVwIGludG8gY2xrLW5leHQ/DQoNClllcywgcGxlYXNlLCB3ZSB3YW50IHRvIHN1
cHBvcnQgY3B1LWZyZXEgc2NhbGluZyBpbiBMaW51eCBuZXh0IHRyZWUgQVNBUC4NCg0KVGhhbmtz
LA0KQW5zb24uDQo=

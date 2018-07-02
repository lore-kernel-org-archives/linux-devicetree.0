From: Anson Huang <anson.huang@nxp.com>
Subject: RE: [PATCH v1] ARM: dts: imx6sl-evk: keep sw4 always on
Date: Mon, 2 Jul 2018 00:57:32 +0000
Message-ID: <AM3PR04MB1315E7AED2BCE2265E6C443DF5430@AM3PR04MB1315.eurprd04.prod.outlook.com>
References: <1529930051-14122-1-git-send-email-yibin.gong@nxp.com>
 <20180701093402.GN4348@dragon>
 <CAOMZO5BjOEGWv2dC-bp0BYHq+PhLssEKic+o7ock8_1Dobd=sQ@mail.gmail.com>
 <AM3PR04MB131507901BFEE1A5E426EECBF5430@AM3PR04MB1315.eurprd04.prod.outlook.com>
 <CAOMZO5D8tjnjbwMdLGd7KF7_4PwqRWX8XH8kdcF3-5e-r2YQEA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOMZO5D8tjnjbwMdLGd7KF7_4PwqRWX8XH8kdcF3-5e-r2YQEA@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Robin Gong <yibin.gong@nxp.com>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

SGksIEZhYmlvDQoNCkFuc29uIEh1YW5nDQpCZXN0IFJlZ2FyZHMhDQoNCg0KPiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBGYWJpbyBFc3RldmFtIFttYWlsdG86ZmVzdGV2YW1A
Z21haWwuY29tXQ0KPiBTZW50OiBNb25kYXksIEp1bHkgMiwgMjAxOCA4OjU1IEFNDQo+IFRvOiBB
bnNvbiBIdWFuZyA8YW5zb24uaHVhbmdAbnhwLmNvbT4NCj4gQ2M6IFNoYXduIEd1byA8c2hhd25n
dW9Aa2VybmVsLm9yZz47IFJvYmluIEdvbmcgPHlpYmluLmdvbmdAbnhwLmNvbT47DQo+IE1hcmsg
UnV0bGFuZCA8bWFyay5ydXRsYW5kQGFybS5jb20+OyBvcGVuIGxpc3Q6T1BFTiBGSVJNV0FSRSBB
TkQNCj4gRkxBVFRFTkVEIERFVklDRSBUUkVFIEJJTkRJTkdTIDxkZXZpY2V0cmVlQHZnZXIua2Vy
bmVsLm9yZz47DQo+IGxpbnV4LWtlcm5lbCA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz47
IFJvYiBIZXJyaW5nDQo+IDxyb2JoK2R0QGtlcm5lbC5vcmc+OyBkbC1saW51eC1pbXggPGxpbnV4
LWlteEBueHAuY29tPjsgU2FzY2hhIEhhdWVyDQo+IDxrZXJuZWxAcGVuZ3V0cm9uaXguZGU+OyBG
YWJpbyBFc3RldmFtIDxmYWJpby5lc3RldmFtQG54cC5jb20+Ow0KPiBtb2RlcmF0ZWQgbGlzdDpB
Uk0vRlJFRVNDQUxFIElNWCAvIE1YQyBBUk0gQVJDSElURUNUVVJFDQo+IDxsaW51eC1hcm0ta2Vy
bmVsQGxpc3RzLmluZnJhZGVhZC5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjFdIEFSTTog
ZHRzOiBpbXg2c2wtZXZrOiBrZWVwIHN3NCBhbHdheXMgb24NCj4gDQo+IEhpIEFuc29uLA0KPiAN
Cj4gT24gU3VuLCBKdWwgMSwgMjAxOCBhdCA5OjUzIFBNLCBBbnNvbiBIdWFuZyA8YW5zb24uaHVh
bmdAbnhwLmNvbT4gd3JvdGU6DQo+IA0KPiA+IFllcywgSSB0aGluayB3ZSBjYW4gcmV2ZXJ0IGl0
IHRvIGF2b2lkIGJyZWFrYWdlLiBEaWRuJ3Qgbm90aWNlIHRoYXQNCj4gPiBzb21lIGkuTVggcGxh
dGZvcm0gZG8gTk9UIGhhdmUgdGhvc2UgY3JpdGljYWwgc3dpdGNoZXMgYWx3YXlzLW9uLg0KPiAN
Cj4gT2ssIHRoYW5rcyBmb3IgY29uZmlybWluZy4NCj4gDQo+IEkgd2lsbCBzZW5kIGEgcmV2ZXJ0
IHBhdGNoIHRoZW4uDQo+IA0KPiBUaGFua3MNCiANCkp1c3Qgd2FudCB0byBrbm93IGhvdyB0byBo
YW5kbGUgc3VjaCBjYXNlPyBUaGUga2VybmVsIHBhdGNoIHdpbGwgbmV2ZXINCmJlIGFwcGxpZWQg
b3IgaXMgdGhlcmUgYW55IHdheSB0byBtYWtlIGtlcm5lbCBwYXRjaCBhbmQgZHRiIHBhdGNoIGFw
cGxpZWQNCnRvZ2V0aGVyIHRvIGF2b2lkIGFueSBicmVha2FnZT8NCg0KQW5zb24uDQoNCg==

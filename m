From: Anson Huang <anson.huang@nxp.com>
Subject: RE: [PATCH v1] ARM: dts: imx6sl-evk: keep sw4 always on
Date: Mon, 2 Jul 2018 01:03:11 +0000
Message-ID: <AM3PR04MB1315C7C7CFF990615732FFBCF5430@AM3PR04MB1315.eurprd04.prod.outlook.com>
References: <1529930051-14122-1-git-send-email-yibin.gong@nxp.com>
 <20180701093402.GN4348@dragon>
 <CAOMZO5BjOEGWv2dC-bp0BYHq+PhLssEKic+o7ock8_1Dobd=sQ@mail.gmail.com>
 <AM3PR04MB131507901BFEE1A5E426EECBF5430@AM3PR04MB1315.eurprd04.prod.outlook.com>
 <CAOMZO5D8tjnjbwMdLGd7KF7_4PwqRWX8XH8kdcF3-5e-r2YQEA@mail.gmail.com>
 <AM3PR04MB1315E7AED2BCE2265E6C443DF5430@AM3PR04MB1315.eurprd04.prod.outlook.com>
 <CAOMZO5D8v4KM9S4ooHTDbA+vc8BZN_eO_wDuOPA+8Hcq-SmLDw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOMZO5D8v4KM9S4ooHTDbA+vc8BZN_eO_wDuOPA+8Hcq-SmLDw@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Robin Gong <yibin.gong@nxp.com>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

DQoNCkFuc29uIEh1YW5nDQpCZXN0IFJlZ2FyZHMhDQoNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPiBGcm9tOiBGYWJpbyBFc3RldmFtIFttYWlsdG86ZmVzdGV2YW1AZ21haWwuY29t
XQ0KPiBTZW50OiBNb25kYXksIEp1bHkgMiwgMjAxOCA5OjAwIEFNDQo+IFRvOiBBbnNvbiBIdWFu
ZyA8YW5zb24uaHVhbmdAbnhwLmNvbT4NCj4gQ2M6IFNoYXduIEd1byA8c2hhd25ndW9Aa2VybmVs
Lm9yZz47IFJvYmluIEdvbmcgPHlpYmluLmdvbmdAbnhwLmNvbT47DQo+IE1hcmsgUnV0bGFuZCA8
bWFyay5ydXRsYW5kQGFybS5jb20+OyBvcGVuIGxpc3Q6T1BFTiBGSVJNV0FSRSBBTkQNCj4gRkxB
VFRFTkVEIERFVklDRSBUUkVFIEJJTkRJTkdTIDxkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZz47
DQo+IGxpbnV4LWtlcm5lbCA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz47IFJvYiBIZXJy
aW5nDQo+IDxyb2JoK2R0QGtlcm5lbC5vcmc+OyBkbC1saW51eC1pbXggPGxpbnV4LWlteEBueHAu
Y29tPjsgU2FzY2hhIEhhdWVyDQo+IDxrZXJuZWxAcGVuZ3V0cm9uaXguZGU+OyBGYWJpbyBFc3Rl
dmFtIDxmYWJpby5lc3RldmFtQG54cC5jb20+Ow0KPiBtb2RlcmF0ZWQgbGlzdDpBUk0vRlJFRVND
QUxFIElNWCAvIE1YQyBBUk0gQVJDSElURUNUVVJFDQo+IDxsaW51eC1hcm0ta2VybmVsQGxpc3Rz
LmluZnJhZGVhZC5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjFdIEFSTTogZHRzOiBpbXg2
c2wtZXZrOiBrZWVwIHN3NCBhbHdheXMgb24NCj4gDQo+IEhpIEFuc29uLA0KPiANCj4gT24gU3Vu
LCBKdWwgMSwgMjAxOCBhdCA5OjU3IFBNLCBBbnNvbiBIdWFuZyA8YW5zb24uaHVhbmdAbnhwLmNv
bT4gd3JvdGU6DQo+IA0KPiA+IEp1c3Qgd2FudCB0byBrbm93IGhvdyB0byBoYW5kbGUgc3VjaCBj
YXNlPyBUaGUga2VybmVsIHBhdGNoIHdpbGwgbmV2ZXINCj4gPiBiZSBhcHBsaWVkIG9yIGlzIHRo
ZXJlIGFueSB3YXkgdG8gbWFrZSBrZXJuZWwgcGF0Y2ggYW5kIGR0YiBwYXRjaA0KPiA+IGFwcGxp
ZWQgdG9nZXRoZXIgdG8gYXZvaWQgYW55IGJyZWFrYWdlPw0KPiANCj4gV2UgYWx3YXlzIHdhbnQg
dG8gYXZvaWQgYnJlYWtpbmcgYSB3b3JraW5nIGR0YiB3aGVuIGl0IGlzIHVzZWQgd2l0aCBhIG5l
d2VyDQo+IGtlcm5lbC4NCj4gDQo+IEluIHRoaXMgY2FzZSB3ZSBuZWVkIHRvIHJldmVydCB0aGUg
a2VybmVsIHBhdGNoIGFzIGl0IGNhdXNlcyByZWdyZXNzaW9uIHdpdGggb2xkDQo+IGR0YnMuDQog
DQpTbyB0aGF0IG1lYW4gc3VjaCBraW5kIG9mIGtlcm5lbCBwYXRjaCB3aWxsIG5ldmVyIGJlIGlu
dG8ga2VybmVsPyBFdmVuIGlmIGl0IGlzIGENCm5lY2Vzc2FyeSBwYXRjaCBmb3IgZml4aW5nIHNv
bWUgb3RoZXIgaXNzdWVzPyBJIGp1c3Qgd29uZGVyIGhvdyB0aGlzIGNhc2UgYmVpbmcNCmhhbmRs
ZWQuDQoNCkFuc29uLg0K

From: Anson Huang <anson.huang@nxp.com>
Subject: RE: [PATCH V2 2/2] ARM: dts: imx6sx-sabreauto: add external 24MHz
 clock source
Date: Thu, 19 Apr 2018 03:23:39 +0000
Message-ID: <AM3PR04MB1315FCBBAFCE808BD35FF2CFF5B50@AM3PR04MB1315.eurprd04.prod.outlook.com>
References: <1521426645-19246-1-git-send-email-Anson.Huang@nxp.com>
 <1521426645-19246-2-git-send-email-Anson.Huang@nxp.com>
 <20180417142203.GM25429@dragon>
 <152410785516.46528.12432838242068784117@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <152410785516.46528.12432838242068784117@swboyd.mtv.corp.google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "S.j. Wang" <shengjiu.wang@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

DQoNCkFuc29uIEh1YW5nDQpCZXN0IFJlZ2FyZHMhDQoNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPiBGcm9tOiBTdGVwaGVuIEJveWQgW21haWx0bzpzYm95ZEBrZXJuZWwub3JnXQ0K
PiBTZW50OiBUaHVyc2RheSwgQXByaWwgMTksIDIwMTggMTE6MTggQU0NCj4gVG86IEFuc29uIEh1
YW5nIDxhbnNvbi5odWFuZ0BueHAuY29tPjsgU2hhd24gR3VvDQo+IDxzaGF3bmd1b0BrZXJuZWwu
b3JnPg0KPiBDYzogbWFyay5ydXRsYW5kQGFybS5jb207IGRldmljZXRyZWVAdmdlci5rZXJuZWwu
b3JnOw0KPiBtdHVycXVldHRlQGJheWxpYnJlLmNvbTsgbGludXgtY2xrQHZnZXIua2VybmVsLm9y
ZzsgbGludXhAYXJtbGludXgub3JnLnVrOw0KPiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3Jn
OyByb2JoK2R0QGtlcm5lbC5vcmc7IGRsLWxpbnV4LWlteA0KPiA8bGludXgtaW14QG54cC5jb20+
OyBrZXJuZWxAcGVuZ3V0cm9uaXguZGU7IEZhYmlvIEVzdGV2YW0NCj4gPGZhYmlvLmVzdGV2YW1A
bnhwLmNvbT47IFMuai4gV2FuZyA8c2hlbmdqaXUud2FuZ0BueHAuY29tPjsNCj4gbGludXgtYXJt
LWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggVjIgMi8y
XSBBUk06IGR0czogaW14NnN4LXNhYnJlYXV0bzogYWRkIGV4dGVybmFsIDI0TUh6DQo+IGNsb2Nr
IHNvdXJjZQ0KPiANCj4gUXVvdGluZyBTaGF3biBHdW8gKDIwMTgtMDQtMTcgMDc6MjI6MDUpDQo+
ID4gT24gTW9uLCBNYXIgMTksIDIwMTggYXQgMTA6MzA6NDVBTSArMDgwMCwgQW5zb24gSHVhbmcg
d3JvdGU6DQo+ID4gPiBPbiBpLk1YNlNYIFNhYnJlQXV0byBib2FyZCwgdGhlcmUgaXMgZXh0ZXJu
YWwgMjRNSHogY2xvY2sgc291cmNlIGZvcg0KPiA+ID4gYW5hbG9nIGNsb2NrMiwgYWRkIHRoaXMg
Y2xvY2sgc291cmNlIHRvIGNsb2NrIHRyZWUuDQo+ID4gPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTog
QW5zb24gSHVhbmcgPEFuc29uLkh1YW5nQG54cC5jb20+DQo+ID4gPiAtLS0NCj4gPiA+IGNoYW5n
ZXMgc2luY2UgVjE6DQo+ID4gPiAgICAgICByZW1vdmUgdW5uZWNlc3NhcnkgY2xvY2tzIGNvbnRh
aW5lci4NCj4gPg0KPiA+IEkgdW5kZXJzdGFuZCB0aGlzIGlzIHN1Z2dlc3RlZCBieSBGYWJpbywg
YnV0IEknbSBhZnJhaWQgdGhhdCBpdCdzIG5vdA0KPiA+IGdvaW5nIHRvIHdvcmsgd2l0aCBpbXhf
b2J0YWluX2ZpeGVkX2Nsb2NrKCkgY2FsbCwgd2hpY2ggaXMgY29kZWQgdG8NCj4gPiBsb29rIGZv
ciBjbG9ja3MgdW5kZXIgL2Nsb2NrcyBub2RlLg0KPiA+DQo+IA0KPiBTaG91bGQgcGF0Y2ggIzEg
YmUgZHJvcHBlZCBmcm9tIGNsayB0cmVlPw0KDQpJZiBzbywgSSB0aGluayB3ZSBzaG91bGQgdXNl
IFYxIHBhdGNoIHRvIGtlZXAgY2xvY2tzIGNvbnRhaW5lcj8NCiANCkFuc29uLg0KDQoNCg0K

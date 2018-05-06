From: Anson Huang <anson.huang@nxp.com>
Subject: RE: [PATCH V6 7/7] ARM: dts: imx6sx-sabreauto: add egalax touch
 screen support
Date: Sun, 6 May 2018 06:10:11 +0000
Message-ID: <AM3PR04MB1315E5B2A6C1DDCC6C279715F5840@AM3PR04MB1315.eurprd04.prod.outlook.com>
References: <1525508963-7986-1-git-send-email-Anson.Huang@nxp.com>
 <1525508963-7986-7-git-send-email-Anson.Huang@nxp.com>
 <CAOMZO5A7bf1qcHrWjM1mr31Nkz+oDJ=fQo3rjksp1YY-HhPM9A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOMZO5A7bf1qcHrWjM1mr31Nkz+oDJ=fQo3rjksp1YY-HhPM9A@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Haibo Chen <haibo.chen@freescale.com>, Andy Duan <fugang.duan@nxp.com>, "A.s. Dong" <aisheng.dong@nxp.com>, Robin Gong <yibin.gong@nxp.com>, dl-linux-imx <linux-imx@nxp.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

SGksIEZhYmlvDQoNCkFuc29uIEh1YW5nDQpCZXN0IFJlZ2FyZHMhDQoNCg0KPiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBGYWJpbyBFc3RldmFtIFttYWlsdG86ZmVzdGV2YW1A
Z21haWwuY29tXQ0KPiBTZW50OiBTYXR1cmRheSwgTWF5IDUsIDIwMTggMTE6MTggUE0NCj4gVG86
IEFuc29uIEh1YW5nIDxhbnNvbi5odWFuZ0BueHAuY29tPg0KPiBDYzogU2hhd24gR3VvIDxzaGF3
bmd1b0BrZXJuZWwub3JnPjsgU2FzY2hhIEhhdWVyDQo+IDxrZXJuZWxAcGVuZ3V0cm9uaXguZGU+
OyBGYWJpbyBFc3RldmFtIDxmYWJpby5lc3RldmFtQG54cC5jb20+OyBSb2INCj4gSGVycmluZyA8
cm9iaCtkdEBrZXJuZWwub3JnPjsgTWFyayBSdXRsYW5kIDxtYXJrLnJ1dGxhbmRAYXJtLmNvbT47
DQo+IEhhaWJvIENoZW4gPGhhaWJvLmNoZW5AZnJlZXNjYWxlLmNvbT47IEFuZHkgRHVhbg0KPiA8
ZnVnYW5nLmR1YW5AbnhwLmNvbT47IEEucy4gRG9uZyA8YWlzaGVuZy5kb25nQG54cC5jb20+OyBS
b2JpbiBHb25nDQo+IDx5aWJpbi5nb25nQG54cC5jb20+OyBkbC1saW51eC1pbXggPGxpbnV4LWlt
eEBueHAuY29tPjsgbW9kZXJhdGVkDQo+IGxpc3Q6QVJNL0ZSRUVTQ0FMRSBJTVggLyBNWEMgQVJN
IEFSQ0hJVEVDVFVSRQ0KPiA8bGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnPjsg
b3BlbiBsaXN0Ok9QRU4gRklSTVdBUkUgQU5EDQo+IEZMQVRURU5FRCBERVZJQ0UgVFJFRSBCSU5E
SU5HUyA8ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc+OyBsaW51eC1rZXJuZWwNCj4gPGxpbnV4
LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggVjYgNy83XSBB
Uk06IGR0czogaW14NnN4LXNhYnJlYXV0bzogYWRkIGVnYWxheCB0b3VjaA0KPiBzY3JlZW4gc3Vw
cG9ydA0KPiANCj4gT24gU2F0LCBNYXkgNSwgMjAxOCBhdCA1OjI5IEFNLCBBbnNvbiBIdWFuZyA8
QW5zb24uSHVhbmdAbnhwLmNvbT4NCj4gd3JvdGU6DQo+IA0KPiA+ICAmaW9tdXhjIHsNCj4gPiAr
ICAgICAgIHBpbmN0cmxfZWdhbGF4X2ludDogZWdhbGF4LWludGdycCB7DQo+ID4gKyAgICAgICAg
ICAgICAgIGZzbCxwaW5zID0gPA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIE1YNlNYX1BB
RF9TRDRfUkVTRVRfQl9fR1BJTzZfSU9fMjINCj4gMHg4MDAwMDAwMA0KPiANCj4gUGxlYXNlIGF2
b2lkIHVzaW5nIDB4ODAwMDAwMDAgYW5kIHVzZSB0aGUgcmVhbCBJT01VWCB2YWx1ZSBpbnN0ZWFk
Lg0KIA0KV2lsbCB1c2UgdGhlIGV4cGVjdGVkIHBhZCBzZXR0aW5ncyBpbiBuZXh0IHZlcnNpb24u
IFRoYW5rcy4NCg0KQW5zb24uDQo=

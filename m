From: Anson Huang <anson.huang@nxp.com>
Subject: RE: [PATCH V2 1/2] dt-bindings: reset: imx7: Add support for i.MX8MM
Date: Thu, 4 Jul 2019 09:46:17 +0000
Message-ID: <DB3PR0402MB39167FBAA2A3867148063F83F5FA0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <20190704092600.38015-1-Anson.Huang@nxp.com>
 <1562233305.6641.8.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1562233305.6641.8.camel@pengutronix.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, Leonard Crestez <leonard.crestez@nxp.com>, Jacky Bai <ping.bai@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

SGksIFBoaWxpcHANCg0KPiBPbiBUaHUsIDIwMTktMDctMDQgYXQgMTc6MjUgKzA4MDAsIEFuc29u
Lkh1YW5nQG54cC5jb20gd3JvdGU6DQo+ID4gRnJvbTogQW5zb24gSHVhbmcgPEFuc29uLkh1YW5n
QG54cC5jb20+DQo+ID4NCj4gPiBpLk1YOE1NIGNhbiByZXVzZSBpLk1YOE1RJ3MgcmVzZXQgZHJp
dmVyLCB1cGRhdGUgdGhlIGNvbXBhdGlibGUNCj4gPiBwcm9wZXJ0eSBhbmQgcmVsYXRlZCBpbmZv
IHRvIHN1cHBvcnQgaS5NWDhNTS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEFuc29uIEh1YW5n
IDxBbnNvbi5IdWFuZ0BueHAuY29tPg0KPiA+IC0tLQ0KPiA+IE5ldyBwYXRjaC4NCj4gPiAtLS0N
Cj4gPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jlc2V0L2ZzbCxpbXg3LXNy
Yy50eHQgfCA0ICsrLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvcmVzZXQvZnNsLGlteDctc3JjLnR4dA0KPiA+IGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3Jlc2V0L2ZzbCxpbXg3LXNyYy50eHQNCj4gPiBpbmRleCAxM2Uw
OTUxLi5iYzI0YzQ1IDEwMDY0NA0KPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9yZXNldC9mc2wsaW14Ny1zcmMudHh0DQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3Jlc2V0L2ZzbCxpbXg3LXNyYy50eHQNCj4gPiBAQCAtNyw3ICs3
LDcgQEAgY29udHJvbGxlciBiaW5kaW5nIHVzYWdlLg0KPiA+ICBSZXF1aXJlZCBwcm9wZXJ0aWVz
Og0KPiA+ICAtIGNvbXBhdGlibGU6DQo+ID4gIAktIEZvciBpLk1YNyBTb0NzIHNob3VsZCBiZSAi
ZnNsLGlteDdkLXNyYyIsICJzeXNjb24iDQo+ID4gLQktIEZvciBpLk1YOE1RIFNvQ3Mgc2hvdWxk
IGJlICJmc2wsaW14OG1xLXNyYyIsICJzeXNjb24iDQo+ID4gKwktIEZvciBpLk1YOE1RL2kuTVg4
TU0gU29DcyBzaG91bGQgYmUgImZzbCxpbXg4bXEtc3JjIiwgInN5c2NvbiINCj4gDQo+IFBsZWFz
ZSBzdGlsbCBhZGQgdGhlICJmc2wsaW14OG1tLXNyYyIgZm9yIGkuTVg4TU0sIGp1c3QgaW4gY2Fz
ZSBhIHNpZ25pZmljYW50DQo+IGRpZmZlcmVuY2UgaXMgZGlzY292ZXJlZCBsYXRlci4NCg0KT0ss
IHRoZW4gSSB3aWxsIGFkZCBhIG5ldyBsaW5lIGFzIGJlbG93Og0KDQpGb3IgaS5NWDhNTSBTb0Nz
IHNob3VsZCBiZSAiZnNsLGlteDhtbS1zcmMiLCAiZnNsLGlteDhtcS1zcmMiLCAic3lzY29uIg0K
DQpBbnNvbi4NCg0KPiANCj4gcmVnYXJkcw0KPiBQaGlsaXBwDQo=

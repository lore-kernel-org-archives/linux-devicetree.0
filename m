From: Anson Huang <anson.huang@nxp.com>
Subject: RE: [PATCH 1/2] arm64: dts: imx8mm: Remove incorrect fallback
 compatible for ocotp
Date: Wed, 11 Sep 2019 09:05:49 +0000
Message-ID: <DB3PR0402MB3916E0F566E35DD30275A8E9F5B10@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1568211887-19318-1-git-send-email-Anson.Huang@nxp.com>
 <749f8dc6-dbf9-127c-9924-33432b8af00a@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <749f8dc6-dbf9-127c-9924-33432b8af00a@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, Leonard Crestez <leonard.crestez@nxp.com>, Jacky Bai <ping.bai@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, Jun Li <jun.li@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

SGksIERhbmllbA0KDQo+IE9uIDExLzA5LzIwMTkgMTY6MjQsIEFuc29uIEh1YW5nIHdyb3RlOg0K
PiA+IENvbXBhcmVkIHRvIGkuTVg3RCwgaS5NWDhNTSBoYXMgZGlmZmVyZW50IG9jb3RwIGxheW91
dCwgc28gaXQgc2hvdWxkDQo+ID4gTk9UIHVzZSAiZnNsLGlteDdkLW9jb3RwIiBhcyBvY290cCdz
IGZhbGxiYWNrIGNvbXBhdGlibGUsIHJlbW92ZSBpdC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6
IEFuc29uIEh1YW5nIDxBbnNvbi5IdWFuZ0BueHAuY29tPg0KPiA+IC0tLQ0KPiA+ICBhcmNoL2Fy
bTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4bW0uZHRzaSB8IDIgKy0NCj4gPiAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0
IGEvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OG1tLmR0c2kNCj4gPiBiL2FyY2gv
YXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhtbS5kdHNpDQo+ID4gaW5kZXggNWY5ZDBkYS4u
N2M0ZGNjZSAxMDA2NDQNCj4gPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9p
bXg4bW0uZHRzaQ0KPiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDht
bS5kdHNpDQo+ID4gQEAgLTQyNiw3ICs0MjYsNyBAQA0KPiA+ICAJCQl9Ow0KPiA+DQo+ID4gIAkJ
CW9jb3RwOiBvY290cC1jdHJsQDMwMzUwMDAwIHsNCj4gPiAtCQkJCWNvbXBhdGlibGUgPSAiZnNs
LGlteDhtbS1vY290cCIsICJmc2wsaW14N2QtDQo+IG9jb3RwIiwgInN5c2NvbiI7DQo+ID4gKwkJ
CQljb21wYXRpYmxlID0gImZzbCxpbXg4bW0tb2NvdHAiLCAic3lzY29uIjsNCj4gPiAgCQkJCXJl
ZyA9IDwweDMwMzUwMDAwIDB4MTAwMDA+Ow0KPiA+ICAJCQkJY2xvY2tzID0gPCZjbGsgSU1YOE1N
X0NMS19PQ09UUF9ST09UPjsNCj4gPiAgCQkJCS8qIEZvciBudm1lbSBzdWJub2RlcyAqLw0KPiAN
Cj4gV2h5IG5vdCBmb2xkIHRoZSB0d28gcGF0Y2hlcz8NCg0KRm9yIGkuTVg4TU0sIGl0IGp1c3Qg
cmVtb3ZlcyB0aGUgaW5jb3JyZWN0IGZhbGxiYWNrIGNvbXBhdGlibGUsIGZvciBpLk1YOE1OLCBp
dCBuZWVkcw0KdG8gcmVwbGFjZSB0aGUgaW5jb3JyZWN0IGZhbGxiYWNrIGNvbXBhdGlibGUgaW4g
b3JkZXIgdG8gc3VwcG9ydCBTb0MgVUlEIHJlYWQsIHNvIEkgdGhpbmsNCnRoaXMgc2hvdWxkIGJl
IDIgc2VwYXJhdGUgcGF0Y2g/DQoNClRoYW5rcywNCkFuc29uLg0K

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Subject: Re: [PATCH v3 15/21] ARM: dts: imx6ull-colibri: reduce v_batt current
 in power off
Date: Fri, 9 Aug 2019 15:40:09 +0000
Message-ID: <b1d05badaf2bfbb09f67be76ccc5a98105222c9f.camel@toradex.com>
References: <20190807082556.5013-1-philippe.schenker@toradex.com>
         <20190807082556.5013-16-philippe.schenker@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190807082556.5013-16-philippe.schenker@toradex.com>
Content-Language: en-US
Content-ID: <9B0DAF92E0C01F4F8AD2F603DABAA167@eurprd05.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Max Krummenacher <max.krummenacher@toradex.com>, "stefan@agner.ch" <stefan@agner.ch>, Philippe Schenker <philippe.schenker@toradex.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "michal.vokac@ysoft.com" <michal.vokac@ysoft.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "festevam@gmail.com" <festevam@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-imx@nxp.com" <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

T24gV2VkLCAyMDE5LTA4LTA3IGF0IDA4OjI2ICswMDAwLCBQaGlsaXBwZSBTY2hlbmtlciB3cm90
ZToNCj4gRnJvbTogTWF4IEtydW1tZW5hY2hlciA8bWF4LmtydW1tZW5hY2hlckB0b3JhZGV4LmNv
bT4NCj4gDQo+IFJlZHVjZSB0aGUgY3VycmVudCBkcmF3biBmcm9tIFZDQ19CQVRUIHdoZW4gdGhl
IG1haW4gcG93ZXIgb24gdGhlIDNWMw0KPiBwaW5zIHRvIHRoZSBtb2R1bGUgYXJlIHN3aXRjaGVk
IG9mZi4NCj4gDQo+IFRoaXMgc3dpdGNoZXMgb2ZmIFNvQyBpbnRlcm5hbCBwdWxsIHJlc2lzdG9y
cyB3aGljaCBhcmUgcHJvdmlkZWQgb24NCj4gdGhlDQo+IG1vZHVsZSBmb3IgVEFNUEVSNyBhbmQg
VEFNUEVSOSBTb0MgcGluIGFuZCBzd2l0Y2hlcyBvbiBhIHB1bGwgZG93bg0KPiBpbnN0ZWFkIG9m
IGEgcHVsbHVwIGZvciB0aGUgVVNCQ19ERVQgbW9kdWxlIHBpbiAoVEFNUEVSMikuDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBNYXggS3J1bW1lbmFjaGVyIDxtYXgua3J1bW1lbmFjaGVyQHRvcmFkZXgu
Y29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwZSBTY2hlbmtlciA8cGhpbGlwcGUuc2NoZW5r
ZXJAdG9yYWRleC5jb20+DQoNCkFja2VkLWJ5OiBNYXJjZWwgWmlzd2lsZXIgPG1hcmNlbC56aXN3
aWxlckB0b3JhZGV4LmNvbT4NCg0KPiAtLS0NCj4gDQo+IENoYW5nZXMgaW4gdjM6IE5vbmUNCj4g
Q2hhbmdlcyBpbiB2MjogTm9uZQ0KPiANCj4gIGFyY2gvYXJtL2Jvb3QvZHRzL2lteDZ1bGwtY29s
aWJyaS5kdHNpIHwgNiArKystLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyks
IDMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvaW14
NnVsbC1jb2xpYnJpLmR0c2kNCj4gYi9hcmNoL2FybS9ib290L2R0cy9pbXg2dWxsLWNvbGlicmku
ZHRzaQ0KPiBpbmRleCAxMDE5Y2U2OWEyNDIuLjFmMTEyZWM1NWU1YyAxMDA2NDQNCj4gLS0tIGEv
YXJjaC9hcm0vYm9vdC9kdHMvaW14NnVsbC1jb2xpYnJpLmR0c2kNCj4gKysrIGIvYXJjaC9hcm0v
Ym9vdC9kdHMvaW14NnVsbC1jb2xpYnJpLmR0c2kNCj4gQEAgLTUzMywxOSArNTMzLDE5IEBADQo+
ICANCj4gIAlwaW5jdHJsX3NudnNfYWQ3ODc5X2ludDogc252cy1hZDc4NzktaW50LWdycCB7IC8q
IFRPVUNIDQo+IEludGVycnVwdCAqLw0KPiAgCQlmc2wscGlucyA9IDwNCj4gLQkJCU1YNlVMTF9Q
QURfU05WU19UQU1QRVI3X19HUElPNV9JTzA3CTB4MWIwDQo+IGIwDQo+ICsJCQlNWDZVTExfUEFE
X1NOVlNfVEFNUEVSN19fR1BJTzVfSU8wNwkweDEwMA0KPiBiMA0KPiAgCQk+Ow0KPiAgCX07DQo+
ICANCj4gIAlwaW5jdHJsX3NudnNfcmVnX3NkOiBzbnZzLXJlZy1zZC1ncnAgew0KPiAgCQlmc2ws
cGlucyA9IDwNCj4gLQkJCU1YNlVMTF9QQURfU05WU19UQU1QRVI5X19HUElPNV9JTzA5CTB4NDAw
DQo+IDFiOGIwDQo+ICsJCQlNWDZVTExfUEFEX1NOVlNfVEFNUEVSOV9fR1BJTzVfSU8wOQkweDQw
MA0KPiAxMDBiMA0KPiAgCQk+Ow0KPiAgCX07DQo+ICANCj4gIAlwaW5jdHJsX3NudnNfdXNiY19k
ZXQ6IHNudnMtdXNiYy1kZXQtZ3JwIHsNCj4gIAkJZnNsLHBpbnMgPSA8DQo+IC0JCQlNWDZVTExf
UEFEX1NOVlNfVEFNUEVSMl9fR1BJTzVfSU8wMgkweDFiMA0KPiBiMA0KPiArCQkJTVg2VUxMX1BB
RF9TTlZTX1RBTVBFUjJfX0dQSU81X0lPMDIJMHgxMzANCj4gYjANCj4gIAkJPjsNCj4gIAl9Ow0K

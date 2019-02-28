From: Trent Piepho <tpiepho@impinj.com>
Subject: Re: [PATCH 2/2] PCI: imx6: Add code to request/control "pcie_aux"
 clock for i.MX8MQ
Date: Thu, 28 Feb 2019 21:23:58 +0000
Message-ID: <1551389037.6059.3.camel@impinj.com>
References: <20190212015108.16952-1-andrew.smirnov@gmail.com>
         <20190212015108.16952-3-andrew.smirnov@gmail.com>
         <1549964166.2546.21.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1549964166.2546.21.camel@pengutronix.de>
Content-Language: en-US
Content-ID: <E751255E04A9D749A2A778E78952A053@namprd06.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "l.stach@pengutronix.de" <l.stach@pengutronix.de>, "andrew.smirnov@gmail.com" <andrew.smirnov@gmail.com>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>
Cc: "linux-imx@nxp.com" <linux-imx@nxp.com>, "hongxing.zhu@nxp.com" <hongxing.zhu@nxp.com>, "cphealy@gmail.com" <cphealy@gmail.com>, "aisheng.dong@nxp.com" <aisheng.dong@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "fabio.estevam@nxp.com" <fabio.estevam@nxp.com>, "robh@kernel.org" <robh@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "bhelgaas@google.com" <bhelgaas@google.com>, "leonard.crestez@nxp.com" <leonard.crestez@nxp.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

T24gVHVlLCAyMDE5LTAyLTEyIGF0IDEwOjM2ICswMTAwLCBMdWNhcyBTdGFjaCB3cm90ZToNCj4g
QW0gTW9udGFnLCBkZW4gMTEuMDIuMjAxOSwgMTc6NTEgLTA4MDAgc2NocmllYiBBbmRyZXkgU21p
cm5vdjoNCj4gPiBQQ0llIElQIGJsb2NrIGhhcyBhZGRpdGlvbmFsIGNsb2NrLCAicGNpZV9hdXgi
LCB0aGF0IG5lZWRzIHRvIGJlDQo+ID4gY29udHJvbGxlZCBieSB0aGUgZHJpdmVyLiBBZGQgY29k
ZSB0byBzdXBwb3J0IHRoYXQuDQoNClRoaXMgYnJlYWtzIGlNWDdkLg0KDQo+ID4gDQo+ID4gQEAg
LTEwNDksNiArMTA1OSwxMiBAQCBzdGF0aWMgaW50IGlteDZfcGNpZV9wcm9iZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQ0KPiA+ICAJCQlkZXZfZXJyKGRldiwgIkZhaWxlZCB0byBnZXQg
UENJRSBBUFBTIHJlc2V0IGNvbnRyb2xcbiIpOw0KPiA+ICAJCQlyZXR1cm4gUFRSX0VSUihpbXg2
X3BjaWUtPmFwcHNfcmVzZXQpOw0KPiA+ICAJCX0NCj4gPiArDQo+ID4gKwkJaW14Nl9wY2llLT5w
Y2llX2F1eCA9IGRldm1fY2xrX2dldChkZXYsICJwY2llX2F1eCIpOw0KPiA+ICsJCWlmIChJU19F
UlIoaW14Nl9wY2llLT5wY2llX2F1eCkpIHsNCj4gPiArCQkJZGV2X2VycihkZXYsICJwY2llX2F1
eCBjbG9jayBzb3VyY2UgbWlzc2luZyBvciBpbnZhbGlkXG4iKTsNCj4gPiArCQkJcmV0dXJuIFBU
Ul9FUlIoaW14Nl9wY2llLT5wY2llX2F1eCk7DQo+ID4gKwkJfQ0KPiA+ICAJCWJyZWFrOw0KPiA+
ICAJZGVmYXVsdDoNCj4gPiAgCQlicmVhazsNCg0KT25lIGNhbid0IHNlZSBlbm91Z2ggY29udGV4
dCBpbiB0aGUgcGF0Y2ggYWJvdmUsIGJ1dCBpbiBsaW51eC1uZXh0IHRoaXMNCnNlY3Rpb24gaXMg
dW5kZXINCg0KICAgICAgICAgY2FzZSBJTVg3RDoNCiAgICAgICAgIGNhc2UgSU1YOE1ROg0KDQpJ
dCdzIGJlaW5nIGFwcGxpZWQgdG8gaW14N2QgYW5kIG5vdCBqdXN0IGlteDhtcSBhbmQgc28gYnJl
YWtzIGJlY2F1c2UNCmlteDdkIGR0cyBmaWxlcyBkb24ndCBoYXZlIHRoaXMgY2xvY2suICBOb3Qg
c3VyZSBpZiB0aGlzIGlzIGEgYnVnIGluDQp0aGlzIGNvbW1pdCBvciBzb21lIGtpbmQgb2YgbWVy
Z2UvcmViYXNlIG1pc3Rha2UuDQoNCg==

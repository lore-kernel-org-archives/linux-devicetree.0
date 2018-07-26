Return-Path: <SRS0=Cg5y=KK=renesas.com=Chris.Brandt@kernel.org>
From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH v2 2/3] serial: sh-sci: Add support for separate TEI+DRI
 interrupts
Date: Thu, 26 Jul 2018 12:16:54 +0000
Message-ID: 
 <TYXPR01MB1568937DFF057AC653012AB78A2B0@TYXPR01MB1568.jpnprd01.prod.outlook.com>
References: <20180725143850.32985-1-chris.brandt@renesas.com>
 <20180725143850.32985-3-chris.brandt@renesas.com>
 <CAMuHMdXxyAuhW-+Vh_TE7M+uFT6HYngg2BAg8inVJB6qhOuXmg@mail.gmail.com>
In-Reply-To: 
 <CAMuHMdXxyAuhW-+Vh_TE7M+uFT6HYngg2BAg8inVJB6qhOuXmg@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS  <devicetree@vger.kernel.org>, Linux-Renesas" <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms+renesas@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

SGkgR2VlcnQsDQoNCk9uIFRodXJzZGF5LCBKdWx5IDI2LCAyMDE4LCBHZWVydCBVeXR0ZXJob2V2
ZW4gd3JvdGU6DQo+ID4gK3N0YXRpYyBpcnFyZXR1cm5fdCBzY2lfYnJfaW50ZXJydXB0KGludCBp
cnEsIHZvaWQgKnB0cik7DQo+IA0KPiBZb3UgY2FuIGF2b2lkIHRoZSBmb3J3YXJkIGRlY2xhcmF0
aW9uIGJ5IG1vdmluZyB0aGUgd2hvbGUgZnVuY3Rpb24gaGVyZS4NCg0KT0suDQoNCj4gPiBAQCAt
MjgwOSw2ICsyODQ1LDggQEAgc3RhdGljIGludCBzY2lfaW5pdF9zaW5nbGUoc3RydWN0IHBsYXRm
b3JtX2RldmljZQ0KPiAqZGV2LA0KPiA+ICAgICAgICAgICAgICAgICBzY2lfcG9ydC0+aXJxc1sx
XSA9IHNjaV9wb3J0LT5pcnFzWzBdOw0KPiA+ICAgICAgICAgICAgICAgICBzY2lfcG9ydC0+aXJx
c1syXSA9IHNjaV9wb3J0LT5pcnFzWzBdOw0KPiA+ICAgICAgICAgICAgICAgICBzY2lfcG9ydC0+
aXJxc1szXSA9IHNjaV9wb3J0LT5pcnFzWzBdOw0KPiA+ICsgICAgICAgICAgICAgICBzY2lfcG9y
dC0+aXJxc1s0XSA9IHNjaV9wb3J0LT5pcnFzWzBdOw0KPiA+ICsgICAgICAgICAgICAgICBzY2lf
cG9ydC0+aXJxc1s1XSA9IHNjaV9wb3J0LT5pcnFzWzBdOw0KPiANCj4gWW91IG1heSB3YW50IHRv
IHN0YXJ0IHVzaW5nIGEgbG9vcCBmcm9tIDEgdG8gQVJSQVlfU0laRShzY2lfcG9ydC0+aXJxcykg
LQ0KPiAxDQo+IGluc3RlYWQuDQoNCk9LLCBJJ2xsIGNoYW5nZSBpdC4NCg0KQ2hyaXMNCg0K

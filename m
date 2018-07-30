Return-Path: <SRS0=8Sio=KO=renesas.com=Chris.Brandt@kernel.org>
From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH 4/4] serial: sh-sci: Improve support for separate TEI and
 DRI interrupts
Date: Mon, 30 Jul 2018 12:55:15 +0000
Message-ID: 
 <TY1PR01MB1562B886BCCAB39279400A4A8A2F0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20180727210916.66642-1-chris.brandt@renesas.com>
 <20180727210916.66642-5-chris.brandt@renesas.com>
 <CAMuHMdVSF-qncCA4sMd8c0d28QaanvPTPqJZ1gtvAja_cf-dVg@mail.gmail.com>
 <TY1PR01MB1562C421079461E7CC3FA1208A2F0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
 <CAMuHMdWyLzQ0f2jZiOCb_P6FO_A5f_iTkrABa5GR0AmQpzXiuQ@mail.gmail.com>
In-Reply-To: 
 <CAMuHMdWyLzQ0f2jZiOCb_P6FO_A5f_iTkrABa5GR0AmQpzXiuQ@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS  <devicetree@vger.kernel.org>, Linux-Renesas" <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms+renesas@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

SGkgR2VlcnQsDQoNCk9uIE1vbmRheSwgSnVseSAzMCwgMjAxOCwgR2VlcnQgVXl0dGVyaG9ldmVu
IHdyb3RlOg0KPiBUaGF0J3Mgbm90IHRoZSBhcnJheSwgYnV0IHRoZSBlbnVtLg0KPiANCj4gVGhl
IGFycmF5IGlzIGluIHN0cnVjdCBzY2lfcG9ydDoNCj4gDQo+ICAgICAgICAgaW50ICAgICAgICAg
ICAgICAgICAgICAgaXJxc1tTQ0l4X05SX0lSUVNdOw0KPiANCj4gSXQgaGFzIGZvdXIgZW50cmll
cywgYXQgaW5kaWNlcyAwLi4zLg0KDQo+IGlycXNbU0NJeF9OUl9JUlFTXSBkb2VzIG5vdCBleGlz
dCENCj4gDQo+IHNjaV9pcnFfZGVzY1tTQ0l4X05SX0lSUVNdIGFrYSBzY2lfaXJxX2Rlc2NbU0NJ
eF9NVVhfSVJRXSBkb2VzIGV4aXQsDQo+IGJ1dCB0aGF0J3MgYSBkaWZmZXJlbnQgYXJyYXkuDQoN
Cg0KPiBZb3VyIGxvb3AgaXM6DQo+IA0KPiAgICAgZm9yIChpID0gMTsgaSA8IEFSUkFZX1NJWkUo
c2NpX3BvcnQtPmlycXMpIC0gMTsgaSsrKQ0KPiANCj4gSXQgbG9vcHMgb3ZlciAxLi5BUlJBWV9T
SVpFKHNjaV9wb3J0LT5pcnFzKSAtIDIuDQo+IE5vdGUgdGhlICI8IiBhbmQgdGhlICItIDEiLg0K
DQoNCkFoaGhoLCB5b3UncmUgcmlnaHQhDQpTb3JyeSBhYm91dCB0aGF0Lg0KDQpUaGFua3MsDQpD
aHJpcw0KDQo=

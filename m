Return-Path: <SRS0=Jc5u=TK=renesas.com=Chris.Brandt@kernel.org>
From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH v2 11/15] usb: renesas_usbhs: Add support for RZ/A2
Date: Fri, 10 May 2019 14:20:50 +0000
Message-ID: 
 <TY1PR01MB15628F7CF651279C59FE864D8A0C0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20190509201142.10543-1-chris.brandt@renesas.com>
 <20190509201142.10543-12-chris.brandt@renesas.com>
 <CAMuHMdV7aQd-g1t_t27d8ge69e3VZnG7nQ7Lzre=qrJ1UrUuuA@mail.gmail.com>
 <OSBPR01MB3174FA32BADD2B97A6003ADCD80C0@OSBPR01MB3174.jpnprd01.prod.outlook.com>
 <OSBPR01MB317441157A3BFA9148FFF558D80C0@OSBPR01MB3174.jpnprd01.prod.outlook.com>
In-Reply-To: 
 <OSBPR01MB317441157A3BFA9148FFF558D80C0@OSBPR01MB3174.jpnprd01.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Simon Horman <horms@verge.net.au>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, USB list <linux-usb@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS  <devicetree@vger.kernel.org>, Linux-Renesas" <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

SGkgU2hpbW9kYeOBleOCkw0KDQo+IEZyb206IFlvc2hpaGlybyBTaGltb2RhDQo+IFNlbnQ6IEZy
aWRheSwgTWF5IDEwLCAyMDE5IDc6MDAgQU0NCg0KPiBJIGhhdmUgc3VibWl0dGVkIHN1Y2ggYSBw
YXRjaCBhcyBmb2xsb3dpbmc6DQo+IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gv
MTA5Mzg1NzUvDQoNCk9LLg0KSSB3aWxsIHJlYmFzZSBteSBwYXRjaGVzIG9uIHRvcCBvZiB5b3Vy
IHBhdGNoLg0KSSB3aWxsIHNheSBteSBwYXRjaCBzZXJpZXMgZGVwZW5kcyBvbiB5b3VyIHBhdGNo
Lg0KDQo+IEFib3V0IFNvQyBwYXJhbWV0ZXJzLCBJIHRoaW5rIGl0IGlzIGJldHRlciB0byBhZGQg
bWVtYmVycyBpbnRvIHN0cnVjdA0KPiByZW5lc2FzX3VzYmhzX2RyaXZlcl9wYXJhbSBsaWtlDQo+
IGhhc191c2JfZG1hYyBpbnN0ZWFkIG9mIFVTQkhTRl8qIGRlZmluaXRpb25zLiBJbiBvdGhlciB3
b3Jkcywgd2UgZG9uJ3QNCj4gbmVlZCB0aGUgcGF0Y2ggMDgvMTUgYW5kDQo+IHBhdGNoIDA5LzE1
IGFuZCAxMC8xNSBzaG91bGQgYWRkIGVhY2ggbWVtYmVyIGZvciBpdC4gQ2hyaXMtc2FuLCB3aGF0
IGRvDQo+IHlvdSB0aGluaz8NCg0KSSB0aGluayB0aGF0IGlzIGdvb2QuDQoNCk5ldyBQYXRjaCAw
OC8xNToNCiAqIEFkZCB0byBzdHJ1Y3QgcmVuZXNhc191c2Joc19kcml2ZXJfcGFyYW06DQogICAg
ICB1MzIgaGFzX3J1bnRpbWVfcHdjdHJsOjE7DQogKiBSZW1vdmUgVVNCSFNGXyoNCiAqIFJlbW92
ZSB1c2Joc2NfZmxhZ3NfKg0KDQpOZXcgUGF0Y2ggMDkvMTU6DQoqIEFkZCB0byBzdHJ1Y3QgcmVu
ZXNhc191c2Joc19kcml2ZXJfcGFyYW06DQogICAgIHUzMiBoYXNfY25lbjoxOw0KDQpOZXcgUGF0
Y2ggMTAvMTU6DQoqIEFkZCB0byBzdHJ1Y3QgcmVuZXNhc191c2Joc19kcml2ZXJfcGFyYW06DQog
ICAgIHUzMiBjZmlmb19ieXRlX2FkZHI6MTsNCg0KDQpDaHJpcw0KDQo=

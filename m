Return-Path: <SRS0=EyOi=LL=renesas.com=Chris.Brandt@kernel.org>
From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH] clk: renesas: cpg-mssr: Add R7S9210 support
Date: Tue, 28 Aug 2018 17:17:54 +0000
Message-ID: 
 <TY1PR01MB1562485EE3C0F9C5A3827CDD8A0A0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20180821032020.81254-1-chris.brandt@renesas.com>
 <CAMuHMdUVfMgUYat8TR__hiOQEWHXL1EYMN11iMc5TGnhnZALLQ@mail.gmail.com>
 <TY1PR01MB15620184F9EA4E62E21D1D688A0B0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
 <CAMuHMdVd7wT5vPrHFAgHYqNWtJNjbSG7GaaPaMVD12cfkg8E2A@mail.gmail.com>
In-Reply-To: 
 <CAMuHMdVd7wT5vPrHFAgHYqNWtJNjbSG7GaaPaMVD12cfkg8E2A@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-clk <linux-clk@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS  <devicetree@vger.kernel.org>, Linux-Renesas" <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms+renesas@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

SGkgR2VlcnQsDQoNClNpbmNlIG15IGNvbmZpZyBmb3IgUlovQTIgZG9lcyBub3Qgc2V0IENPTkZJ
R19SRVNFVF9DT05UUk9MTEVSLCBub25lIG9mIA0KdGhlIHJlc2V0IGNvZGUgaXMgYnVpbHQgYW5k
IGNwZ19tc3NyX3Jlc2V0X2NvbnRyb2xsZXJfcmVnaXN0ZXIoKSBqdXN0IA0KZW5kcyB1cCBiZWlu
ZyBhbiBlbXB0eSBmdW5jdGlvbi4NCg0KU28gYmFzaWNhbGx5IG15IG9ubHkgY2hhbmdlIGF0IHRo
aXMgcG9pbnQgaXMgdG8gbWFrZSBEVFMgYW5kIHRoZSBtb2R1bGUgDQpjbG9jayB0YWJsZSB1c2Ug
IjM2IiBpbnN0ZWFkIG9mICIzMDYiLg0KDQpBcmUgeW91IE9LIHdpdGggdGhlIGlkZWEgb2YgYWRk
aW5nIGEgbWFjcm8gKCJTVEJDUl9JRCIpIGluIA0KaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9y
ZW5lc2FzLWNwZy1tc3NyLmg/DQoNCg0KRFRTOg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0NCglvc3Rt
MDogdGltZXJAZTgwM2IwMDAgew0KCQljb21wYXRpYmxlID0gInJlbmVzYXMscjdzOTIxMC1vc3Rt
IiwgInJlbmVzYXMsb3N0bSI7DQoJCXJlZyA9IDwweGU4MDNiMDAwIDB4MzA+Ow0KCQlpbnRlcnJ1
cHRzID0gPEdJQ19TUEkgNTYgSVJRX1RZUEVfRURHRV9SSVNJTkc+Ow0KCQljbG9ja3MgPSA8JmNw
ZyBDUEdfTU9EIFNUQkNSX0lEKDM2KT47DQoJCWNsb2NrLW5hbWVzID0gIm9zdG0wIjsNCgkJcG93
ZXItZG9tYWlucyA9IDwmY3BnPjsNCgkJc3RhdHVzID0gImRpc2FibGVkIjsNCgl9Ow0KDQoNCg0K
cjdzOTIxMC1jcGctbXNzci5jOg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0NCnN0YXRpYyBjb25zdCBz
dHJ1Y3QgbXNzcl9tb2RfY2xrIHI3czkyMTBfbW9kX2Nsa3NbXSBfX2luaXRjb25zdCA9IHsNCglE
RUZfTU9EKCJvc3RtMCIsCVNUQkNSX0lEKDM2KSwJUjdTOTIxMF9DTEtfUDFDKSwNCglERUZfTU9E
KCJvc3RtMSIsCVNUQkNSX0lEKDM1KSwJUjdTOTIxMF9DTEtfUDFDKSwNCglERUZfTU9EKCJvc3Rt
MiIsCVNUQkNSX0lEKDM0KSwJUjdTOTIxMF9DTEtfUDFDKSwNCg0KDQpUaGFua3MsDQpDaHJpcw0K
DQo=

Return-Path: <SRS0=E+ci=ND=nvidia.com=swarren@kernel.org>
From: Stephen Warren <swarren@nvidia.com>
Subject: RE: using interrupt controller dt-bindings macros in Non GPL dts
 files
Date: Tue, 23 Oct 2018 19:39:31 +0000
Message-ID: <2f64ffc4477a4f17b4f8188e61c52ae8@HQMAIL107.nvidia.com>
References: <HE1PR0402MB3323967BD6C0E11C738BFF38F1F40@HE1PR0402MB3323.eurprd04.prod.outlook.com>
 <20181022082906.GE7068@kroah.com>
 <HE1PR0402MB3323E108AF8810DEC38B7691F1F40@HE1PR0402MB3323.eurprd04.prod.outlook.com>
 <20181022103426.GA4546@kroah.com>
 <CADRPPNQyxKpz8QY0myVOz9+sA-aAnwJptcaxxxBnXUskT=f6Lg@mail.gmail.com>
In-Reply-To: <CADRPPNQyxKpz8QY0myVOz9+sA-aAnwJptcaxxxBnXUskT=f6Lg@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
To: Li Yang <leoyang.li@nxp.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "pankaj.bansal@nxp.com" <pankaj.bansal@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "geert+renesas@glider.be" <geert+renesas@glider.be>, Thierry Reding <treding@nvidia.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE" BINDINGS" <devicetree@vger.kernel.org>, "V.Sethi@nxp.com, " <V.Sethi@nxp.com>, udit.kumar@nxp.com" <udit.kumar@nxp.com>
List-ID: <devicetree@vger.kernel.org>

TGkgWWFuZyB3cm90ZSBhdCBUdWVzZGF5LCBPY3RvYmVyIDIzLCAyMDE4IDE6MTAgUE06DQo+IE9u
IE1vbiwgT2N0IDIyLCAyMDE4IGF0IDU6MzUgQU0gR3JlZyBLcm9haC1IYXJ0bWFuDQo+IDxncmVn
a2hAbGludXhmb3VuZGF0aW9uLm9yZz4gd3JvdGU6DQo+ID4NCj4gPiBPbiBNb24sIE9jdCAyMiwg
MjAxOCBhdCAwOToxODowMkFNICswMDAwLCBQYW5rYWogQmFuc2FsIHdyb3RlOg0KPiA+ID4gMi4g
V291bGQgaXQgYmUgcG9zc2libGUgZm9yIHRoZSBjb3B5cmlnaHQgb3duZXJzIG9mIHRoZXNlIGhl
YWRlciBmaWxlcw0KPiA+ID4gdG8gbWFrZSB0aGVzZSBmaWxlcyBkdWFsIGxpY2Vuc2VkLCBzbyB0
aGF0IHdlIGFyZSBhYmxlIHRvIHVzZSB0aGVzZQ0KPiA+ID4gZmlsZXMgaW4gb3VyIGR0cy9kdHNp
IGZpbGVzPw0KPiA+DQo+ID4gWW91IGFyZSBnb2luZyB0byBoYXZlIHRvIGRlYWwgd2l0aCB0aGUg
bGVnYWwgZGVwYXJ0bWVudHMgb2YgdGhlDQo+ID4gY29tcGFuaWVzIHRoYXQgb3duIHRob3NlIGNv
cHlyaWdodHMuICBBZ2FpbiwgdGFsayB0byB5b3VyIGxlZ2FsDQo+ID4gZGVwYXJ0bWVudCBhYm91
dCBob3cgdGhhdCB3b3VsZCBldmVuIHdvcmssIG9yIGlmIHRoZXkgZXZlbiB3aXNoIGZvciB5b3UN
Cj4gPiB0byBiZSBhc2tpbmcgcGVvcGxlIGFuZCBjb21wYW5pZXMgdG8gZG8gdGhhdC4NCj4gDQo+
IFJpZ2h0LCB3ZSBzaG91bGQgd29yayB3aXRoIHRoZSBhdXRob3IvY29udHJpYnV0b3Igb2YgdGhl
c2UgdHdvIGZpbGVzLg0KPiANCj4gSGkgU3RlcGhlbiBhbmQgR2VlcnQsDQo+IA0KPiBBcmUgeW91
IG9rIHdpdGggcmVsaWNlbnNpbmcgdGhlc2UgdHdvIGZpbGVzIHdpdGggKEdQTC0yLjAgT1IgTUlU
KT8NCj4gR2l2ZW4gdGhhdCBtYW55IGR0cyBmaWxlcyBpbiBhcm0vYXJtNjQgYXJlIGR1YWwgbGlj
ZW5zZWQgd2l0aCBHUEwgYW5kDQo+IE1JVC9YMTEvQlNELCBpdCBtYWtlcyBtb3JlIHNlbnNlIHRo
YXQgdGhlc2UgaGVhZGVyIGZpbGVzIGFyZSBkdWFsDQo+IGxpY2Vuc2VkIHdpdGggYSBwZXJtaXNz
aXZlIGxpY2Vuc2UgdG9vLg0KDQpGV0lXLCBJIGhhdmUgZmlsZWQgYW4gaW50ZXJuYWwgYnVnIHRv
IG91ciBJUCBhdWRpdCB0ZWFtIHRvIHNlZSB3aGF0IHRoZXkNCnRoaW5rLiBJIGNhbm5vdCBwcmVk
aWN0IHRoZSBhbnN3ZXIgb3IgdGltZWxpbmUgZm9yIGFuIGFuc3dlci4NCg0KLS0gDQpudnB1Ymxp
Yw0K

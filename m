Return-Path: <SRS0=uCVq=V2=renesas.com=yoshihiro.shimoda.uh@kernel.org>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [PATCH v2 2/2] dt-bindings: usb: renesas_gen3: Rename bindings
 documentation file
Date: Mon, 29 Jul 2019 08:25:24 +0000
Message-ID: 
 <TYAPR01MB4544A8358DE51BFB1193287CD8DD0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <20190703083514.32385-1-horms+renesas@verge.net.au>
 <20190703083514.32385-3-horms+renesas@verge.net.au>
 <CAMuHMdVgx9N0yeeei5qcg1yz2WEdDf0gQ6GcwUOAz7u09S_D4A@mail.gmail.com>
 <20190711080302.qeotxueyvlr7pvhe@verge.net.au>
 <20190725090946.GA3311@kroah.com>
 <TYAPR01MB4544F226C06730C5611EB025D8C00@TYAPR01MB4544.jpnprd01.prod.outlook.com>
 <20190729081440.ftgchumfoszlht4q@verge.net.au>
In-Reply-To: <20190729081440.ftgchumfoszlht4q@verge.net.au>
Content-Language: ja-JP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
To: Simon Horman <horms@verge.net.au>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, USB list <linux-usb@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS  <devicetree@vger.kernel.org>, =?utf-8?B?TmlrbGFzIFPDtmRlcmx1bmQ=?=" <niklas.soderlund+renesas@ragnatech.se>
List-ID: <devicetree@vger.kernel.org>

SGkgU2ltb24tc2FuLA0KDQo+IEZyb206IFNpbW9uIEhvcm1hbiwgU2VudDogTW9uZGF5LCBKdWx5
IDI5LCAyMDE5IDU6MTUgUE0NCjxzbmlwPg0KPiA+ID4gPiA+IFVuZm9ydHVuYXRlbHkgdGhlIHBy
ZXZpb3VzIHZlcnNpb24gaGFzIGFscmVhZHkgbWFkZSBpdCBpbnRvIHVzYi1uZXh0DQo+ID4gPiA+
ID4gMjNjNDY4MDFkMTRjYjY0NyBkdC1iaW5kaW5nczogdXNiOiByZW5lc2FzX2dlbjM6IFJlbmFt
ZSBiaW5kaW5ncw0KPiA+ID4gPiA+IGRvY3VtZW50YXRpb24gZmlsZQ0KPiA+ID4gPg0KPiA+ID4g
PiBPaywgSSBndWVzcyB3ZSBzaG91bGQgZ28gd2l0aCB0aGF0IHZlcnNpb24uDQo+ID4gPg0KPiA+
ID4gU28gY2FuIHlvdSByZXNlbmQgdGhpcyBzZXJpZXMgYmFzZWQgb24gNS4zLXJjMSBzbyBJIGtu
b3cgd2hhdCB0byBhcHBseT8NCj4gPg0KPiA+IFNpbmNlIHlvdXIgdXNiLXRlc3RpbmcgYnJhbmNo
IGFscmVhZHkgaGFzIGl0IHdoaWNoIGlzIG1lcmdlZCBmcm9tIEZlbGlwZSdzIHVzYi1uZXh0IGJy
YW5jaCwNCj4gPiBJIGRvbid0IHRoaW5rIFNpbW9uIGhhcyB0byByZXNlbmQgdGhpcyBzZXJpZXMu
DQo+ID4NCj4gPiBodHRwczovL3d3dy5zcGluaWNzLm5ldC9saXN0cy9saW51eC11c2IvbXNnMTgy
MTAzLmh0bWwNCj4gDQo+IFRoYW5rcyBhbmQgc29ycnkgZm9yIHRoZSBjb25mdXNpb24uDQo+IA0K
PiBJbiB2NS4yLXJjMSB3ZSBoYWQ6DQo+IA0KPiAgIGRldmljZXRyZWUvYmluZGluZ3MvdXNiL3Jl
bmVzYXNfdXNiMy50eHQNCj4gICBkZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9yZW5lc2FzX3VzYmhz
LnR4dA0KPiANCj4gDQo+IEluIHY1LjMtcmMxIHdlIGhhdmU6DQo+IA0KPiAgIGRldmljZXRyZWUv
YmluZGluZ3MvdXNiL3JlbmVzYXMsdXNiMy50eHQNCj4gICBkZXZpY2V0cmVlL2JpbmRpbmdzL3Vz
Yi9yZW5lc2FzLHVzYmhzLnR4dA0KPiANCj4gV2hpY2ggcmVmbGVjdHMgdjEgb2YgdGhpcyBwYXRj
aHNldC4gQW5kIEkgdGhpbmsgdGhpcyBpcyBhbiBpbXByb3ZlbWVudC4NCj4gDQo+IFNoaW1vZGEt
c2FuLCBjYW4geW91IGxldCBtZSBrbm93IGlmIHlvdSB3b3VsZCBsaWtlIG1lIHRvIHJlYmFzZSB2
Mg0KPiBvbiB2NS4zLXJjMT8gVGhhdCB3b3VsZCB3b3VsZCBnaXZlIHVzOg0KPiANCj4gICBkZXZp
Y2V0cmVlL2JpbmRpbmdzL3VzYi9yZW5lc2FzLHVzYjMtcGVyaS50eHQNCj4gICBkZXZpY2V0cmVl
L2JpbmRpbmdzL3VzYi9yZW5lc2FzLHVzYmhzLnR4dAkJW3VuY2hhbmdlZF0NCg0KVGhhbmsgeW91
IGZvciB0aGUgZGV0YWlsLiBJIHdvdWxkIGxpa2UgeW91IHRvIHJlYmFzZSB2MiBsaWtlIHRoYXQs
IGlmIHBvc3NpYmxlLg0KDQpCZXN0IHJlZ2FyZHMsDQpZb3NoaWhpcm8gU2hpbW9kYQ0KDQo=

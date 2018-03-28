Return-Path: <SRS0=L7Ep=GS=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH 05/12] clk: renesas: Add r8a77470 CPG Core Clock
 Definitions
Date: Wed, 28 Mar 2018 08:53:39 +0000
Message-ID: <OSBPR01MB2103F51F8BB524600EABD0FFB8A30@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1522161443-54428-1-git-send-email-biju.das@bp.renesas.com>
 <1522161443-54428-6-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdVuJdYAr+-uHE=ODx06-sykCn313=HKApaa86=O1DzC=A@mail.gmail.com>
In-Reply-To: <CAMuHMdVuJdYAr+-uHE=ODx06-sykCn313=HKApaa86=O1DzC=A@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS  <devicetree@vger.kernel.org>,  Simon Horman  <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson" <Chris.Paterson2@renesas.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IE9uIFR1ZSwgTWFyIDI3
LCAyMDE4IGF0IDQ6MzcgUE0sIEJpanUgRGFzIDxiaWp1LmRhc0BicC5yZW5lc2FzLmNvbT4gd3Jv
dGU6DQo+ID4gQWRkIGFsbCBSWi9HMUMgQ2xvY2sgUHVsc2UgR2VuZXJhdG9yIENvcmUgQ2xvY2sg
T3V0cHV0cywgYXMgbGlzdGVkIGluDQo+ID4gVGFibGUgNy4yICgiTGlzdCBvZiBDbG9ja3MgW1Ja
L0cxQ10iKSBvZiB0aGUgUlovRzFDIEhhcmR3YXJlIFVzZXIncw0KPiA+IE1hbnVhbC4NCj4gPg0K
PiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhc0BicC5yZW5lc2FzLmNvbT4NCj4g
PiBSZXZpZXdlZC1ieTogRmFicml6aW8gQ2FzdHJvIDxmYWJyaXppby5jYXN0cm9AYnAucmVuZXNh
cy5jb20+DQo+DQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4NCj4gPiAgaW5jbHVkZS9kdC1i
aW5kaW5ncy9jbG9jay9yOGE3NzQ3eC1jcGctbXNzci5oIHwgMzYNCj4gPiArKysrKysrKysrKysr
KysrKysrKysrKysrKysNCj4NCj4gU2FtZSBjb21tZW50IGFzIGZvciByOGE3NzQ3eC1zeXNjLmg6
IFBsZWFzZSB1c2UgMCBpbnN0ZWFkIG9mIHguDQoNCldpbGwgc2VuZCBWMiB3aXRoIHRoZSBmaWxl
IG5hbWUgY2hhbmdlZCB0byByOGE3NzQ3MC1jcGctbXNzci5oDQoNCj4gV2l0aCB0aGF0IGZpeGVk
Og0KPiBSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRl
ci5iZT4NCj4NCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+DQo+ICAgICAgICAgICAgICAgICAgICAg
ICAgIEdlZXJ0DQo+DQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMg
b2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtDQo+IG02OGsub3JnDQo+DQo+IElu
IHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlz
ZWxmIGEgaGFja2VyLiBCdXQgd2hlbg0KPiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1
c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0Lg0KPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQoNCg0KDQpSZW5lc2FzIEVs
ZWN0cm9uaWNzIEV1cm9wZSBMdGQsIER1a2VzIE1lYWRvdywgTWlsbGJvYXJkIFJvYWQsIEJvdXJu
ZSBFbmQsIEJ1Y2tpbmdoYW1zaGlyZSwgU0w4IDVGSCwgVUsuIFJlZ2lzdGVyZWQgaW4gRW5nbGFu
ZCAmIFdhbGVzIHVuZGVyIFJlZ2lzdGVyZWQgTm8uIDA0NTg2NzA5Lg0K

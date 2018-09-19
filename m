Return-Path: <SRS0=WAAy=MB=bp.renesas.com=fabrizio.castro@kernel.org>
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH 2/2] ARM: dts: r8a77470: Add APMU node and second CPU core
Date: Wed, 19 Sep 2018 10:21:13 +0000
Message-ID: 
 <TY1PR01MB17703699454A72F7923F467AC01C0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1537173850-5310-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1537173850-5310-3-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdVmwevtcjHyKcY5Y0pXFOQhAGeyhdSqF4PGJzVt5C2XMA@mail.gmail.com>
In-Reply-To: 
 <CAMuHMdVmwevtcjHyKcY5Y0pXFOQhAGeyhdSqF4PGJzVt5C2XMA@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS  <devicetree@vger.kernel.org>, Geert Uytterhoeven" <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

SGVsbG8gR2VlcnQsDQoNClRoYW5rIHlvdSBmb3IgeW91ciBmZWVkYmFjay4NCg0KPiBTdWJqZWN0
OiBSZTogW1BBVENIIDIvMl0gQVJNOiBkdHM6IHI4YTc3NDcwOiBBZGQgQVBNVSBub2RlIGFuZCBz
ZWNvbmQgQ1BVIGNvcmUNCj4NCj4gUGVyaGFwcyAiQVJNOiBkdHM6IHI4YTc3NDcwOiBBZGQgU01Q
IHN1cHBvcnQiPw0KDQpZb3VyIHByb3Bvc2FsIGlzIHdpdGggbWUsIFNpbW9uIGRvIHlvdSB3YW50
IG1lIHRvIHNlbmQgYSB2MiBmb3IgdGhpcz8NCg0KVGhhbmtzLA0KRmFiDQoNCj4NCj4gT24gTW9u
LCBTZXAgMTcsIDIwMTggYXQgMTA6NDQgQU0gRmFicml6aW8gQ2FzdHJvDQo+IDxmYWJyaXppby5j
YXN0cm9AYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+IEFkZCBEVCBub2RlIGZvciB0aGUgQWR2
YW5jZWQgUG93ZXIgTWFuYWdlbWVudCBVbml0IChBUE1VKSwgYWRkIHRoZQ0KPiA+IHNlY29uZCBD
UFUgY29yZSwgYW5kIHVzZSAicmVuZXNhcyxhcG11IiBhcyAiZW5hYmxlLW1ldGhvZCIuDQo+ID4N
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBGYWJyaXppbyBDYXN0cm8gPGZhYnJpemlvLmNhc3Ryb0BicC5y
ZW5lc2FzLmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogQmlqdSBEYXMgPGJpanUuZGFzQGJwLnJlbmVz
YXMuY29tPg0KPg0KPiBSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5l
c2FzQGdsaWRlci5iZT4NCj4NCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+DQo+ICAgICAgICAgICAg
ICAgICAgICAgICAgIEdlZXJ0DQo+DQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVy
ZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcNCj4N
Cj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2Fs
bCBteXNlbGYgYSBoYWNrZXIuIEJ1dA0KPiB3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3Rz
IEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuDQo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMNCg0KDQoNClJlbmVz
YXMgRWxlY3Ryb25pY3MgRXVyb3BlIEx0ZCwgRHVrZXMgTWVhZG93LCBNaWxsYm9hcmQgUm9hZCwg
Qm91cm5lIEVuZCwgQnVja2luZ2hhbXNoaXJlLCBTTDggNUZILCBVSy4gUmVnaXN0ZXJlZCBpbiBF
bmdsYW5kICYgV2FsZXMgdW5kZXIgUmVnaXN0ZXJlZCBOby4gMDQ1ODY3MDkuDQo=

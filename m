Return-Path: <SRS0=qX7y=VM=bp.renesas.com=fabrizio.castro@kernel.org>
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH 3/3] arm64: dts: renesas: hihope-common: Add HDMI audio
 support
Date: Mon, 15 Jul 2019 09:29:10 +0000
Message-ID: 
 <TY1PR01MB1770CEA1C7A658C84FCD4EE6C0CF0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1562333979-28516-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1562333979-28516-4-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdUGfHyPp=5aBig4_Sh91hUku4Xx_Ho54X=EDcqrj_zXqA@mail.gmail.com>
In-Reply-To: 
 <CAMuHMdUGfHyPp=5aBig4_Sh91hUku4Xx_Ho54X=EDcqrj_zXqA@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS  <devicetree@vger.kernel.org>, Chris Paterson" <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, "xu_shunji@hoperun.com" <xu_shunji@hoperun.com>
List-ID: <devicetree@vger.kernel.org>

SGkgR2VlcnQsDQoNClRoYW5rIHlvdSBmb3IgeW91ciBmZWVkYmFjayENCg0KPiBGcm9tOiBHZWVy
dCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPg0KPiBTZW50OiAxMiBKdWx5IDIw
MTkgMTQ6NDINCj4gU3ViamVjdDogUmU6IFtQQVRDSCAzLzNdIGFybTY0OiBkdHM6IHJlbmVzYXM6
IGhpaG9wZS1jb21tb246IEFkZCBIRE1JIGF1ZGlvIHN1cHBvcnQNCj4gDQo+IEhpIEZhYnJpemlv
LA0KPiANCj4gT24gRnJpLCBKdWwgNSwgMjAxOSBhdCAzOjQwIFBNIEZhYnJpemlvIENhc3Rybw0K
PiA8ZmFicml6aW8uY2FzdHJvQGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiBUaGlzIHBhdGNo
IGFkZHMgc3VwcG9ydCBmb3IgSERNSSBhdWRpbyB0byB0aGUgZGV2aWNlIHRyZWUNCj4gPiBjb21t
b24gdG8gdGhlIEhpSG9wZSBSWi9HMk0gYW5kIHRoZSBIaUhvcGUgUlovRzJOLg0KPiA+DQo+ID4g
U2lnbmVkLW9mZi1ieTogRmFicml6aW8gQ2FzdHJvIDxmYWJyaXppby5jYXN0cm9AYnAucmVuZXNh
cy5jb20+DQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+IA0KPiA+IC0tLSBhL2FyY2gv
YXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9oaWhvcGUtY29tbW9uLmR0c2kNCj4gPiArKysgYi9hcmNo
L2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvaGlob3BlLWNvbW1vbi5kdHNpDQo+IA0KPiA+IEBAIC0x
NjgsNiArMTgwLDcgQEANCj4gPg0KPiA+ICAmaGRtaTAgew0KPiA+ICAgICAgICAgc3RhdHVzID0g
Im9rYXkiOw0KPiA+ICsgICAgICAgI3NvdW5kLWRhaS1jZWxscyA9IDwwPjsNCj4gDQo+IFdoeSB0
aGUgYWJvdmUgbGluZT8NCg0KSXQgZG9lc24ndCBiZWxvbmcgdGhlcmUsIGdvb2QgY2F0Y2gsIEkn
bGwgc2VuZCBhIHYyIHNob3J0bHkgd2l0aG91dCBpdC4NCg0KVGhhbmtzLA0KRmFiDQoNCj4gDQo+
IFdpdGggdGhlIGFib3ZlIHF1ZXN0aW9uIGFuc3dlcmVkOg0KPiANCj4gUmV2aWV3ZWQtYnk6IEdl
ZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+DQo+IA0KPiBHcntvZXRq
ZSxlZXRpbmd9cywNCj4gDQo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+IA0KPiAt
LQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBp
YTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnDQo+IA0KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRp
b25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0DQo+
IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIg
b3Igc29tZXRoaW5nIGxpa2UgdGhhdC4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAtLSBMaW51cyBUb3J2YWxkcw0K

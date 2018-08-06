Return-Path: <SRS0=GFAs=KV=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH v2 2/5] dt-bindings: gpio: rcar: Add gpio-reserved-ranges
 support
Date: Mon, 6 Aug 2018 11:12:07 +0000
Message-ID: 
 <OSBPR01MB21038ED0BBD374C3BA5086CDB8200@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1533219087-33695-1-git-send-email-biju.das@bp.renesas.com>
 <1533219087-33695-3-git-send-email-biju.das@bp.renesas.com>
 <CACRpkdYhhy+Wxgy+1GzSas6_yvUZMA2NbcpJw4ZwaNvXnX-PmQ@mail.gmail.com>
In-Reply-To: 
 <CACRpkdYhhy+Wxgy+1GzSas6_yvUZMA2NbcpJw4ZwaNvXnX-PmQ@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS  <devicetree@vger.kernel.org>, Simon Horman" <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

SGkgTGludXMsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjIgMi81XSBkdC1iaW5kaW5nczogZ3BpbzogcmNhcjogQWRkIGdwaW8tcmVzZXJ2ZWQt
cmFuZ2VzDQo+IHN1cHBvcnQNCg0KPiA+IFVwZGF0ZSB0aGUgRFQgYmluZGluZ3MgZG9jdW1lbnRh
dGlvbiB3aXRoIHRoZSBvcHRpb25hbA0KPiA+IGdwaW8tcmVzZXJ2ZWQtcmFuZ2VzIHByb3BlcnRp
ZXMuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXNAYnAucmVuZXNh
cy5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6IEZhYnJpemlvIENhc3RybyA8ZmFicml6aW8uY2FzdHJv
QGJwLnJlbmVzYXMuY29tPg0KPiAoLi4uKQ0KPiA+ICsgIC0gZ3Bpby1yZXNlcnZlZC1yYW5nZXM6
IFNldCBvZiB0dXBsZXMgdG8gc3BlY2lmeSB0aGUgdW51c2VkIEdQSU9zLlRoaXMNCj4gPiArICAg
IHByb3BlcnR5IGluZGljYXRlcyB0aGUgc3RhcnQgYW5kIHNpemUgb2YgdGhlIEdQSU9zIHRoYXQg
Y2FuJ3QgYmUgdXNlZC4NCj4gPiArDQo+ID4gIFBsZWFzZSByZWZlciB0byBncGlvLnR4dCBpbiB0
aGlzIGRpcmVjdG9yeSBmb3IgZGV0YWlscyBvZiBncGlvLXJhbmdlcw0KPiA+IHByb3BlcnR5ICBh
bmQgdGhlIGNvbW1vbiBHUElPIGJpbmRpbmdzIHVzZWQgYnkgY2xpZW50IGRldmljZXMuDQo+DQo+
IFlvdSBzZWUgaXQgeW91cnNlbGYgaWYgeW91IGxvb2sgYXQgdGhlIGNvbnRleHQgYmVsb3c6IGp1
c3QgcmVmZXIgdG8gdGhlIGV4aXN0aW5nDQo+IGRvY3VtZW50YXRpb24gaW4gZ3Bpby50eHQgYXMg
dGhpcyBpcyBhIHN0YW5kYXJkIGJpbmRpbmdzLg0KPg0KPiBUaGUgYWJzb2x1dGVseSBiZXN0IChJ
SVVDKSBpczoNCj4NCj4gZ3Bpby1yYW5nZXM6IFNlZSBncGlvLnR4dA0KPiBncGlvLXJlc2VydmVk
LXJhbmdlczogU2VlIGdwaW8udHh0DQpPSy4gV2lsbCBhZGQgdGhpcy4NCj4gTWF5YmUgeW91IGNv
dWxkIGFkZCBhbiBleHRyYSBleGFtcGxlIHVzaW5nIHRoZSByZXNlcnZlZCByYW5nZXM/DQpPSy4g
IFdpbGwgc2VuZCBhbiBleGFtcGxlIHdpdGggcmVzZXJ2ZWQgcmFuZ2VzLg0KDQpSZWdhcmRzLA0K
QmlqdQ0KDQoNCg0KUmVuZXNhcyBFbGVjdHJvbmljcyBFdXJvcGUgTHRkLCBEdWtlcyBNZWFkb3cs
IE1pbGxib2FyZCBSb2FkLCBCb3VybmUgRW5kLCBCdWNraW5naGFtc2hpcmUsIFNMOCA1RkgsIFVL
LiBSZWdpc3RlcmVkIGluIEVuZ2xhbmQgJiBXYWxlcyB1bmRlciBSZWdpc3RlcmVkIE5vLiAwNDU4
NjcwOS4NCg==

Return-Path: <SRS0=7B8F=TP=renesas.com=Chris.Brandt@kernel.org>
From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH v3 15/15] ARM: dts: rza2mevb: Add USB host support
Date: Wed, 15 May 2019 14:54:11 +0000
Message-ID: 
 <TYXPR01MB15684FF367D694BD5C203BB68A090@TYXPR01MB1568.jpnprd01.prod.outlook.com>
References: <20190514145605.19112-1-chris.brandt@renesas.com>
 <20190514145605.19112-16-chris.brandt@renesas.com>
 <CAMuHMdXx=7v5v3tHwS-01eNnzz6NSfs=M02jU1tNJMdcRbGScg@mail.gmail.com>
 <TYXPR01MB15689E3664801057DFCA09EA8A090@TYXPR01MB1568.jpnprd01.prod.outlook.com>
 <CAMuHMdWLB-JE=2f=Mq9np_b5Wuj6=nB2ywWquBFheoBVxPaAfQ@mail.gmail.com>
In-Reply-To: 
 <CAMuHMdWLB-JE=2f=Mq9np_b5Wuj6=nB2ywWquBFheoBVxPaAfQ@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Simon Horman <horms@verge.net.au>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, USB list <linux-usb@vger.kernel.org>, OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

SGkgR2VlcnQsDQoNCk9uIFdlZCwgTWF5IDE1LCAyMDE5IDEsIEdlZXJ0IFV5dHRlcmhvZXZlbiB3
cm90ZToNCj4gPiA+IERvZXMgcmVzaXN0b3IgUjc4IG5lZWQgdG8gYmUgbW91bnRlZCwgdG9vPw0K
PiA+DQo+ID4gQnkgZGVmYXVsdCwgUjc4IGFuZCBSNzkgYXJlIG5vdCBwb3B1bGF0ZWQgb24gdGhl
c2UgYm9hcmRzLCBhbmQgYm90aCBIb3N0DQo+ID4gYW5kIEZ1bmN0aW9uIHdvcmsgZmluZSB3aXRo
b3V0IGJvYXJkIG1vZGlmaWNhdGlvbiwgc28gSSB3b3VsZCBzYXkNCj4gPiBwb3B1bGF0aW5nIFI3
OCBpcyBub3QgYSByZXF1aXJlbWVudCBhcyBmYXIgYXMgSSBjYW4gdGVsbC4NCj4gDQo+IEkgYXNr
ZWQgYmVjYXVzZSBhZnRlciByZWFkaW5nIFNlY3Rpb24gMi40IFVTQiBJbnRlcmZhY2UgaW4gdGhl
IFJaL0EyTSBDUFUNCj4gQm9hcmQgIFVzZXIncyBNYW51YWwsIGl0J3Mgbm90IGNsZWFyIHRvIG1l
IHdoZW4gb25lIG5lZWRzIHRvDQo+IHBvcHVsYXRlIG9uZSBvZiB0aGVzZSByZXNpc3RvcnMuIEVz
cGVjaWFsbHkgaW4gcmVsYXRpb24gdG8gSlAzLCB3aGljaA0KPiB0YWxrcyBhYm91dCAyIHBvc3Np
YmxlIG1vZGVzIChob3N0IHZzLiBmdW5jdGlvbiksIHdoaWxlIHRoZSByZXNpc3Rvcg0KPiBwYXJh
Z3JhcGggdGFsa3MgYWJvdXQgMyBwb3NzaWJsZSBtb2RlcyAoZHVhbC1yb2xlIHZzLiBob3N0IHZz
Lg0KPiBmdW5jdGlvbikuDQoNCkhvbmVzdGx5LCBJJ20gbm90IHN1cmUgd2hhdCB0aGV5IHdlcmUg
dGhpbmtpbmcuDQpUaGV5IHB1dCBvbiBhIFVTQi1DIGNvbm5lY3RvciwgYW5kIHB1dCBvbiBjaXJj
dWl0cnkgdG8gZGV0ZWN0IGlmIGEgSG9zdCANCm9yIGRldmljZSB3YXMgYXR0YWNoZWQuLi4uYnV0
IHRoZW4gcHV0IGEgcGh5c2ljYWwganVtcGVyIG9uIHRoZSBib2FyZCB0bw0KY29ubmVjdC9kaXNj
b25uZWN0IFZCVVMgcG93ZXIuDQoNCg0KPiBQZXJoYXBzIEkganVzdCBuZWVkIHRvIGRyaW5rIG1v
cmUgVVNCIEtvb2wtQWlkPw0KPiAobm8gS29vbC1BaWQgc29sZCBpbiBsb2NhbCBzaG9wcywgdGhv
dWdoOyB3ZSBsaXZlIG9uIENva2UgOy0pDQoNCk1heWJlIG5vdCBLb29sLUFpZCBhcyBpdCBzZWVt
IHRoZXkgd2VyZSAnc21va2luZyBzb21ldGhpbmcnIGluc3RlYWQuIDpvDQoNCg0KQ2hyaXMNCg==

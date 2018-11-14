Return-Path: <SRS0=klaB=NZ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr1400098.outbound.protection.outlook.com ([40.107.140.98]:16672
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727598AbeKNVcJ (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 14 Nov 2018 16:32:09 -0500
From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH 3/3] dt-bindings: rcar-gen3-phy-usb2: Add r7s9210 support
Date: Wed, 14 Nov 2018 11:29:12 +0000
Message-ID: <OSAPR01MB155309C400BF3C256635DD168AC30@OSAPR01MB1553.jpnprd01.prod.outlook.com>
References: <20181107173558.54481-1-chris.brandt@renesas.com>
 <20181107173558.54481-4-chris.brandt@renesas.com>
 <CAMuHMdX7_bk4b7WTmxDuLPR=-WZYdbt=7P2e-gs4ZOT=-EzL-g@mail.gmail.com>
In-Reply-To: <CAMuHMdX7_bk4b7WTmxDuLPR=-WZYdbt=7P2e-gs4ZOT=-EzL-g@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms+renesas@verge.net.au>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

SGkgR2VlcnQsDQoNCk9uIFdlZG5lc2RheSwgTm92ZW1iZXIgMTQsIDIwMTgsIEdlZXJ0IFV5dHRl
cmhvZXZlbiB3cm90ZToNCj4gPiAgUmVxdWlyZWQgcHJvcGVydGllczoNCj4gPiAtLSBjb21wYXRp
YmxlOiAicmVuZXNhcyx1c2IyLXBoeS1yOGE3NzRhMSIgaWYgdGhlIGRldmljZSBpcyBhIHBhcnQg
b2YgYW4NCj4gUjhBNzc0QTENCj4gPiArLSBjb21wYXRpYmxlOiAicmVuZXNhcyx1c2IyLXBoeS1y
N3M5MjEwIiBpZiB0aGUgZGV2aWNlIGlzIGEgcGFydCBvZiBhbg0KPiBSN1M5MjEwDQo+ID4gKyAg
ICAgICAgICAgICBTb0MuDQo+ID4gKyAgICAgICAgICAgICAicmVuZXNhcyx1c2IyLXBoeS1yOGE3
NzRhMSIgaWYgdGhlIGRldmljZSBpcyBhIHBhcnQgb2YgYW4NCj4gUjhBNzc0QTENCj4gPiAgICAg
ICAgICAgICAgIFNvQy4NCj4gPiAgICAgICAgICAgICAgICJyZW5lc2FzLHVzYjItcGh5LXI4YTc3
OTUiIGlmIHRoZSBkZXZpY2UgaXMgYSBwYXJ0IG9mIGFuDQo+IFI4QTc3OTUNCj4gPiAgICAgICAg
ICAgICAgIFNvQy4NCj4gPiBAQCAtMTYsOCArMTgsOCBAQCBSZXF1aXJlZCBwcm9wZXJ0aWVzOg0K
PiA+ICAgICAgICAgICAgICAgUjhBNzc5OTAgU29DLg0KPiA+ICAgICAgICAgICAgICAgInJlbmVz
YXMsdXNiMi1waHktcjhhNzc5OTUiIGlmIHRoZSBkZXZpY2UgaXMgYSBwYXJ0IG9mIGFuDQo+ID4g
ICAgICAgICAgICAgICBSOEE3Nzk5NSBTb0MuDQo+ID4gLSAgICAgICAgICAgICAicmVuZXNhcyxy
Y2FyLWdlbjMtdXNiMi1waHkiIGZvciBhIGdlbmVyaWMgUi1DYXIgR2VuMyBvcg0KPiBSWi9HMg0K
PiA+IC0gICAgICAgICAgICAgY29tcGF0aWJsZSBkZXZpY2UuDQo+ID4gKyAgICAgICAgICAgICAi
cmVuZXNhcyxyY2FyLWdlbjMtdXNiMi1waHkiIGZvciBhIGdlbmVyaWMgUi1DYXIgR2VuMywNCj4g
UlovRzIgb3INCj4gPiArICAgICAgICAgICAgIFJaL0EyIGNvbXBhdGlibGUgZGV2aWNlLg0KPiAN
Cj4gSXMgaXQgYSBnb29kIGlkZWEgdG8gZGVjbGFyZSBSWi9BMiBjb21wYXRpYmxlIHRvIFItQ2Fy
IEdlbjM/DQo+IFVzdWFsbHkgd2UgZG9uJ3QgZG8gdGhhdCBmb3IgUmVuZXNhcyBJUCBjb3JlcyB1
c2VkIGluIGRpZmZlcmVudA0KPiBmYW1pbGllc1sqXS4NCj4gT2YgY291cnNlLCBJIGtub3cgeW91
IGRvIGhhdmUgYSBnb29kIHJlbGF0aW9uc2hpcCB3aXRoIHRoZSBhY3R1YWwgUlovQTINCj4gaGFy
ZHdhcmUgZGVzaWduZXJzIDstKQ0KPiANCj4gSW4gbGlnaHQgb2YgU2hpbW9kYS1zYW4ncyBjb21t
ZW50IHcuci50LiBSLUNhciBIMyBVU0IgcG9ydDEgaW4gdGhlIGRyaXZlcg0KPiBjb2RlLCBwZXJo
YXBzICJyZW5lc2FzLHJjYXItZ2VuMy11c2IyLXBoeSIgc2hvdWxkIG5vdCBiZSB1c2VkPw0KDQpX
ZWxsLCBJIHRoaW5rIHRoZSBJUCBibG9jayBzZWVtcyB0aGUgc2FtZS4uLi5ob3dldmVyLi4uDQpJ
IGRpZCBwb2ludCBvdXQgdGhhdCB0aGUgQ09NTUNUUkwgcmVnaXN0ZXIgZGVmYXVsdHMgdG8gYSBk
aWZmZXJlbnQgDQp2YWx1ZS4gTm8gaWRlYSB3aHkgdGhhdCBpcy4gSG9uZXN0bHksIEkgZGlkIG5v
dCBnbyBhbmQgY2hlY2sgYWxsIHRoZSBvdGhlciANCnJlZ2lzdGVycyBiaXRzLiBTbyBJIGd1ZXNz
IEkgd29uZGVyIHdoYXQgImNvbXBhdGlibGUiIHJlYWxseSBtZWFuczoNCg0KIkNvbXBhdGlibGU6
IERpZmZlcmVudCwgYnV0IGNsb3NlIGVub3VnaCB0aGF0IGl0IHdpbGwgd29yayIgPz8/DQoNCkNo
cmlzDQo=

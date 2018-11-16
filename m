Return-Path: <SRS0=bghX=N3=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr1400101.outbound.protection.outlook.com ([40.107.140.101]:6455
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728124AbeKQCNr (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 16 Nov 2018 21:13:47 -0500
From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH v6 1/2] pinctrl: Add RZ/A2 pin and gpio controller
Date: Fri, 16 Nov 2018 16:00:47 +0000
Message-ID: <OSAPR01MB155382394E47F51F76E87AC78ADD0@OSAPR01MB1553.jpnprd01.prod.outlook.com>
References: <20181115140045.24733-1-chris.brandt@renesas.com>
 <20181115140045.24733-2-chris.brandt@renesas.com>
 <20181115162817.GB28299@w540>
 <OSAPR01MB1553B1748C9DFC365DCF7C568ADC0@OSAPR01MB1553.jpnprd01.prod.outlook.com>
 <CAMuHMdUnnZ=JeoYCo0_VepuZPtpqsh56OW97AJdGpsNxtT+ovQ@mail.gmail.com>
In-Reply-To: <CAMuHMdUnnZ=JeoYCo0_VepuZPtpqsh56OW97AJdGpsNxtT+ovQ@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jacopo Mondi <jacopo@jmondi.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

SGkgR2VlcnQsDQoNCk9uIEZyaWRheSwgTm92ZW1iZXIgMTYsIDIwMTgsIEdlZXJ0IFV5dHRlcmhv
ZXZlbiB3cm90ZToNCj4gPiBXZSBjYW4gaGF2ZSBHZWVydCBnaXZlIGhpcyBvcGluaW9uIG9uIHRo
ZSB0b3BpYyBzaW5jZSBpdCB3YXMgaGlzDQo+ID4gc3VnZ2VzdGlvbiB0byBiZWdpbiB3aXRoLg0K
PiA+DQo+ID4NCj4gPiA+IEknbSBzb3JyeSB0aGlzIGlzIG1vcmUgd29yaywgYW5kIGFnYWluLCBp
dCBtaWdodCBiZSBwb3N0LXBvbmVkIGltbywNCj4gPiA+IHByb3ZpZGVkIHlvdSBkcm9wIHRoaXMg
Y2hhbmdlIHlvdSBoYXZlIGludHJvZHVjZWQgaGVyZS4NCj4gPg0KPiA+IFNpbmNlIEdlZXJ0IGlz
IHRoZSBtYWludGFpbmVyIG9mIHRoZSBSZW5lc2FzIHBpbmN0cmwgZHJpdmVycywgSSdsbCBsZXQN
Cj4gPiBoaW0gZGVjaWRlIGlmIEkgc2hvdWxkIGRyb3AgdGhhdCBwYXJ0IGZvciBub3cgc2luY2Ug
b25seSAxIFNPQyBleGlzdHMNCj4gPiB0b2RheS4NCj4gDQo+IEkgZG9uJ3QgaGF2ZSBhIHJlYWwg
cHJlZmVyZW5jZS4NCj4gDQo+IFR3byBjYXV0aW9ucywgdGhvdWdoOg0KPiAgIDEuIFlvdSBkbyBo
YXZlIHRvIHJlbWVtYmVyIHRvIGluY3JlYXNlIHBvcnRfbmFtZXNbXSwgd2hlbiBuZWVkZWQsDQoN
CkdpdmVuIHlvdXIgY29tbWVudCB0aGF0IHdlIGFsd2F5cyBleHBsaWNpdGx5IGFkZCBTT0Mgc3Vw
cG9ydCB0byBhIA0KZHJpdmVyLCBldmVuIGlmIHRoYXQganVzdCBtZWFucyBhZGRpbmcgYSBjb21w
YXRpYmxlIHN0cmluZywgd2Ugd2lsbCBhbHdheXMgDQpoYXZlIHRvIGVkaXQgdGhlIGRyaXZlciBh
bnl3YXkuDQoNCj4gICAyLiBUcnlpbmcgdG8gcHJlZGljdCB0aGUgZnV0dXJlIG1heSBmYWlsLCBh
bmQgbW9yZSBkcml2ZXIgdXBkYXRlcyBtYXkgYmUNCj4gICAgICBuZWVkZWQgd2hlbiBhIG5ldyB2
YXJpYW50IG9mIHRoaXMgcGluIGNvbnRyb2xsZXIgd2lsbCBiZSBjb25jZWl2ZWQuDQoNClZlcnkg
dHJ1ZS4NCkkgdGhpbmsgY2hhbmdpbmcgdGhlIGhhcmQgY29kZWQgUlpBMl9OUElOUyBpbnRvIHBy
aXYtPm5waW5zIHdhcyB0aGUgDQpjb3JyZWN0IHRoaW5nIHRvIGRvLiBPZiBjb3Vyc2UgdGhlIGRy
aXZlciBuYW1lIGlzIHBpbmN0cmwtcnphMi5jIHdoaWNoIHdpbGwgDQpiZSBzaWxseSBpZiB1c2Vk
IGZvciBvdGhlciBTb0NzLiBCdXQgdGhlbiBhZ2Fpbi4uLkknbSB1c2luZyBsb3RzIG9mIA0KInJj
YXIiIGRyaXZlcnMgZm9yIFJaL0EyIQ0KDQoNCkNocmlzDQo=

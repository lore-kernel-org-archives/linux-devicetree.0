Return-Path: <SRS0=Cu6b=NY=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr1400102.outbound.protection.outlook.com ([40.107.140.102]:35328
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725748AbeKNF0T (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 14 Nov 2018 00:26:19 -0500
From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH v4 1/2] pinctrl: Add RZ/A2 pin and gpio controller
Date: Tue, 13 Nov 2018 19:26:41 +0000
Message-ID: <OSAPR01MB155359D363399BD62BB29D788AC20@OSAPR01MB1553.jpnprd01.prod.outlook.com>
References: <20181107182733.62155-1-chris.brandt@renesas.com>
 <20181107182733.62155-2-chris.brandt@renesas.com>
 <CAMuHMdWePvqbv_SmkGQAWm8aynkXBjmf25BuA3O09_H9Xdtjyg@mail.gmail.com>
 <OSAPR01MB15531B62B24C0DA3834592628AC20@OSAPR01MB1553.jpnprd01.prod.outlook.com>
 <CAMuHMdWVGYaT+WOhks-8YwK0KO96COO0Rgvp9DNMhhQpZfA7kQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWVGYaT+WOhks-8YwK0KO96COO0Rgvp9DNMhhQpZfA7kQ@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Jacopo Mondi <jacopo@jmondi.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

SGkgR2VlcnQsDQoNCk9uIFR1ZXNkYXksIE5vdmVtYmVyIDEzLCAyMDE4LCBHZWVydCBVeXR0ZXJo
b2V2ZW4gd3JvdGU6DQo+ID4gSXQgbWFrZXMgdGhlIGZpbGVzIHNob3cgdXAgdW5kZXIgL3N5cyBs
b29rIG5pY2UuDQo+ID4NCj4gPiBGb3IgZXhhbXBsZSwgUDVfNiBpcyBidXR0b24gU1c0Og0KPiA+
DQo+ID4gICQgZWNobyA5MTIgPiAvc3lzL2NsYXNzL2dwaW8vZXhwb3J0DQo+ID4NCj4gPiBUaGVu
IHlvdSBlbmQgdXAgd2l0aCAiL3N5cy9jbGFzcy9ncGlvL1A1XzYvIg0KPiA+DQo+ID4gICQgZWNo
byBpbiA+IC9zeXMvY2xhc3MvZ3Bpby9QNV82L2RpcmVjdGlvbg0KPiA+ICAkIGNhdCAvc3lzL2Ns
YXNzL2dwaW8vUDVfNi9kaXJlY3Rpb24NCj4gPiAgJCBjYXQgL3N5cy9jbGFzcy9ncGlvL1A1XzYv
dmFsdWUNCj4gDQo+IChBaCwgdGhlIGxlZ2FjeSBhbmQgZGVwcmVjYXRlZCBzeXNmcyBHUElPIGlu
dGVyZmFjZSwgYmVpbmcgcmVwbGFjZWQNCj4gIGJ5IC9kZXYvZ3Bpb2NoaXBbMC05XSsgYW5kIGh0
dHBzOi8vZ2l0aHViLmNvbS9icmdsL2xpYmdwaW9kKQ0KPiANCj4gQ29vbCwgSSBkaWRuJ3Qga25v
dyB0aGF0Lg0KPiBCdXQgeW91IHN0aWxsIG5lZWQgdG8ga25vdyB3aGljaCBudW1iZXIgdG8gd3Jp
dGUgdG8gdGhlIGV4cG9ydCBmaWxlDQo+IGluIHRoZSBmaXJzdCBwbGFjZT8NCg0KVHJ1ZSwgbWVh
bmluZyB0aGUgdGFibGUgZG9lcyBub3QgaGVscCB5b3UgYXMgbXVjaCBhcyB5b3Ugd2FudC4NCkph
Y29wbyBhbHNvIG1lbnRpb25lZCB0aGUgbmV3IGxpYmdwaW9kLg0KU28sIEkgdGhpbmsgSSBtaWdo
dCBqdXN0IGRyb3AgdGhpcyB0YWJsZSBpbiB0aGUgbmV4dCByZXZpc2lvbi4NCg0KV2hhdCBJIHJl
YWxseSB3YW50IHRvIGRvIGlzIGp1c3Qgc2F5ICJtYWtlIFA1XzYgYW4gaW5wdXQiIGFuZA0Kbm90
IGhhdmUgdG8gY29udmVydCB0byBhIGdsb2JhbCBJRCBudW1iZXIuIEJ1dCwgSSdtIG5vdCBzdXJl
IGhvdw0KbGliZ3Bpb2QgaXMgZ29pbmcgdG8ga25vdyB3aGF0ICJQNV82IiBpcy4NCg0KDQo+ID4g
PiBTb21lIHBlb3BsZSBwcmVmZXIgInJldmVyc2UgWG1hcyB0cmVlIG9yZGVyaW5nIiBpLmUuIHNv
cnRlZCBieQ0KPiBkZWNyZWFzaW5nDQo+ID4gPiBkZWNsYXJhdGlvbiBsZW5ndGguDQo+ID4NCj4g
PiBodHRwczovL2x3bi5uZXQvQXJ0aWNsZXMvNzU4NTUyLw0KPiA+DQo+ID4gIm9ubHkgYSBmZXcg
bWFpbnRhaW5lcnMgaW5zaXN0IG9uIHRoYXQsIHdoaWxlIG1vc3QgcmVhbGx5IGRvIG5vdCBjYXJl
IG9yDQo+ID4gdGhpbmsgdGhhdCBpdCdzIGFjdGl2ZWx5IHNpbGx5LiINCj4gPg0KPiA+IFNvIGFy
ZSB5b3Ugb25lIG9mIHRob3NlIG1haW50YWluZXJzPz8/Pz8gICA6KQ0KPiANCj4gU29ycnksIGdv
dCBiYXB0aXNlZCBieSBMYXVyZW50Li4uDQoNCiAoaW5zZXJ0IHBpY3R1cmUgb2YgTGF1cmVudCBo
YW5kaW5nIG91dCBLb29sLUFpZCBoZXJlKQ0KDQoNCkNocmlzDQoNCg0K

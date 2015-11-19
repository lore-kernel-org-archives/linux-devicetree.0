From: Pramod Kumar <pramodku@broadcom.com>
Subject: RE: [PATCH 03/11] dts: pinctrl: Add GPIO to Pinctrl pin mapping in
 DT
Date: Thu, 19 Nov 2015 03:34:58 +0000
Message-ID: <0C803592FC378B4E83922050AB46442A2AD9ECBD@SJEXCHMB10.corp.ad.broadcom.com>
References: <1445233398-27129-1-git-send-email-pramodku@broadcom.com>
 <1445233398-27129-4-git-send-email-pramodku@broadcom.com>
 <564CC5E2.2070809@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <564CC5E2.2070809@gmail.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Russell King <linux@arm.linux.org.uk>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Cc: bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, Jason Uy <jasonuy@broadcom.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Thomas Gleixner <tglx@linutronix.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jonas Gorski <jogo@openwrt.org>
List-Id: devicetree@vger.kernel.org

SGkgRmxvcmlhbiwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBGbG9y
aWFuIEZhaW5lbGxpIFttYWlsdG86Zi5mYWluZWxsaUBnbWFpbC5jb21dDQo+IFNlbnQ6IDE5IE5v
dmVtYmVyIDIwMTUgMDA6MTANCj4gVG86IFByYW1vZCBLdW1hcjsgUm9iIEhlcnJpbmc7IFBhd2Vs
IE1vbGw7IE1hcmsgUnV0bGFuZDsgSWFuIENhbXBiZWxsOw0KPiBLdW1hciBHYWxhOyBSYXkgSnVp
OyBTY290dCBCcmFuZGVuOyBSdXNzZWxsIEtpbmc7IExpbnVzIFdhbGxlaWo7IGxpbnV4LQ0KPiBn
cGlvQHZnZXIua2VybmVsLm9yZw0KPiBDYzogYmNtLWtlcm5lbC1mZWVkYmFjay1saXN0OyBKYXNv
biBVeTsgTWFzYWhpcm8gWWFtYWRhOyBUaG9tYXMgR2xlaXhuZXI7DQo+IExhdXJlbnQgUGluY2hh
cnQ7IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBsaW51eC1hcm0tDQo+IGtlcm5lbEBsaXN0
cy5pbmZyYWRlYWQub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBKb25hcyBHb3Jz
a2kNCj4gU3ViamVjdDogUmU6IFtQQVRDSCAwMy8xMV0gZHRzOiBwaW5jdHJsOiBBZGQgR1BJTyB0
byBQaW5jdHJsIHBpbiBtYXBwaW5nIGluIERUDQo+IA0KPiBPbiAxOC8xMC8xNSAyMjo0MywgUHJh
bW9kIEt1bWFyIHdyb3RlOg0KPiA+IEFTSVUgZ3BpbyBjb250cm9sbGVyJ3MgcGlucyBhcmUgbXV4
ZWQgd2l0aCBwaW4tY250cm9sbGVyLg0KPiA+IEFkZCB0aGlzIG1hcHBpbmcgdGhyb3VnaCBwcm9w
ZXJ0eSAiZ3Bpby1yYW5nZXMiLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogUHJhbW9kIEt1bWFy
IDxwcmFtb2RrdUBicm9hZGNvbS5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6IFJheSBKdWkgPHJqdWlA
YnJvYWRjb20uY29tPg0KPiA+IFJldmlld2VkLWJ5OiBTY290dCBCcmFuZGVuIDxzYnJhbmRlbkBi
cm9hZGNvbS5jb20+DQo+IA0KPiBBcHBsaWVkIHRvIGRldmljZXRyZWUvbmV4dCwgc2luY2UgdGhl
cmUgd2FzIGEgYml0IG9mIHJlc3RydWN0dXJpbmcsIEkgaGFkIHRvDQo+IG1hbnVhbGx5IGFwcGx5
IGl0LCBwbGVhc2UgdmVyaWZ5IHRoZSByZXNvbHV0aW9uIGxvb2tzIGNvcnJlY3QgdG8geW91Lg0K
DQpBcHBsaWVkIHBhdGNoIGxvb2tzIGZpbmUuIFRoYW5rcyBmb3IgaGF2aW5nIHRpbWUgaW4gcmVz
dHJ1Y3R1cmluZy4gDQoNClJlZ2FyZHMsDQpQcmFtb2QNCg0KPiANCj4gVGhhbmtzIQ0KPiAtLQ0K
PiBGbG9yaWFuDQo=

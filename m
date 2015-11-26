From: Martin Schiller <mschiller@tdt.de>
Subject: RE: [PATCH v2 4/4] pinctrl/lantiq: fix up pinmux
Date: Thu, 26 Nov 2015 06:40:18 +0000
Message-ID: <c9edbc5eafed4639983f8bcefe8e872e@TDT-MS.TDTNET.local>
References: <1448446739-5541-1-git-send-email-mschiller@tdt.de>
 <1448446739-5541-4-git-send-email-mschiller@tdt.de>
 <CAOiHx=moeuw-qWdq0YVzVD3dv0Zq+3rxb2tAKV1Hiz35y4+7DQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CAOiHx=moeuw-qWdq0YVzVD3dv0Zq+3rxb2tAKV1Hiz35y4+7DQ@mail.gmail.com>
Content-Language: de-DE
Sender: linux-gpio-owner@vger.kernel.org
To: Jonas Gorski <jogo@openwrt.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, MIPS Mailing List <linux-mips@linux-mips.org>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Ralf Baechle <ralf@linux-mips.org>, John Crispin <blogic@openwrt.org>, Hauke Mehrtens <hauke@hauke-m.de>, "daniel.schwierzeck@gmail.com" <daniel.schwierzeck@gmail.com>
List-Id: devicetree@vger.kernel.org

T24gMTEvMjUvMjAxNSBhdCAxMTo0MCBBTSwgSm9uYXMgR29yc2tpIHdyb3RlOg0KPiBIaQ0KPg0K
PiBPbiBXZWQsIE5vdiAyNSwgMjAxNSBhdCAxMToxOCBBTSwgTWFydGluIFNjaGlsbGVyIDxtc2No
aWxsZXJAdGR0LmRlPg0KPiB3cm90ZToNCj4gPiBGcm9tOiBKb2huIENyaXNwaW4gPGJsb2dpY0Bv
cGVud3J0Lm9yZz4NCj4gPg0KPiA+IFRoaXMgcGF0Y2ggaXMgaW5jbHVkZWQgaW4gdGhlIG9wZW53
cnQgcGF0Y2hzZXQgZm9yIHNldmVyYWwgeWVhcnMgbm93DQo+IGFuZCBuZWVkcw0KPiA+IHRvIGdv
IHVwc3RyZWFtIGFzIHdlbGwuIEl0IGluY2x1ZGVzIHRoZSBmb2xsb3dpbmcgY2hhbmdlczoNCj4g
PiAxLiBGaXggdXAgaW5saW5lIGZ1bmN0aW9uIGNhbGwgdG8geHdheV9tdXhfYXBwbHkNCj4NCj4g
VGhpcyByZWFsbHkgbmVlZHMgYW4gZXhwbGFuYXRpb24gd2hhdCBpcyBiZWluZyBmaXhlZCBoZXJl
Lg0KDQpJIGhvcGUgSm9obiAtIGFzIHRoZSBvcmlnaW5hbCBhdXRob3Igb2YgdGhpcyBwYXRjaCAt
IGNhbiBleHBsYWluDQp3aHkgdGhpcyBjaGFuZ2UgaXMgbmVjZXNzYXJ5Lg0KDQo+DQo+ID4gMi4g
Rml4IEdQSU8gU2V0dXAgb2YgR1BJTyBQb3J0Mw0KPg0KPiBUaGlzIGNoYW5nZSBsb29rcyBmaW5l
Lg0KPg0KPiA+IDMuIEltcGxlbWVudCBncGlvX2NoaXAudG9faXJxDQo+DQo+IFRoZXNlIGFyZSB0
aHJlZSBkaWZmZXJlbnQgY2hhbmdlcyAodHdvIGZpeGVzLCBvbmUgbmV3IGZlYXR1cmUpIGFuZA0K
PiB0aGVyZWZvcmUgc2hvdWxkIGJlIHNwbGl0IHVwIGludG8gdGhyZWUgcGF0Y2hlcy4NCg0KQXMg
SSdtIG5vdCB0aGUgYXV0aG9yIG9mIHRoaXMgcGF0Y2gsIEkgZGVjaWRlZCB0byBsZWF2ZSBpdCBh
cyBpdCBpcy4NCkJ1dCBwZXIgc2UgeW91IGFyZSByaWdodCwgaXQgd291bGQgYmUgYmV0dGVyIHRv
IHNwbGl0IGl0IHVwLg0KDQo+DQo+ID4gU2lnbmVkLW9mZi1ieTogSm9obiBDcmlzcGluIDxibG9n
aWNAb3BlbndydC5vcmc+DQo+ID4gU2lnbmVkLW9mZi1ieTogTWFydGluIFNjaGlsbGVyIDxtc2No
aWxsZXJAdGR0LmRlPg0KPiA+IC0tLQ0KPg0KPiBBbHNvIHBsZWFzZSBwcm92aWRlIGEgY2hhbmdl
bG9nIGZvciB5b3VyIHBhdGNoZXMgaGVyZS4NCg0KT0suDQoNCj4NCj4gPiAgZHJpdmVycy9waW5j
dHJsL3BpbmN0cmwteHdheS5jIHwgMjggKysrKysrKysrKysrKysrKysrKysrKysrKystLQ0KPiA+
ICAxIGZpbGUgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gPg0K
Pg0KPg0KPiBKb25hcw0KDQpNYXJ0aW4NCg0KDQo=

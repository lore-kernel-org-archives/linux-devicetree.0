Return-Path: <SRS0=C4yJ=ND=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-ty1jpn01on0094.outbound.protection.outlook.com ([104.47.93.94]:35891
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726493AbeJXGyT (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 24 Oct 2018 02:54:19 -0400
From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH v4 0/3] mmc: tmio_mmc: Add support for RZ/A2
Date: Tue, 23 Oct 2018 22:28:47 +0000
Message-ID: <TY1PR01MB1562238AE99ADCB39C05C67A8AF50@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20181012122924.5543-1-chris.brandt@renesas.com>
 <CAPDyKFqNeHC7VqXsRSZegb7PGLnKBv4F4L2Rx4UtGuO7_bv-JA@mail.gmail.com>
In-Reply-To: <CAPDyKFqNeHC7VqXsRSZegb7PGLnKBv4F4L2Rx4UtGuO7_bv-JA@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-clk <linux-clk@vger.kernel.org>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, DTML <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

T24gVHVlc2RheSwgT2N0b2JlciAyMywgMjAxOCwgVWxmIEhhbnNzb24gd3JvdGU6DQo+IE9uIDEy
IE9jdG9iZXIgMjAxOCBhdCAxNDoyOSwgQ2hyaXMgQnJhbmR0IDxjaHJpcy5icmFuZHRAcmVuZXNh
cy5jb20+DQo+IHdyb3RlOg0KPiA+IEJhc2ljYWxseSB0aGUgc2FtZSBIVyBibG9jayB0aGF0IHdh
cyB1c2VkIGluIFItQ2FyIEdlbiAzIGlzIHVzZWQgaW4NCj4gPiBSWi9BMiAod2l0aCBvbmx5IGEg
Y291cGxlIHNtYWxsIGRpZmZlcmVuY2VzKS4NCj4gPg0KPiA+IE5vdCBzdXJlIGlmIHlvdSdyZSBn
b2luZyB0byBsaWtlIHRoZSBLY29uZmlnIGNoYW5nZSBvciBub3QuDQo+ID4NCj4gPiBDaHJpcyBC
cmFuZHQgKDMpOg0KPiA+ICAgY2xrOiByZW5lc2FzOiByN3M5MjEwOiBBZGQgU0RISSBjbG9ja3MN
Cj4gPiAgIG1tYzogcmVuZXNhc19zZGhpX2ludGVybmFsX2RtYWM6IEFkZCBSN1M5MjEwIHN1cHBv
cnQNCj4gPiAgIGR0LWJpbmRpbmdzOiBtbWM6IHRtaW9fbW1jOiBEb2N1bWVudCBSZW5lc2FzIFI3
UzkyMTANCj4gPg0KPiA+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbW1jL3Rt
aW9fbW1jLnR4dCB8ICAzICsrLQ0KPiA+ICBkcml2ZXJzL2Nsay9yZW5lc2FzL3I3czkyMTAtY3Bn
LW1zc3IuYyAgICAgICAgICAgICB8ICA1ICsrKysNCj4gPiAgZHJpdmVycy9tbWMvaG9zdC9LY29u
ZmlnICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNSArKy0tDQo+ID4gIGRyaXZlcnMvbW1j
L2hvc3QvcmVuZXNhc19zZGhpX2ludGVybmFsX2RtYWMuYyAgICAgIHwgMjgNCj4gKysrKysrKysr
KysrKysrKysrKystLQ0KPiA+ICA0IGZpbGVzIGNoYW5nZWQsIDM2IGluc2VydGlvbnMoKyksIDUg
ZGVsZXRpb25zKC0pDQo+ID4NCj4gPiAtLQ0KPiA+IDIuMTYuMQ0KPiANCj4gVGhpcyBsb29rcyBn
b29kIHRvIG1lLiBTbyB1bmxlc3Mgc29tZW9uZSBvYmplY3RzIEkgaW50ZW5kIHRvIHF1ZXVlDQo+
IHRoaXMgdXAgZm9yIDQuMjEsIG9uY2UgNC4yMCByYzEgaXMgb3V0LiBPciBwZXJoYXBzIHRoZSBj
bG9jayBwYXRjaA0KPiBzaG91bGQgZ28gdmlhIHRoZSBjbG9jayB0cmVlPw0KPiANCj4gVGhhbmtz
IQ0KPiBVZmZlDQoNCkZZSSwNCg0KSSBqdXN0IHRyaWVkIHRvIGFwcGx5IG15IHBhdGNoZXMgdG8g
d2hhdCBpcyBpbiAtbmV4dC4NCkl0IGxvb2tzIGxpa2VzIEZhYnJpemlvIGJlYXQgbWUgdG8gaXQg
KFJaL0cxQyBoYXMgdGhlIHNhbWUgY29udHJvbGxlciksIA0Kc28gdGhlcmUgd2lsbCBiZSBjb25m
bGljdHMgYmVjYXVzZSB3ZSB3ZXJlIGJvdGggYmUgbW9kaWZ5aW5nIHRoZSBzYW1lIA0KbGluZXMg
aW4gS2NvbmZpZyBhbmQgaW4gdGhlIGRyaXZlciAoYWRkaW5nIHRoZSBjb21wYXRpYmxlIHN0cmlu
Z3MpLg0KDQpJdCBhbHNvIGxvb2tzIGxpa2UgRmFicml6aW8gc3RhcnRlZCB1c2luZyB0aGUgbmFt
ZSANCiJyZW5lc2FzLHNkaGktbW1jLXh4eHgiIChhcyBpbiwgYWRkZWQgdGhlICctbW1jJyksIGJ1
dCBJJ2xsIHByb2JhYmx5DQpqdXN0IGtlZXAgbWluZSB0aGUgd2F5IGl0IGlzIChubyAnLW1tYycp
Lg0KDQoNClNvIGlmIHlvdSBkb24ndCBmZWVsIGxpa2UgZml4aW5nIGl0IHVwLCBsZXQgbWUga25v
dyBhbmQgSSdsbCBzZW5kIGFuIHVwZGF0ZS4NCg0KDQpDaHJpcw0KDQo=

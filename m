From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH v3 2/2] clocksource: Add renesas-ostm timer driver
Date: Wed, 25 Jan 2017 13:32:19 +0000
Message-ID: <SG2PR06MB1165830ACADF14E3E65CAA728A740@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20170123135423.28780-1-chris.brandt@renesas.com>
 <20170123135423.28780-3-chris.brandt@renesas.com> <20170123175210.GH2166@mai>
 <SG2PR06MB11657AE9653A4B66B1EA02718A750@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <20170124143222.GA2021@mai>
 <SG2PR06MB11652097D0BFA1A058F9CFBC8A750@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAMuHMdXHqDrmvaCBCXy5gHJ9h0_6S7g8R0ji=Sb5TSoH2s57Gw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdXHqDrmvaCBCXy5gHJ9h0_6S7g8R0ji=Sb5TSoH2s57Gw@mail.gmail.com>
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Thomas Gleixner <tglx@linutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

SGkgR2VlcnQsDQoNCk9uIFdlZG5lc2RheSwgSmFudWFyeSAyNSwgMjAxNywgR2VlcnQgVXl0dGVy
aG9ldmVuIHdyb3RlOg0KPiA+IFNvIEkgcmVhbGl6ZWQgdGhhdCBpbiBvcmRlciB0byB1c2UgYnVp
bHRpbl9wbGF0Zm9ybSwgSSBjYW4ndCBoYXZlIGFueQ0KPiA+IG9mIHRoZSBmdW5jdGlvbnMgaW4g
X19pbml0IGJlY2F1c2UgdGhlIGJ1aWxkIHN5c3RlbSBoYXMgbm8gaWRlYSB0aGF0IEkNCj4gPiBu
ZXZlciBwbGFuIG9uIHJlbW92aW5nIG9yIHByb2JpbmcgYWdhaW4gYWZ0ZXIgYm9vdC4gQnV0LCBl
dmVuIGlmIEkNCj4gPiB0YWtlIG91dCBhbGwgdGhlIF9faW5pdCBmcm9tIG15IGNvZGUsIEknbSBz
dGlsbCBjYWxsaW5nDQo+ID4gY2xvY2tzb3VyY2VfbW1pb19pbml0IHdoaWNoIGlzIF9faW5pdCBz
byBJIGNhbiBuZXZlciBlc2NhcGUgdGhlICJTZWN0aW9uDQo+IG1pc21hdGNoIi4NCj4gDQo+IEZv
ciBzaW5nbGUtcHJvYmUgZHJpdmVycywgeW91IGNhbiB1c2UgYnVpbHRpbl9wbGF0Zm9ybV9kcml2
ZXJfcHJvYmUoKS4NCg0KDQpUaGFuayB5b3UgZm9yIHRoZSBpbmZvLg0KDQoNCkNocmlzDQoNCg==

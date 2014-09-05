From: "Chen, Alvin" <alvin.chen@intel.com>
Subject: RE: [PATCH 2/3 v2] GPIO: gpio-dwapb: Support Debounce
Date: Fri, 5 Sep 2014 09:35:24 +0000
Message-ID: <4656BEB6164FC34F8171C6538F1A595B2E98298B@SHSMSX101.ccr.corp.intel.com>
References: <1409928798-31895-1-git-send-email-alvin.chen@intel.com>
	 <1409928798-31895-3-git-send-email-alvin.chen@intel.com>
 <1409908999.30155.85.camel@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1409908999.30155.85.camel@intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "Shevchenko, Andriy" <andriy.shevchenko@intel.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "Kweh, Hock Leong" <hock.leong.kweh@intel.com>, "sebastian@breakpoint.cc" <sebastian@breakpoint.cc>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Ong, Boon Leong" <boon.leong.ong@intel.com>, "gnurou@gmail.com" <gnurou@gmail.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "Westerberg, Mika" <mika.westerberg@intel.com>, "dvhart@linux.intel.com" <dvhart@linux.intel.com>, "atull@opensource.altera.com" <atull@opensource.altera.com>
List-Id: devicetree@vger.kernel.org

PiBTdWJqZWN0OiBSZTogW1BBVENIIDIvMyB2Ml0gR1BJTzogZ3Bpby1kd2FwYjogU3VwcG9ydCBE
ZWJvdW5jZQ0KPiANCj4gT24gRnJpLCAyMDE0LTA5LTA1IGF0IDA3OjUzIC0wNzAwLCBXZWlrZSBD
aGVuIHdyb3RlOg0KPiA+IFRoaXMgcGF0Y2ggZW5hYmxlcyAnZGVib3VuY2UnIGZvciB0aGUgZGVz
aWdud2FyZSBHUElPLCBhbmQgaXQgaXMgYmFzZWQNCj4gPiBvbiBKb3NlZiBBaG1hZCdzIHByZXZp
b3VzIHdvcmsuDQo+IA0KPiBDYW4gd2Ugc3BsaXQgZHdhcGJfcmVhZC93cml0ZSBpbnRyb2R1Y2lu
ZyBhbmQgY2hhbmdpbmcgZnJvbSB0aGlzIHBhdGNoIHRvIGENCj4gc2VwYXJhdGUgb25lPw0KPiAN
ClNpbmNlIHRoZSAnZGVib3VuY2UnIGZlYXR1cmUgYWxzbyBuZWVkcyByZWFkL3dyaXRlLCBpZiB3
ZSBzcGxpdGUgdGhpcyBwYXRjaCwgdGhlbiBmb3IgJ2RlYm91bmNlJywNCk9uZSBwYXRjaCB1c2Ug
cmVhZGwvd3JpdGVsLCBhbmQgYW5vdGhlciBwYXRjaCBjaGFuZ2UgdG8gZHdhcGJfcmVhZC93cml0
ZS4gSXQgc2VlbXMgZHVwbGljYXRlIHNpbmNlDQp0aGUgcHJldmlvdXMgcGF0Y2ggdXNlIHJlYWRs
L3dyaXRlbCBhbmQgdGhlIGZsbG93aW5nIG9uZSBjaGFuZ2UgaXQgaW1tZWRpYXRlbHkuDQpTaW5j
ZSB0aGlzIHBhdGNoIGlzIHNtYWxsLCBjb3VsZCB3ZSBqdXN0IG1ha2UgdGhlbSB0b2dldGhlcj8g
SG93IGRvIHlvdSB0aGluaz8NCg==

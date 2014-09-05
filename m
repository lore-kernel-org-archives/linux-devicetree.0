From: "Shevchenko, Andriy" <andriy.shevchenko@intel.com>
Subject: Re: [PATCH 2/3 v2] GPIO: gpio-dwapb: Support Debounce
Date: Fri, 5 Sep 2014 12:03:41 +0000
Message-ID: <1409918621.30155.90.camel@intel.com>
References: <1409928798-31895-1-git-send-email-alvin.chen@intel.com>
	 <1409928798-31895-3-git-send-email-alvin.chen@intel.com>
	 <1409908999.30155.85.camel@intel.com>
	 <4656BEB6164FC34F8171C6538F1A595B2E98298B@SHSMSX101.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <4656BEB6164FC34F8171C6538F1A595B2E98298B@SHSMSX101.ccr.corp.intel.com>
Content-Language: en-US
Content-ID: <9D13CE650961014F84335F080D1C19F3@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
To: "Chen, Alvin" <alvin.chen@intel.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "Kweh, Hock Leong" <hock.leong.kweh@intel.com>, "sebastian@breakpoint.cc" <sebastian@breakpoint.cc>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Ong, Boon Leong" <boon.leong.ong@intel.com>, "gnurou@gmail.com" <gnurou@gmail.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "Westerberg, Mika" <mika.westerberg@intel.com>, "dvhart@linux.intel.com" <dvhart@linux.intel.com>, "atull@opensource.altera.com" <atull@opensource.altera.com>
List-Id: devicetree@vger.kernel.org

T24gRnJpLCAyMDE0LTA5LTA1IGF0IDA5OjM1ICswMDAwLCBDaGVuLCBBbHZpbiB3cm90ZToNCj4g
PiBTdWJqZWN0OiBSZTogW1BBVENIIDIvMyB2Ml0gR1BJTzogZ3Bpby1kd2FwYjogU3VwcG9ydCBE
ZWJvdW5jZQ0KPiA+IA0KPiA+IE9uIEZyaSwgMjAxNC0wOS0wNSBhdCAwNzo1MyAtMDcwMCwgV2Vp
a2UgQ2hlbiB3cm90ZToNCj4gPiA+IFRoaXMgcGF0Y2ggZW5hYmxlcyAnZGVib3VuY2UnIGZvciB0
aGUgZGVzaWdud2FyZSBHUElPLCBhbmQgaXQgaXMgYmFzZWQNCj4gPiA+IG9uIEpvc2VmIEFobWFk
J3MgcHJldmlvdXMgd29yay4NCj4gPiANCj4gPiBDYW4gd2Ugc3BsaXQgZHdhcGJfcmVhZC93cml0
ZSBpbnRyb2R1Y2luZyBhbmQgY2hhbmdpbmcgZnJvbSB0aGlzIHBhdGNoIHRvIGENCj4gPiBzZXBh
cmF0ZSBvbmU/DQo+ID4gDQo+IFNpbmNlIHRoZSAnZGVib3VuY2UnIGZlYXR1cmUgYWxzbyBuZWVk
cyByZWFkL3dyaXRlLCBpZiB3ZSBzcGxpdGUgdGhpcyBwYXRjaCwgdGhlbiBmb3IgJ2RlYm91bmNl
JywNCj4gT25lIHBhdGNoIHVzZSByZWFkbC93cml0ZWwsIGFuZCBhbm90aGVyIHBhdGNoIGNoYW5n
ZSB0byBkd2FwYl9yZWFkL3dyaXRlLiBJdCBzZWVtcyBkdXBsaWNhdGUgc2luY2UNCj4gdGhlIHBy
ZXZpb3VzIHBhdGNoIHVzZSByZWFkbC93cml0ZWwgYW5kIHRoZSBmbGxvd2luZyBvbmUgY2hhbmdl
IGl0IGltbWVkaWF0ZWx5Lg0KPiBTaW5jZSB0aGlzIHBhdGNoIGlzIHNtYWxsLCBjb3VsZCB3ZSBq
dXN0IG1ha2UgdGhlbSB0b2dldGhlcj8gSG93IGRvIHlvdSB0aGluaz8NCg0KTWFrZSB0aGUgZHdh
cGJfd3JpdGVsL3JlYWRsIHBhdGNoIGdvZXMgZmlyc3QgaW4gdGhlIHNlcmllcy4NCg0KLS0gDQpB
bmR5IFNoZXZjaGVua28gPGFuZHJpeS5zaGV2Y2hlbmtvQGludGVsLmNvbT4NCkludGVsIEZpbmxh
bmQgT3kNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQpJbnRlbCBGaW5sYW5kIE95ClJlZ2lzdGVyZWQgQWRkcmVzczog
UEwgMjgxLCAwMDE4MSBIZWxzaW5raSAKQnVzaW5lc3MgSWRlbnRpdHkgQ29kZTogMDM1NzYwNiAt
IDQgCkRvbWljaWxlZCBpbiBIZWxzaW5raSAKClRoaXMgZS1tYWlsIGFuZCBhbnkgYXR0YWNobWVu
dHMgbWF5IGNvbnRhaW4gY29uZmlkZW50aWFsIG1hdGVyaWFsIGZvcgp0aGUgc29sZSB1c2Ugb2Yg
dGhlIGludGVuZGVkIHJlY2lwaWVudChzKS4gQW55IHJldmlldyBvciBkaXN0cmlidXRpb24KYnkg
b3RoZXJzIGlzIHN0cmljdGx5IHByb2hpYml0ZWQuIElmIHlvdSBhcmUgbm90IHRoZSBpbnRlbmRl
ZApyZWNpcGllbnQsIHBsZWFzZSBjb250YWN0IHRoZSBzZW5kZXIgYW5kIGRlbGV0ZSBhbGwgY29w
aWVzLgo=


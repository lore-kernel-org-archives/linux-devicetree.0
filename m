From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Subject: Re: [PATCH] ARC: reset: introduce HSDKv1 reset driver
Date: Wed, 19 Jul 2017 15:32:22 +0000
Message-ID: <1500478342.9320.28.camel@synopsys.com>
References: <20170718172520.25546-1-Eugeniy.Paltsev@synopsys.com>
         <1500476858.2364.45.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1500476858.2364.45.camel@pengutronix.de>
Content-Language: en-US
Content-ID: <63031B30951FEB488F834D15D0A77D33@internal.synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Eugeniy.Paltsev@synopsys.com" <Eugeniy.Paltsev@synopsys.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

SGkgUGhpbGlwcCwNCg0KT24gV2VkLCAyMDE3LTA3LTE5IGF0IDE3OjA3ICswMjAwLCBQaGlsaXBw
IFphYmVsIHdyb3RlOg0KPiBPbiBUdWUsIDIwMTctMDctMTggYXQgMjA6MjUgKzAzMDAsIEV1Z2Vu
aXkgUGFsdHNldiB3cm90ZToNCj4gPiBUaGUgSFNESyB2MSBwZXJpcGhlcnkgSVBzIGNhbiBiZSBy
ZXNldCBieSBhY2Nlc3Npbmcgc29tZSByZWdpc3RlcnMNCj4gPiBmcm9tIHRoZSBDR1UgYmxvY2su
DQo+ID4gDQo+ID4gVGhlIGxpc3Qgb2YgYXZhaWxhYmxlIHJlc2V0IGxpbmVzIGlzIGRvY3VtZW50
ZWQgaW4gdGhlIERUIGJpbmRpbmdzLg0KPiA+IA0KPiA+IFtzbmlwXQ0KPiA+IC0tLSBhL2RyaXZl
cnMvcmVzZXQvS2NvbmZpZw0KPiA+ICsrKyBiL2RyaXZlcnMvcmVzZXQvS2NvbmZpZw0KPiA+IEBA
IC0zNCw2ICszNCwxMiBAQCBjb25maWcgUkVTRVRfQkVSTElODQo+ID4gwqAJaGVscA0KPiA+IMKg
CcKgwqBUaGlzIGVuYWJsZXMgdGhlIHJlc2V0IGNvbnRyb2xsZXIgZHJpdmVyIGZvciBNYXJ2ZWxs
DQo+ID4gQmVybGluIFNvQ3MuDQo+ID4gwqANCj4gPiArY29uZmlnIFJFU0VUX0hTREtfVjENCj4g
PiArCWJvb2wgIkhTREsgdjEgUmVzZXQgRHJpdmVyIg0KPiA+ICsJZGVmYXVsdCBuDQo+IA0KPiBJ
IHN1cHBvc2UgdGhlcmUgd2lsbCBiZSBhIFNPQ19IU0RLX1YxIG9yIHNpbWlsYXIgaW4gdGhlIGZ1
dHVyZSBzbw0KPiB0aGF0DQo+IHdlIGNhbiBoaWRlIHRoaXMgb3B0aW9uIGFuZCBlbmFibGUgaXQg
YnkgZGVmYXVsdCBsaWtlIHRoZSBvdGhlciByZXNldA0KPiBkcml2ZXJzPw0KQWN0dWFsbHkgd2Ug
ZG9uJ3QgaGF2ZSAoYW5kIGRvbid0IHBsYW5uaW5nIHRvIGFkZCkgc3VjaCBTT0MvYm9hcmQtDQpz
cGVjaWZpYyBrY29uZmlnIG9wdGlvbiwgc28gSSBhbSB3b25kZXJpbmcgaWYgaXQgaXMgT0sgdG8g
anVzdCBsZWZ0DQp0aGlzIG9wdGlvbiBub3QgaGlkZGVuPw0KDQo+ID4gW3NuaXBdDQo+ID4gKw0K
PiA+ICsjZGVmaW5lIENHVV9BUkNfUlNUX0NUUkwJCTB4MA0KPiA+ICsjZGVmaW5lIENHVV9TWVNf
UlNUX0NUUkwJCTB4MjANCj4gPiArI2RlZmluZSBDR1VfRERSX1JTVF9DVFJMCQkweDQwDQo+ID4g
KyNkZWZpbmUgQ0dVX1RVTl9SU1RfQ1RSTAkJMHg2MA0KPiANCj4gVGhlIEFSQywgRERSLCBhbmQg
VFVOIHJlc2V0IGNvbnRyb2wgcmVnaXN0ZXJzIGFyZSBuZXZlciB1c2VkLg0KT2ssIEknbGwgcmVt
b3ZlIHVudXNlZCByZWdpc3RlciBkZWZpbmVzLg0KDQo+ID4gW3NuaXBdDQo+IA0KPiByZWdhcmRz
DQo+IFBoaWxpcHANCj4gDQpUaGFua3MuDQotLSANCsKgRXVnZW5peSBQYWx0c2V2

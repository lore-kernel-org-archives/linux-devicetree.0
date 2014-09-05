From: "Chen, Alvin" <alvin.chen@intel.com>
Subject: RE: [PATCH 3/3] GPIO: gpio-dwapb: Suspend & Resume PM enabling
Date: Fri, 5 Sep 2014 02:09:22 +0000
Message-ID: <4656BEB6164FC34F8171C6538F1A595B2E9826A6@SHSMSX101.ccr.corp.intel.com>
References: <1409161588-19417-1-git-send-email-alvin.chen@intel.com>
	<1409161588-19417-4-git-send-email-alvin.chen@intel.com>
 <CACRpkdZJSf+EfYN=hHxRnpjQZGuqroBL0c+08Ng=dRkS0GZySA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZJSf+EfYN=hHxRnpjQZGuqroBL0c+08Ng=dRkS0GZySA@mail.gmail.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Ong, Boon Leong" <boon.leong.ong@intel.com>, "Shevchenko, Andriy" <andriy.shevchenko@intel.com>, "Westerberg, Mika" <mika.westerberg@intel.com>, "Kweh, Hock Leong" <hock.leong.kweh@intel.com>, Darren Hart <dvhart@linux.intel.com>
List-Id: devicetree@vger.kernel.org

PiANCj4gPiArI2lmIGRlZmluZWQgQ09ORklHX1BNX1NMRUVQDQo+IA0KPiBJIHdvbmRlciB3aGV0
aGVyIGl0J3Mgd29ydGggI2lmZGVmOmluIG91dCBzdWNoIHRoaW5ncywgaXQgY2x1dHRlcnMgdGhl
IHBsYWNlLg0KT0suIEkgd2lsbCB1c2UgJyNpZmRlZicuDQo+IA0KPiA+ICsvKiBTdG9yZSBHUElP
IGNvbnRleHQgYWNyb3NzIHN5c3RlbS13aWRlIHN1c3BlbmQvcmVzdW1lIHRyYW5zaXRpb25zDQo+
ID4gKyovIHN0YXRpYyBzdHJ1Y3QgZ3Bpb19zYXZlZF9yZWdzIHsNCj4gDQo+IENhbGwgdGhlIHN0
cnVjdDoNCj4gDQo+IHN0cnVjdCBkd2FwYl9jb250ZXh0DQo+IA0KPiBiZWNhdXNlIHRoYXQgaXMg
ZWFzaWVyIHRvIHVuZGVyc3RhbmQuDQo+IA0KT0suDQoNCj4gPiArICAgICAgIHVuc2lnbmVkIGxv
bmcgZGF0YTsNCj4gPiArICAgICAgIHVuc2lnbmVkIGxvbmcgZGlyOw0KPiA+ICsgICAgICAgdW5z
aWduZWQgbG9uZyBpbnRfZW47DQo+ID4gKyAgICAgICB1bnNpZ25lZCBsb25nIGludF9tYXNrOw0K
PiA+ICsgICAgICAgdW5zaWduZWQgbG9uZyBpbnRfdHlwZTsNCj4gPiArICAgICAgIHVuc2lnbmVk
IGxvbmcgaW50X3BvbDsNCj4gPiArICAgICAgIHVuc2lnbmVkIGxvbmcgaW50X2RlYjsNCj4gPiAr
fSBzYXZlZF9yZWdzOw0KPiANCj4gU2luZ2xldG9uIGh1aD8NCj4gDQo+IEluc2VydCB0aGlzIGlu
dG8gdGhlIGR5bmFtaWNhbGx5IGFsbG9jYXRlZCBwZXItcG9ydCBvciBjaGlwIHN0cnVjdCBpbnN0
ZWFkLg0KPiANCkhvdyBhYm91dCB0aGUgZm9sbG93aW5nPw0KDQpzdGF0aWMgc3RydWN0IGR3YXBi
X2NvbnRleHQgew0KCXUzMiBkYXRhW0RXQVBCX01BWF9QT1JUU107DQoJdTMyIGRpcltEV0FQQl9N
QVhfUE9SVFNdOw0KCXUzMiBleHRbRFdBUEJfTUFYX1BPUlRTXTsNCgl1MzIgaW50X2VuOw0KCXUz
MiBpbnRfbWFzazsNCgl1MzIgaW50X3R5cGU7DQoJdTMyIGludF9wb2w7DQoJdTMyIGludF9kZWI7
DQp9IGR3YXBiX2NvbnRleHQ7DQoNClNpbmNlIG9ubHkgcG9ydEEgY2FuIHN1cHBvcnQgaXJxLCBh
bmQgdGhlIGlycSByZWxhdGVkIHJlZ2lzdGVycyBhcmUgb25seSBmb3IgcG9ydEEuIENvbXBhcmlu
ZyB0byBhbGxvY2F0ZSBmb3IgZWFjaCBwb3J0DQpkeW5hbWljYWxseSwgaXQgaXMgbW9yZSBkaXJl
Y3RseSBhbmQgZWFzeSB0byB1bmRlcnN0YW5kLiANCg0KDQo+ICsgICAgICAgZHdhcGJfd3JpdGUo
Z3BpbywgR1BJT19TV1BPUlRBX0RSLCBzYXZlZF9yZWdzLmRhdGEpOw0KPiArICAgICAgIGR3YXBi
X3dyaXRlKGdwaW8sIEdQSU9fU1dQT1JUQV9ERFIsIHNhdmVkX3JlZ3MuZGlyKTsNCj4gDQo+IEFu
ZCBwb3J0IEIsIEMsIEQ/DQo+IA0KPiBUaGlzIGxvb2tzIGxpa2UgYSBjcnVkZSBoYWNrLg0KSSB3
aWxsIGFkZCBwb3J0IEIsIEMsIEQuDQo+IA0KPiBZb3VycywNCj4gTGludXMgV2FsbGVpag0K

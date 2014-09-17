From: "Chen, Alvin" <alvin.chen@intel.com>
Subject: RE: [PATCH 4/4 v4] GPIO: gpio-dwapb: Suspend & Resume PM enabling
Date: Wed, 17 Sep 2014 06:46:11 +0000
Message-ID: <4656BEB6164FC34F8171C6538F1A595B2E99253F@SHSMSX101.ccr.corp.intel.com>
References: <1410859335-11080-1-git-send-email-alvin.chen@intel.com>
	 <1410859335-11080-5-git-send-email-alvin.chen@intel.com>
 <1410852405.7023.48.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1410852405.7023.48.camel@linux.intel.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, atull <atull@opensource.altera.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Ong, Boon Leong" <boon.leong.ong@intel.com>, "Kweh, Hock Leong" <hock.leong.kweh@intel.com>, Darren Hart <dvhart@linux.intel.com>, Sebastian Andrzej Siewior <sebastian@breakpoint.cc>, "Westerberg, Mika" <mika.westerberg@intel.com>, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

PiANCj4gPiBSZXZpZXdlZC1ieTogSG9jayBMZW9uZyBLd2VoIDxob2NrLmxlb25nLmt3ZWhAaW50
ZWwuY29tPg0KPiANCj4gWW91IHN0aWxsIGtlZXAgdGhhdCBndXkgYXMgcmV2aWV3ZXIgaW4gYSB3
aG9sZSBzZXJpZXMsIGhvd2V2ZXIgSSBkaWRuJ3Qgc2VlIGENCj4gd29yZCBmcm9tIGhpbSBoZXJl
LiBIb3cgaXMgaXQgcG9zc2libGU/DQpJbiBvdXIgaW50ZXJuYWwgcmV2aWV3LCBoZSBnYXZlIG1l
IGEgbG90IG9mIHN1Z2dlc3Rpb25zLiANCg0KPiA+ICsJZm9yIChpID0gMDsgaSA8IGdwaW8tPm5y
X3BvcnRzOyBpKyspIHsNCj4gPiArCQl1bnNpZ25lZCBpbnQgb2Zmc2V0Ow0KPiA+ICsJCXVuc2ln
bmVkIGludCBpZHggPSBncGlvLT5wb3J0c1tpXS5pZHg7DQo+ID4gKwkJc3RydWN0IGR3YXBiX2Nv
bnRleHQgKmN0eCA9IGdwaW8tPnBvcnRzW2ldLmN0eDsNCj4gPiArDQo+ID4gKwkJaWYgKCFjdHgp
IHsNCj4gPiArCQkJY3R4ID0gZGV2bV9remFsbG9jKGRldiwgc2l6ZW9mKCpjdHgpLCBHRlBfS0VS
TkVMKTsNCj4gPiArCQkJZ3Bpby0+cG9ydHNbaV0uY3R4ID0gY3R4Ow0KPiA+ICsJCX0NCj4gDQo+
IEkgZG9uJ3QgdGhpbmsgaXQncyBhIHJpZ2h0IHBsYWNlIHRvIGFsbG9jYXRlIHRoaXMgcmVzb3Vy
Y2UsIGVzcGVjaWFsbHkgd2l0aCBkZXZtXw0KPiBoZWxwZXIuIENhbiB5b3UgbW92ZSB0aGlzIHRv
IHByb2JlKCkgc3RhZ2U/DQo+IA0KPiBPciB5b3UgZXZlbiBjYW4gZW1iZWQgY29udGV4IHN0cnVj
dHVyZSBpbnNpZGUgY2hpcCBvbmUgd2l0aCAjaWZkZWYNCj4gQ09ORklHX1BNX1NMRUVQLg0KPiAN
Cg0KT0ssIEkgd2lsbCBpbXByb3ZlIGl0Lg0KDQo+IE1heWJlIG90aGVycyBjb3VsZCBjb21tZW50
IG9uIHRoaXMuDQo+IA0KPiA+ICsNCj4gPiArCQlvZmZzZXQgPSBHUElPX1NXUE9SVEFfRERSICsg
KGlkeCAqIEdQSU9fU1dQT1JUX0REUl9TSVpFKTsNCj4gDQo+IE5vIG5lZWQgdG8gaGF2ZSBwYXJl
bnRoZXNlcyBoZXJlLiBDaGVjayB0aGUgY29kZSBiZWxvdyBhcyB3ZWxsLg0KT0suIEkgd2lsbCBy
ZW1vdmUgdGhlbS4NCg==

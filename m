From: "Chen, Alvin" <alvin.chen@intel.com>
Subject: RE: [PATCH 3/4 v4] GPIO: gpio-dwapb: Support Debounce
Date: Wed, 17 Sep 2014 06:47:35 +0000
Message-ID: <4656BEB6164FC34F8171C6538F1A595B2E99254E@SHSMSX101.ccr.corp.intel.com>
References: <1410859335-11080-1-git-send-email-alvin.chen@intel.com>
	 <1410859335-11080-4-git-send-email-alvin.chen@intel.com>
 <1410856669.7023.54.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1410856669.7023.54.camel@linux.intel.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, atull <atull@opensource.altera.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Ong, Boon Leong" <boon.leong.ong@intel.com>, "Kweh, Hock Leong" <hock.leong.kweh@intel.com>, Darren Hart <dvhart@linux.intel.com>, Sebastian Andrzej Siewior <sebastian@breakpoint.cc>, "Westerberg, Mika" <mika.westerberg@intel.com>, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

PiA+ICsJc3RydWN0IGJncGlvX2NoaXAgKmJnYyA9IHRvX2JncGlvX2NoaXAoZ2MpOw0KPiA+ICsJ
c3RydWN0IGR3YXBiX2dwaW9fcG9ydCAqcG9ydCA9DQo+ID4gKwkJCWNvbnRhaW5lcl9vZihiZ2Ms
IHN0cnVjdCBkd2FwYl9ncGlvX3BvcnQsIGJnYyk7DQo+IA0KPiBEb2VzIGl0IG1ha2Ugc2Vuc2Ug
dG8gaW50cm9kdWNlIGFuIGlubGluZSBoZWxwZXIgbGlrZQ0KPiANCj4gc3RhdGljIGlubGluZSBz
dHJ1Y3QgZHdhcGJfZ3Bpb19wb3J0ICp0b19kd2FwYl9ncGlvX3BvcnQoc3RydWN0IGJncGlvX2No
aXANCj4gKmdjKSB7Li4ufQ0KPiANCj4gPw0KDQpPSy4NCg0KPiBUaGVyZSBpcyBhbHNvIGFub3Ro
ZXIgcGxhY2Ugd2hlcmUgaXQgY291bGQgYmUgdXNlZC4NCj4gDQo+ID4gKwlzdHJ1Y3QgZHdhcGJf
Z3BpbyAqZ3BpbyA9IHBvcnQtPmdwaW87DQo+ID4gKwl1bnNpZ25lZCBsb25nIGZsYWdzLCB2YWxf
ZGViOw0KPiA+ICsJdW5zaWduZWQgbG9uZyBtYXNrID0gYmdjLT5waW4ybWFzayhiZ2MsIG9mZnNl
dCk7DQo+ID4gKw0KPiA+ICsJc3Bpbl9sb2NrX2lycXNhdmUoJmJnYy0+bG9jaywgZmxhZ3MpOw0K
PiA+ICsNCj4gPiArCXZhbF9kZWIgPSBkd2FwYl9yZWFkKGdwaW8sIEdQSU9fUE9SVEFfREVCT1VO
Q0UpOw0KPiA+ICsJaWYgKGRlYm91bmNlKQ0KPiA+ICsJCWR3YXBiX3dyaXRlKGdwaW8sIEdQSU9f
UE9SVEFfREVCT1VOQ0UsIG1hc2sgfCB2YWxfZGViKTsNCj4gDQo+IE1heSB5b3UgcHV0IHZhbHVl
IG9uIHRoZSBmaXJzdCBwbGFjZT8gTGlrZSAndmFsX2RlYiB8IG1hc2snLg0KDQpPSy4NCg0KPiA+
ICsJZWxzZQ0KPiA+ICsJCWR3YXBiX3dyaXRlKGdwaW8sIEdQSU9fUE9SVEFfREVCT1VOQ0UsIH5t
YXNrICYgdmFsX2RlYik7DQo+IA0KPiBEaXR0by4NCj4gDQpPSy4NCj4gPiArDQoNCg==

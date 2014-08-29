From: "Shevchenko, Andriy" <andriy.shevchenko@intel.com>
Subject: Re: [PATCH 2/3] GPIO: gpio-dwapb: Support Debounce
Date: Fri, 29 Aug 2014 07:38:04 +0000
Message-ID: <1409297883.30155.29.camel@intel.com>
References: <1409161588-19417-1-git-send-email-alvin.chen@intel.com>
	 <1409161588-19417-3-git-send-email-alvin.chen@intel.com>
	 <alpine.DEB.2.02.1408281007290.26299@atx-linux-37>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.02.1408281007290.26299@atx-linux-37>
Content-Language: en-US
Content-ID: <DB08BCA516C8BA43817BDBC6326C36AB@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
To: "atull@opensource.altera.com" <atull@opensource.altera.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "Chen, Alvin" <alvin.chen@intel.com>, "Kweh, Hock Leong" <hock.leong.kweh@intel.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Ong, Boon Leong" <boon.leong.ong@intel.com>, "gnurou@gmail.com" <gnurou@gmail.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "Westerberg, Mika" <mika.westerberg@intel.com>, "dvhart@linux.intel.com" <dvhart@linux.intel.com>
List-Id: devicetree@vger.kernel.org

T24gVGh1LCAyMDE0LTA4LTI4IGF0IDEwOjExIC0wNTAwLCBhdHVsbCB3cm90ZToNCj4gT24gV2Vk
LCAyNyBBdWcgMjAxNCwgV2Vpa2UgQ2hlbiB3cm90ZToNCg0KW10NCg0KPiA+ICtzdGF0aWMgaW5s
aW5lIHUzMiBkd2FwYl9yZWFkKHN0cnVjdCBkd2FwYl9ncGlvICpncGlvLCB1bnNpZ25lZCBpbnQg
b2Zmc2V0KQ0KPiA+ICt7DQo+ID4gKwlzdHJ1Y3QgYmdwaW9fY2hpcCAqYmdjCT0gJmdwaW8tPnBv
cnRzWzBdLmJnYzsNCj4gPiArCXZvaWQgX19pb21lbSAqcmVnX2Jhc2UJPSBncGlvLT5yZWdzOw0K
PiA+ICsNCj4gPiArCXJldHVybiBiZ2MtPnJlYWRfcmVnKHJlZ19iYXNlICsgb2Zmc2V0KTsNCj4g
PiArfQ0KPiA+ICsNCj4gPiArc3RhdGljIGlubGluZSB2b2lkIGR3YXBiX3dyaXRlKHN0cnVjdCBk
d2FwYl9ncGlvICpncGlvLCB1bnNpZ25lZCBpbnQgb2Zmc2V0LA0KPiA+ICsJCQkgICAgICAgdTMy
IHZhbCkNCj4gPiArew0KPiA+ICsJc3RydWN0IGJncGlvX2NoaXAgKmJnYwk9ICZncGlvLT5wb3J0
c1swXS5iZ2M7DQo+ID4gKwl2b2lkIF9faW9tZW0gKnJlZ19iYXNlCT0gZ3Bpby0+cmVnczsNCj4g
PiArDQo+ID4gKwliZ2MtPndyaXRlX3JlZyhyZWdfYmFzZSArIG9mZnNldCwgdmFsKTsNCj4gPiAr
fQ0KPiA+ICsNCj4gDQo+IEhlbGxvLA0KPiANCj4gSSBkb24ndCB1bmRlcnN0YW5kIHRoZSByZWFz
b24gZm9yIGFkZGluZyBkd2FwYl9yZWFkIGFuZCBkd2FwYl93cml0ZSBoZXJlLiAgDQo+IFRoZSBy
ZXN0IG9mIHRoZSBkcml2ZXIgaXMgdXNpbmcgcmVhZGwgYW5kIHdyaXRlbC4gIEknZCByYXRoZXIg
bm90IHNlZSB0d28gDQo+IGRpZmZlcmVudCBtZXRob2RzIGJlaW5nIHVzZWQgaW4gdGhlIHNhbWUg
ZHJpdmVyIGZvciByZWdpc3RlciBhY2Nlc3MuICANCj4gTWF5YmUgSSdtIG1pc3Npbmcgc29tZXRo
aW5nLCBidXQgaWYgd2UgbmVlZCB0byBhZGQgZHdhcGJfcmVhZC93cml0ZSwgdGhlbg0KPiBpdCBz
aG91bGQgYmUgdXNlZCBmb3IgYWxsIHJlZ2lzdGVyIGFjY2Vzcy4NCg0KQWxhbiwgaXQgd2FzIG15
IHByb3Bvc2FsLiBJIHJhdGhlciBhZ3JlZSB0aGF0IGlzIGJldHRlciB0byBjb252ZXJ0IGFsbA0K
YWNjZXNzZXMgdG8gdGhhdC4NCg0KLS0gDQpBbmR5IFNoZXZjaGVua28gPGFuZHJpeS5zaGV2Y2hl
bmtvQGludGVsLmNvbT4NCkludGVsIEZpbmxhbmQgT3kNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpJbnRlbCBGaW5s
YW5kIE95ClJlZ2lzdGVyZWQgQWRkcmVzczogUEwgMjgxLCAwMDE4MSBIZWxzaW5raSAKQnVzaW5l
c3MgSWRlbnRpdHkgQ29kZTogMDM1NzYwNiAtIDQgCkRvbWljaWxlZCBpbiBIZWxzaW5raSAKClRo
aXMgZS1tYWlsIGFuZCBhbnkgYXR0YWNobWVudHMgbWF5IGNvbnRhaW4gY29uZmlkZW50aWFsIG1h
dGVyaWFsIGZvcgp0aGUgc29sZSB1c2Ugb2YgdGhlIGludGVuZGVkIHJlY2lwaWVudChzKS4gQW55
IHJldmlldyBvciBkaXN0cmlidXRpb24KYnkgb3RoZXJzIGlzIHN0cmljdGx5IHByb2hpYml0ZWQu
IElmIHlvdSBhcmUgbm90IHRoZSBpbnRlbmRlZApyZWNpcGllbnQsIHBsZWFzZSBjb250YWN0IHRo
ZSBzZW5kZXIgYW5kIGRlbGV0ZSBhbGwgY29waWVzLgo=


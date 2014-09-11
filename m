From: "Shevchenko, Andriy" <andriy.shevchenko@intel.com>
Subject: Re: [PATCH 1/4 v3] GPIO: gpio-dwapb: Enable platform driver binding
 to MFD driver
Date: Thu, 11 Sep 2014 07:59:51 +0000
Message-ID: <1410422381.7023.15.camel@intel.com>
References: <1410286081-16653-1-git-send-email-alvin.chen@intel.com>
	 <1410286081-16653-2-git-send-email-alvin.chen@intel.com>
	 <alpine.DEB.2.02.1409101353500.2790@atx-linux-37>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.02.1409101353500.2790@atx-linux-37>
Content-Language: en-US
Content-ID: <02B140BC09EDAA45A1366FC6FDB253C7@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
To: "atull@opensource.altera.com" <atull@opensource.altera.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "Chen, Alvin" <alvin.chen@intel.com>, "Kweh, Hock Leong" <hock.leong.kweh@intel.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Ong, Boon Leong" <boon.leong.ong@intel.com>, "gnurou@gmail.com" <gnurou@gmail.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "sebastian@breakpoint.cc" <sebastian@breakpoint.cc>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "Westerberg, Mika" <mika.westerberg@intel.com>, "dvhart@linux.intel.com" <dvhart@linux.intel.com>, "arnd@arndb.de" <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

T24gV2VkLCAyMDE0LTA5LTEwIGF0IDE0OjExIC0wNTAwLCBhdHVsbCB3cm90ZToNCg0KW10NCg0K
PiA+ICBzdGF0aWMgaW50IGR3YXBiX2dwaW9fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikNCj4gPiAgew0KPiA+ICsJaW50IGk7DQo+ID4gIAlzdHJ1Y3QgcmVzb3VyY2UgKnJlczsN
Cj4gPiAgCXN0cnVjdCBkd2FwYl9ncGlvICpncGlvOw0KPiA+IC0Jc3RydWN0IGRldmljZV9ub2Rl
ICpucDsNCj4gPiAgCWludCBlcnI7DQo+ID4gLQl1bnNpZ25lZCBpbnQgb2ZmcyA9IDA7DQo+ID4g
KwlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2Ow0KPiA+ICsJc3RydWN0IGR3YXBiX3Bs
YXRmb3JtX2RhdGEgKnBkYXRhID0gZGV2X2dldF9wbGF0ZGF0YShkZXYpOw0KPiA+ICsJYm9vbCBp
c19wZGF0YV9hbGxvYyA9ICFwZGF0YTsNCj4gDQo+IFBsZWFzZSBjb21iaW5lIHRoZSBpbnQncyBp
biBvbmUgbGluZSAoaW50IGVyciwgaTspIGFuZCBwdXQgdGhlbSBhcw0KPiB0aGUgbGFzdCBvbmUg
b24gdGhpcyBsaXN0LiAgSXQgbG9va3MgdGhlIHNhbWUgdG8gdGhlIGNvbXBpbGVyIG9mDQo+IGNv
dXJzZSwgYnV0IG1vcmUgdW5pZm9ybSBmb3IgaHVtYW4gZXllcyA6KQ0KDQpEbyB5b3UgdGhpbmsg
aXQncyBhIGdvb2QgaWRlYT8gSW4gdGhpcyBjYXNlIEksIGZvciBleGFtcGxlLCB3b3VsZCBsaWtl
DQp0byBzZWUgaW50IGVyciBhcyBhIHNlcGFyYXRlIGxpbmUgYXQgdGhlIGVuZCBvZiBkZWZpbml0
aW9uIGJsb2NrLiBJdA0Kd291bGQgYmUgYmV0dGVyIHRvIGRpc3Rpbmd1aXNoIGNvdW50ZXJzIGFu
ZCByZXR1cm4gY29kZSBzdG9yYWdlLg0KTW9yZW92ZXIsIG9mdGVuIGNvdW50ZXJzIHdvdWxkIGJl
IHVuc2lnbmVkIGludC4NCg0KLS0gDQpBbmR5IFNoZXZjaGVua28gPGFuZHJpeS5zaGV2Y2hlbmtv
QGludGVsLmNvbT4NCkludGVsIEZpbmxhbmQgT3kNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpJbnRlbCBGaW5sYW5k
IE95ClJlZ2lzdGVyZWQgQWRkcmVzczogUEwgMjgxLCAwMDE4MSBIZWxzaW5raSAKQnVzaW5lc3Mg
SWRlbnRpdHkgQ29kZTogMDM1NzYwNiAtIDQgCkRvbWljaWxlZCBpbiBIZWxzaW5raSAKClRoaXMg
ZS1tYWlsIGFuZCBhbnkgYXR0YWNobWVudHMgbWF5IGNvbnRhaW4gY29uZmlkZW50aWFsIG1hdGVy
aWFsIGZvcgp0aGUgc29sZSB1c2Ugb2YgdGhlIGludGVuZGVkIHJlY2lwaWVudChzKS4gQW55IHJl
dmlldyBvciBkaXN0cmlidXRpb24KYnkgb3RoZXJzIGlzIHN0cmljdGx5IHByb2hpYml0ZWQuIElm
IHlvdSBhcmUgbm90IHRoZSBpbnRlbmRlZApyZWNpcGllbnQsIHBsZWFzZSBjb250YWN0IHRoZSBz
ZW5kZXIgYW5kIGRlbGV0ZSBhbGwgY29waWVzLgo=


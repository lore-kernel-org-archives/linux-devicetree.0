From: "Chen, Alvin" <alvin.chen@intel.com>
Subject: RE: [PATCH 3/3] GPIO: gpio-dwapb: Suspend & Resume PM enabling
Date: Fri, 5 Sep 2014 08:20:07 +0000
Message-ID: <4656BEB6164FC34F8171C6538F1A595B2E9828F8@SHSMSX101.ccr.corp.intel.com>
References: <1409161588-19417-1-git-send-email-alvin.chen@intel.com>
	<1409161588-19417-4-git-send-email-alvin.chen@intel.com>
	<CACRpkdZJSf+EfYN=hHxRnpjQZGuqroBL0c+08Ng=dRkS0GZySA@mail.gmail.com>
	<4656BEB6164FC34F8171C6538F1A595B2E9826A6@SHSMSX101.ccr.corp.intel.com>
 <CACRpkdYZ0W4+iGyP5bbARAAfrqcrG77PVCHKcGhnBXvpCHoqxw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYZ0W4+iGyP5bbARAAfrqcrG77PVCHKcGhnBXvpCHoqxw@mail.gmail.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Ong, Boon Leong" <boon.leong.ong@intel.com>, "Shevchenko, Andriy" <andriy.shevchenko@intel.com>, "Westerberg, Mika" <mika.westerberg@intel.com>, "Kweh, Hock Leong" <hock.leong.kweh@intel.com>, Darren Hart <dvhart@linux.intel.com>
List-Id: devicetree@vger.kernel.org

PiA+Pg0KPiA+PiBJbnNlcnQgdGhpcyBpbnRvIHRoZSBkeW5hbWljYWxseSBhbGxvY2F0ZWQgcGVy
LXBvcnQgb3IgY2hpcCBzdHJ1Y3QgaW5zdGVhZC4NCj4gPj4NCj4gPiBIb3cgYWJvdXQgdGhlIGZv
bGxvd2luZz8NCj4gPg0KPiA+IHN0YXRpYyBzdHJ1Y3QgZHdhcGJfY29udGV4dCB7DQo+ID4gICAg
ICAgICB1MzIgZGF0YVtEV0FQQl9NQVhfUE9SVFNdOw0KPiA+ICAgICAgICAgdTMyIGRpcltEV0FQ
Ql9NQVhfUE9SVFNdOw0KPiA+ICAgICAgICAgdTMyIGV4dFtEV0FQQl9NQVhfUE9SVFNdOw0KPiA+
ICAgICAgICAgdTMyIGludF9lbjsNCj4gPiAgICAgICAgIHUzMiBpbnRfbWFzazsNCj4gPiAgICAg
ICAgIHUzMiBpbnRfdHlwZTsNCj4gPiAgICAgICAgIHUzMiBpbnRfcG9sOw0KPiA+ICAgICAgICAg
dTMyIGludF9kZWI7DQo+ID4gfSBkd2FwYl9jb250ZXh0Ow0KPiANCj4gTk8gYmVjYXVzZSB0aGlz
IGlzIHN0aWxsIGEgc2luZ2xldG9uIHZhcmlhYmxlLiBQdXQgaXQgaW50byB0aGUgZHluYW1pY2Fs
bHkgYWxsb2NhdGVkDQo+IHN0cnVjdHMuDQo+IA0KPiA+IENvbXBhcmluZyB0byBhbGxvY2F0ZSBm
b3IgZWFjaCBwb3J0DQo+ID4gZHluYW1pY2FsbHksIGl0IGlzIG1vcmUgZGlyZWN0bHkgYW5kIGVh
c3kgdG8gdW5kZXJzdGFuZC4NCj4gDQo+IE5vLCBJIGRpc2FncmVlLiBUaGUgb3ZlcmFsbCBkZXNp
Z24gcGF0dGVybiBpbiB0aGUga2VybmVsIGlzIHRvIGFsbG9jYXRlIGFsbCBzdGF0ZQ0KPiBjb250
YWluZXJzIGR5bmFtaWNhbGx5Lg0KPiANCk9LLiBQbGVhc2UgYWxzbyBoZWxwIHJldmlldyB0aGUg
djIgSSBqdXN0IHNlbnQgb3V0LCBhbmQgYWZ0ZXIgZ2V0dGluZyBtb3JlIGZlZWRiYWNrcywgSSB3
aWxsIGltcHJvdmUgdGhpcyBwYXJ0IGluIHRoZSBuZXh0IHZlcnNpb24gdG9nZXRoZXIuDQoNCg0K
